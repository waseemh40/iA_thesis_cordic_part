----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:59 06/08/2016 
-- Design Name: 
-- Module Name:    cordic_seq_rot - Behavioral 
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

entity cordic_seq_rot is
    Port ( angle 		: in  STD_LOGIC_VECTOR (31 downto 0);
           sin	 		: out  STD_LOGIC_VECTOR (31 downto 0);
           cos 		: out  STD_LOGIC_VECTOR (31 downto 0);			
           clk 		: in  STD_LOGIC;
           rst 		: in  STD_LOGIC;
           start 		: in  STD_LOGIC;
           opr_done 	: out  STD_LOGIC);
end cordic_seq_rot;

architecture Behavioral of cordic_seq_rot is

	--computational signals
signal x_current,x_last : std_logic_vector(39 downto 0);
signal y_current,y_last : std_logic_vector(39 downto 0);
signal z_current,z_last : std_logic_vector(39 downto 0);
signal x_last_shftd 		: std_logic_vector(39 downto 0);
signal y_last_shftd 		: std_logic_vector(39 downto 0);
signal x_0,z_0,y_0		: std_logic_vector(39 downto 0);
signal sin_invrtd			: std_logic_vector(39 downto 0);
signal cos_invrtd			: std_logic_vector(39 downto 0);



	--normilzation part
signal quadrant			: std_logic_vector(1 downto 0);
signal latched_quad		: std_logic_vector(1 downto 0);

	--adder part	

signal x_add_result		: std_logic_vector(39 downto 0);
signal y_add_result		: std_logic_vector(39 downto 0);
signal z_add_result		: std_logic_vector(39 downto 0);
signal sin_add_result	: std_logic_vector(39 downto 0);
signal cos_add_result	: std_logic_vector(39 downto 0);

signal loop_var 			: integer range 0 to 31;

	
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
constant angles	: angle_array :=(	"0000000000000000000000000000000000000000","0010110011111111111111111111111111111111", "0001101010010000101001110011000110100110",	
												"0000111000001001010001110100000001111101", "0000011100100000000000010001001001001001", 
												"0000001110010011100010101010011001001100", "0000000111001010001101111001010011100101",
												"0000000011100101001010100001101010110001", "0000000001110010100101101101011110100001",
												"0000000000111001010010111010010100011011", "0000000000011100101001011101100110110111",
												"0000000000001110010100101110110111000000", "0000000000000111001010010111011011111101",
												"0000000000000011100101001011101110000010", "0000000000000001110010100101110111000001",
												"0000000000000000111001010010111011100000", "0000000000000000011100101001011101110000");
constant K_n	:std_logic_vector(39 downto 0) :=x"009B780346";	--0.6073*256 Q16_24 format
---------------------------------------------------------------------
	
	--FSM signals
	
TYPE state_type IS (IDLE,READ_OPRND,CURR_CALC,LAST_UPDATE,SHIFT_AND_CHECK,DONE);
signal state 				: state_type;

begin

	--normalization portmap
norm_1: entity work.norm_rotation_mode
	Port map ( 
			  angle 		 	=> angle,
           norm_angle 	=> z_0,
			  quad			=> quadrant
			  );
		x_0					<= K_n;		--comb. part
	--adders portmap
adder_x: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=> x_last,
           operand_b 	=> y_last_shftd,--(std_logic_vector(signed(y_last) srl loop_var)),
           mode 			=> not(z_last(39)),			-- z <0 => add
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> x_add_result);

adder_y: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=> y_last,
           operand_b 	=> x_last_shftd,--(std_logic_vector(signed(x_last) srl loop_var)),
           mode 			=> (z_last(39)),			-- z <0 => sub
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> y_add_result);
adder_z: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=> z_last,
           operand_b 	=> angles(loop_var),
           mode 			=> not(z_last(39)),			-- z <0 => add
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> z_add_result);
adder_sin: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=> sin_invrtd,
           operand_b 	=> x"0000000001",
           mode 			=> '0',
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> sin_add_result);			  
adder_cos: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=> cos_invrtd,
           operand_b 	=> x"0000000001",
           mode 			=> '0',
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> cos_add_result);			  
--actual FSM
fsm_process: process (clk,angle)

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
				sin				<= (others => '0');
				cos				<= (others => '0');
				sin_invrtd		<= (others => '0');
				cos_invrtd		<= (others => '0');				
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
						state 		<= IDLE;
					 end if;
 					when READ_OPRND =>		--latched desired values, changing operand will not effect operation
						loop_var		<= 0;
						x_last		<=x_0;
						y_last  		<=(others=> '0');
						z_last		<=z_0;
						latched_quad <=quadrant;
						sin			<= (others => '0');
						cos			<= (others => '0');
						state 		<= CURR_CALC;
 					when CURR_CALC  =>		
						x_current	<=x_add_result;
						y_current	<=y_add_result;
						z_current  	<=z_add_result;
						state 		<=LAST_UPDATE;
					when 	LAST_UPDATE =>
						x_last		<=x_current;
						y_last		<=y_current;
						z_last  		<=z_current;
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
						if loop_var = 15 then
							opr_done <='1';
							sin_invrtd <= not(y_current);
							cos_invrtd <= not(x_current);
							state 	<= DONE;
						else
							state 	<= CURR_CALC;
						end if;
					when DONE =>
					opr_done 		<= '0';
					if latched_quad ="00" then
						sin 			<= x"00" & y_current(39 downto 16);
						cos 			<= x"00" & x_current(39 downto 16);
					elsif latched_quad ="01" then
						sin 			<= x"00" & y_current(39 downto 16);
						cos 			<= x"FF" & cos_add_result(39 downto 16);

					elsif latched_quad ="10" then
						sin 			<= x"FF" & sin_add_result(39 downto 16);
						cos 			<= x"FF" & cos_add_result(39 downto 16);
					else 
						sin 			<= x"FF" & sin_add_result(39 downto 16);
						cos 			<= x"00" & x_current(39 downto 16);
					end if;
					state				<= IDLE;
				end case;
			end if;		--rst='1'
		end if; 			--rising_edge(clk)
	end process; 
end Behavioral;

