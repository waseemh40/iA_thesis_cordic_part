----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:57 06/02/2016 
-- Design Name: 
-- Module Name:    coridc_linear_sequential - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity coridc_seq_tan is
    Port ( operand_a : in  STD_LOGIC_VECTOR (31 downto 0);
           operand_b : in  STD_LOGIC_VECTOR (31 downto 0);
			  mode		: in std_logic;
           angle 		: out  STD_LOGIC_VECTOR (31 downto 0);
           sqrt 		: out  STD_LOGIC_VECTOR (31 downto 0);			
           clk 		: in  STD_LOGIC;
           rst 		: in  STD_LOGIC;
           start 		: in  STD_LOGIC;
           opr_done 	: out  STD_LOGIC);
end coridc_seq_tan;

architecture Behavioral of coridc_seq_tan is

	--computational signals
signal x_current,x_last : std_logic_vector(39 downto 0);
signal y_current,y_last : std_logic_vector(39 downto 0);
signal z_current,z_last : std_logic_vector(39 downto 0);
signal x_last_shftd 		: std_logic_vector(39 downto 0);
signal y_last_shftd 		: std_logic_vector(39 downto 0);
signal result				: std_logic_vector(39 downto 0);
signal mode_latched		: std_logic;
signal oprnd_a_msb		: std_logic;
signal oprnd_b_msb		: std_logic;
	--normilzation part
signal x_0,y_0 			: std_logic_vector(39 downto 0);
signal dummy_out_1		: std_logic;
signal dummy_out_2		: std_logic;

	--adder part	
signal x_add_result		: std_logic_vector(39 downto 0);
signal y_add_result		: std_logic_vector(39 downto 0);
signal z_add_result		: std_logic_vector(39 downto 0);
signal z_oprnd_b	      : std_logic_vector(39 downto 0);
signal y_addr_mode		: std_logic;						
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
constant angles	: angle_array :=(	"0010110011111111111111111111111111111111", "0001101010010000101001110011000110100110",	
												"0000111000001001010001110100000001111101", "0000011100100000000000010001001001001001", 
												"0000001110010011100010101010011001001100", "0000000111001010001101111001010011100101",
												"0000000011100101001010100001101010110001", "0000000001110010100101101101011110100001",
												"0000000000111001010010111010010100011011", "0000000000011100101001011101100110110111",
												"0000000000001110010100101110110111000000", "0000000000000111001010010111011011111101",
												"0000000000000011100101001011101110000010", "0000000000000001110010100101110111000001",
												"0000000000000000111001010010111011100000", "0000000000000000011100101001011101110000","0000000000000000000000000000000000000000");
---------------------------------------------------------------------
	
	--FSM signals
	
TYPE state_type IS (IDLE,READ_OPRND,CURR_CALC,LAST_UPDATE,SHIFT_AND_CHECK,DONE);
signal state 				: state_type;

begin

	--normalization portmap
norm_1: entity work.norm_vector_mode
	Port map ( 
			  operand 		=> operand_a,
           norm_operand => x_0
			  );
			  
norm_2: entity work.norm_vector_mode
	Port map ( 
			  operand 		=> operand_b,
           norm_operand => y_0
			  );

	--adders portmap
adder_x: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=> x_last,
           operand_b 	=> y_last_shftd,--(std_logic_vector(signed(y_last) srl loop_var)),
           mode 			=> (y_last_shftd(39)),			-- y <0 => sub else add
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> x_add_result);

adder_y: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=> y_last,
           operand_b 	=> x_last_shftd,--(std_logic_vector(signed(x_last) srl loop_var)),
           mode 			=> y_addr_mode,			-- y >0 => sub else add
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> y_add_result);
adder_z: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=> z_last,
           operand_b 	=> z_oprnd_b,
           mode 			=> (y_last_shftd(39)),			-- y <0 => sub else add
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> z_add_result);
adder_result: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=> scale,
           operand_b 	=> result,
           mode 			=> result_sign, -- change this please!!! verified logic, just change scale in DONE state
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> r_add_result);			  
			  
--actual FSM
fsm_process: process (clk, operand_a,operand_b,mode)

--	variable loop_var 	: natural range 0 to 31;

	begin
		if rising_edge(clk) then
			if rst = '1' then			--clear everything on reset
				state				<= idle;
				loop_var			<= 0;
				opr_done			<= '0';
				x_current		<= (others => '0');
				x_last			<= (others => '0');
				x_last_shftd	<= (others => '0');				
				y_current		<= (others => '0');
				y_last			<= (others => '0');
				y_last_shftd	<= (others => '0');				
				z_current		<= (others => '0');
				z_last			<= (others => '0');
				z_oprnd_b		<= (others => '0');
				result			<= (others => '0');
				angle				<= (others => '0');
				sqrt				<= (others => '0');
				scale				<= (others => '0');
				
			else
				case state is
					when IDLE =>		
					 if start ='1' then
						state 		<=	READ_OPRND;
					 else
						opr_done		<= '0';
						loop_var		<= 0;
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
						loop_var		<= 0;
						x_last		<= x_0;
						y_last  		<= y_0;
						z_last		<= (others => '0');
						z_oprnd_b	<= (others => '0');
						angle			<= (others => '0');		--keep result till next computation
						sqrt			<= (others => '0');		--keep result till next computation
						result_sign	<= operand_a(31) xor operand_b(31);
						mode_latched <= mode;
						oprnd_a_msb	<= operand_a(31);
						oprnd_b_msb	<= operand_b(31);
--						y_addr_mode	<= not(y_last_shftd(39));
						state 		<= CURR_CALC;
 					when CURR_CALC  =>		
						x_current	<= x_add_result;
						y_current	<= y_add_result;
						z_current  	<= z_add_result;
						state 		<= LAST_UPDATE;
					when 	LAST_UPDATE =>
						x_last		<= x_current;
						y_last		<= y_current;
						z_last  		<= z_current;
						state 		<= SHIFT_AND_CHECK;
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
						z_oprnd_b	<= angles(loop_var);	
						if loop_var = 15 then
							result 	<= "00000000" & z_current(39 downto 8) ;
							if (oprnd_a_msb= '0' and oprnd_b_msb='0') then
								scale <= x"0000000000";
							elsif (oprnd_a_msb= '1' and oprnd_b_msb='0') then
								scale <= x"00B4000000";	--180
							elsif (oprnd_a_msb= '1' and oprnd_b_msb='1') then
								scale <= x"00B4000000";	--180
							else
								scale <= x"0168000000";	--360
							end if;
							opr_done <= '1';
							state 	<= DONE;
						else
							state 	<= CURR_CALC;
						end if;
					when DONE =>
					opr_done 		<= '0';
					if (mode_latched ='0') then
						angle 		<= r_add_result(39 downto 8);
						sqrt  		<= x"00000000";
					else
						angle 		<= x"00000000";
						sqrt  		<= x_current(31 downto 0);
					end if;
					state				<= IDLE;
				end case;
			end if;		--rst='1'
		end if; 			--rising_edge(clk)
	end process; 
y_addr_mode	<= not(y_last_shftd(39));																		
end Behavioral; 