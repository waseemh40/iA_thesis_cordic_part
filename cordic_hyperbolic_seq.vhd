----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:46:51 06/09/2016 
-- Design Name: 
-- Module Name:    cordic_hyperbolic_seq - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cordic_hyperbolic_seq is
    Port ( operand_a : in  STD_LOGIC_VECTOR (31 downto 0);
--           operand_b : in  STD_LOGIC_VECTOR (31 downto 0);
           sqrt 		: out  STD_LOGIC_VECTOR (31 downto 0);			
           clk 		: in  STD_LOGIC;
           rst 		: in  STD_LOGIC;
           start 		: in  STD_LOGIC;
           opr_done 	: out  STD_LOGIC);
end cordic_hyperbolic_seq;

architecture Behavioral of cordic_hyperbolic_seq is

	--computational signals
signal x_current,x_last : std_logic_vector(39 downto 0);
signal y_current,y_last : std_logic_vector(39 downto 0);
signal z_current,z_last : std_logic_vector(39 downto 0);
signal x_last_shftd 		: std_logic_vector(39 downto 0);
signal y_last_shftd 		: std_logic_vector(39 downto 0);
signal result				: std_logic_vector(39 downto 0);
constant operand_b		: std_logic_vector(39 downto 0):=x"0000010000";


	--normilzation part
signal x_0,y_0 			: std_logic_vector(39 downto 0);
signal dummy_out_1		: std_logic;
signal dummy_out_2		: std_logic;

	--adder part	
signal ovf_x				: std_logic;
signal cout_x				: std_logic;
signal x_add_result		: std_logic_vector(39 downto 0);
signal ovf_y				: std_logic;
signal cout_y				: std_logic;
signal y_add_result		: std_logic_vector(39 downto 0);
signal ovf_offset			: std_logic;
signal cout_offset		: std_logic;
signal offset_add_result: std_logic_vector(39 downto 0);
signal loop_var 			: integer range 0 to 31;
	--result adder
signal r_add_result		: std_logic_vector(39 downto 0);
signal scale				: std_logic_vector(39 downto 0);
signal result_sign		: std_logic;
signal ovf_rslt			: std_logic;
signal cout_rslt			: std_logic;
	
	--constants
type angle_array is array (0 to 16) of std_logic_vector(39 downto 0);
--constant angles	: angle_array :=(	"0000000000000000000000000000010000000000","0000000000000000110010010000111111011010", "0000000000000000011101101011000110011100",	
--												"0000000000000000001111101011011011101011", "0000000000000000000111111101010110111010", 
--												"0000000000000000000011111111101010101101", "0000000000000000000001111111111101010101",
--												"0000000000000000000000111111111111101010", "0000000000000000000000011111111111111101",
--												"0000000000000000000000001111111111111111", "0000000000000000000000001000000000000000",
--												"0000000000000000000000000011111111111111", "0000000000000000000000000010000000000000",
--												"0000000000000000000000000000111111111111", "0000000000000000000000000000011111111111",
--												"0000000000000000000000000000010000000000", "0000000000000000000000000000001000000000");
constant angles	: angle_array :=(	"0000000000000000000000000000000000000000", "0001111101111001000011111111100101110010",	
												"0000111010100010010101000110000010101010", "0000011100110011000110101111001110100001", 
												"0000001110010101111011011101000001010010", "0000000111001010100001000011100000001000",
												"0000000011100101001100111010000001000000", "0000000001110010100110000000001011000000",
												"0000000000111001010010111100111100001011", "0000000000011100101001011101111100100010",
												"0000000000001110010100101110111001100100", "0000000000000111001010010111011100011100",
												"0000000000000011100101001011101110001110", "0000000000000001110010100101110111000001",
												"0000000000000000111001010010111011100000", "0000000000000000011100101001011101110000",
												 "0111111111111111111111111111111111111111");
---------------------------------------------------------------------
	
	--FSM signals
	
TYPE state_type IS (IDLE,READ_OPRND,CURR_CALC,LAST_UPDATE,SHIFT_AND_CHECK,DONE);
signal state 				: state_type;

begin

	--normalization portmap
norm_1: entity work.norm_hyper_mode
	Port map ( 
			  operand 		=> operand_a,
           norm_operand => y_0
			  );

	--adders portmap
adder_x: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>x_last,
           operand_b 	=>y_last_shftd,--(std_logic_vector(signed(y_last) srl loop_var)),
           mode 			=>not(y_last_shftd(39)),			-- y <0 => sub else add
           over_flow 	=>ovf_x,
			  carry_out 	=>cout_x,
           result 		=>x_add_result);

adder_y: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_last,
           operand_b 	=>x_last_shftd,--(std_logic_vector(signed(x_last) srl loop_var)),
           mode 			=>not(y_last_shftd(39)),			-- y >0 => sub else add
           over_flow 	=>ovf_y,
			  carry_out 	=>cout_y,
           result 		=>y_add_result);
adder_offset: entity work.forty_bit_add_sub
	Port map ( 
			 operand_a 	=> x_current,
          operand_b 	=> x"000000051E",	--0.02 in decimal
          mode 		=> '1',			-- sub offset
          over_flow 	=> ovf_offset,
			 carry_out 	=> cout_offset,
          result 		=> offset_add_result);	  			  
--actual FSM
fsm_process: process (clk, operand_a)

--	variable loop_var 	: natural range 0 to 31;

	begin
		if rising_edge(clk) then
			if rst = '1' then			--clear everything on reset
				state				<= idle;
				loop_var			<= 1;
				opr_done			<= '0';
				x_current		<= (others => '0');
				x_last			<= (others => '0');
				x_last_shftd	<= (others => '0');				
				y_current		<= (others => '0');
				y_last			<= (others => '0');
				y_last_shftd	<= (others => '0');				
				z_current		<= (others => '0');
				z_last			<= (others => '0');
				result			<= (others => '0');
				sqrt				<= (others => '0');				
				
			else
				case state is
					when IDLE =>		
					 if start ='1' then
						state 		<=	READ_OPRND;
					 else
						opr_done		<= '0';
						loop_var		<= 1;
						x_current	<= (others => '0');
						x_last		<= (others => '0');
						x_last_shftd <=(others => '0');
						y_current	<= (others => '0');
						y_last		<= (others => '0');
						y_last_shftd <=(others => '0');
						z_current	<= (others => '0');
						z_last		<= (others => '0');
						result		<= (others => '0');
						state 		<= IDLE;
					 end if;
 					when READ_OPRND =>		
						loop_var		<= 1;
						x_last		<= operand_b;
						y_last  		<= y_0;
						z_last		<=(others => '0');
						sqrt			<= (others => '0');		--keep result till next computation
						state 		<= CURR_CALC;
 					when CURR_CALC  =>		
						x_current	<=x_add_result;
						y_current	<=y_add_result;
--						z_current  	<=z_add_result;
						state 		<=LAST_UPDATE;
					when 	LAST_UPDATE =>
						if loop_var < 14 then
							x_last		<=x_current;
							y_last		<=y_current;
--							z_last  		<=z_current;
						else 
							null;
						end if;
						state 		<=SHIFT_AND_CHECK;
					when SHIFT_AND_CHECK =>
						if(x_last(39) = '1') then
						case loop_var is
							when 0 => 	x_last_shftd 		<= x_last; 
							when 1 => 	x_last_shftd	 	<= '1' & x_last(39 downto 1);
							when 2 => 	x_last_shftd 		<= "11" & x_last(39 downto 2);
							when 3 => 	x_last_shftd 		<= "111" & x_last(39 downto 3);
							when 4 => 	x_last_shftd 		<= "1111" & x_last(39 downto 4);
							when 5 => 	x_last_shftd 		<= "11111" & x_last(39 downto 5);
							when 6 => 	x_last_shftd 		<= "111111" & x_last(39 downto 6);
							when 7 => 	x_last_shftd 		<= "1111111" & x_last(39 downto 7);
							when 8 => 	x_last_shftd 		<= "11111111" & x_last(39 downto 8);
							when 9 => 	x_last_shftd 		<= "111111111" & x_last(39 downto 9);
							when 10 =>	x_last_shftd 		<= "1111111111" & x_last(39 downto 10);
							when 11 =>	x_last_shftd 		<= "11111111111" & x_last(39 downto 11);
							when 12 => 	x_last_shftd 		<= "111111111111" & x_last(39 downto 12);
							when 13 =>  x_last_shftd 		<= "1111111111111" & x_last(39 downto 13);
							when 14 => 	x_last_shftd 		<= "11111111111111" & x_last(39 downto 14);
							when 15 => 	x_last_shftd 		<= "111111111111111" & x_last(39 downto 15);						
							when others => null;
						end case;
						else
						case loop_var is
							when 0 => 	x_last_shftd 		<= x_last; 
							when 1 => 	x_last_shftd	 	<= '0' & x_last(39 downto 1);
							when 2 => 	x_last_shftd 		<= "00" & x_last(39 downto 2);
							when 3 => 	x_last_shftd 		<= "000" & x_last(39 downto 3);
							when 4 => 	x_last_shftd 		<= "0000" & x_last(39 downto 4);
							when 5 => 	x_last_shftd 		<=	"00000" & x_last(39 downto 5);
							when 6 => 	x_last_shftd 		<= "000000" & x_last(39 downto 6);
							when 7 => 	x_last_shftd 		<= "0000000" & x_last(39 downto 7);
							when 8 => 	x_last_shftd 		<= "00000000" & x_last(39 downto 8);
							when 9 => 	x_last_shftd 		<= "000000000" & x_last(39 downto 9);
							when 10 =>	x_last_shftd 		<= "0000000000" & x_last(39 downto 10);
							when 11 =>	x_last_shftd 		<= "00000000000" & x_last(39 downto 11);
							when 12 => 	x_last_shftd 		<= "000000000000" & x_last(39 downto 12);
							when 13 =>  x_last_shftd 		<= "0000000000000" & x_last(39 downto 13);
							when 14 => 	x_last_shftd 		<= "00000000000000" & x_last(39 downto 14);
							when 15 => 	x_last_shftd 		<= "000000000000000" & x_last(39 downto 15);						
							when others => null;
						end case;
						end if;
						if(y_last(39) = '1') then
						case loop_var is
							when 0 => 	y_last_shftd 		<= y_last; 
							when 1 => 	y_last_shftd	 	<= '1' & y_last(39 downto 1);
							when 2 => 	y_last_shftd 		<= "11" & y_last(39 downto 2);
							when 3 => 	y_last_shftd 		<= "111" & y_last(39 downto 3);
							when 4 => 	y_last_shftd 		<= "1111" & y_last(39 downto 4);
							when 5 => 	y_last_shftd 		<= "11111" & y_last(39 downto 5);
							when 6 => 	y_last_shftd 		<= "111111" & y_last(39 downto 6);
							when 7 => 	y_last_shftd 		<= "1111111" & y_last(39 downto 7);
							when 8 => 	y_last_shftd 		<= "11111111" & y_last(39 downto 8);
							when 9 => 	y_last_shftd 		<= "111111111" & y_last(39 downto 9);
							when 10 =>	y_last_shftd 		<= "1111111111" & y_last(39 downto 10);
							when 11 =>	y_last_shftd 		<= "11111111111" & y_last(39 downto 11);
							when 12 => 	y_last_shftd 		<= "111111111111" & y_last(39 downto 12);
							when 13 =>  y_last_shftd 		<= "1111111111111" & y_last(39 downto 13);
							when 14 => 	y_last_shftd 		<= "11111111111111" & y_last(39 downto 14);
							when 15 => 	y_last_shftd 		<= "111111111111111" & y_last(39 downto 15);						
							when others => null;
						end case;
						else
						case loop_var is
							when 0 => 	y_last_shftd 		<= y_last; 
							when 1 => 	y_last_shftd	 	<= '0' & y_last(39 downto 1);
							when 2 => 	y_last_shftd 		<= "00" & y_last(39 downto 2);
							when 3 => 	y_last_shftd 		<= "000" & y_last(39 downto 3);
							when 4 => 	y_last_shftd 		<= "0000" & y_last(39 downto 4);
							when 5 => 	y_last_shftd 		<=	"00000" & y_last(39 downto 5);
							when 6 => 	y_last_shftd 		<= "000000" & y_last(39 downto 6);
							when 7 => 	y_last_shftd 		<= "0000000" & y_last(39 downto 7);
							when 8 => 	y_last_shftd 		<= "00000000" & y_last(39 downto 8);
							when 9 => 	y_last_shftd 		<= "000000000" & y_last(39 downto 9);
							when 10 =>	y_last_shftd 		<= "0000000000" & y_last(39 downto 10);
							when 11 =>	y_last_shftd 		<= "00000000000" & y_last(39 downto 11);
							when 12 => 	y_last_shftd 		<= "000000000000" & y_last(39 downto 12);
							when 13 =>  y_last_shftd 		<= "0000000000000" & y_last(39 downto 13);
							when 14 => 	y_last_shftd 		<= "00000000000000" & y_last(39 downto 14);
							when 15 => 	y_last_shftd 		<= "000000000000000" & y_last(39 downto 15);						
							when others => null;
						end case;
						end if;
						loop_var		<= loop_var + 1;
						if loop_var = 16 then
							opr_done <='1';
							state 	<=DONE;
						else
							state 	<=CURR_CALC;
						end if;
					when DONE =>
					opr_done 		<= '0';
					sqrt  			<= offset_add_result(31 downto 0);
					state				<= IDLE;
				end case;
			end if;		--rst='1'
		end if; 			--rising_edge(clk)
	end process; 
end Behavioral;

