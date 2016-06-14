----------------------------------------------------------------------------------
-- Company: 
-- Engineer: WH
-- 
-- Create Date:    15:26:32 06/01/2016 
-- Design Name: 
-- Module Name:    normalization_module - Behavioral 
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

entity norm_linear_module is
    Port ( operand : in  STD_LOGIC_VECTOR (31 downto 0);
           norm_operand : out  STD_LOGIC_VECTOR (39 downto 0);
			  type_shift 	: out	std_logic);	
end norm_linear_module;

architecture Behavioral of norm_linear_module is



signal oprnd_inverted	: std_logic_vector(39 downto 0);
signal second_oprnd		: std_logic_vector(39 downto 0);
signal norm_oprnd_pos	: std_logic_vector(39 downto 0);
signal norm_oprnd_neg	: std_logic_vector(39 downto 0);
signal adder_result		: std_logic_vector(39 downto 0);
signal ovf_dummy			: std_logic;
signal cout_dummy			: std_logic;

begin

oprnd_inverted			<= ("00000000" & not(operand)) 	when operand(31)= '1'
						else 	("00000000" & (operand));
second_oprnd			<= x"0000000001" 						when operand(31) ='1'
						else 	x"0000000000";
						
adder: entity work.forty_bit_adder
	port map ( 
			  operand_a => oprnd_inverted,
           operand_b => second_oprnd,
           sum 		=> adder_result,
			  ovf			=> ovf_dummy,
           carry_in 	=> '0',
           carry_out => cout_dummy);
			  
norm_operand <= 	x"00" & adder_result(31 downto 0) when 	--16 zeros + (num - 8 LSB(s))
							adder_result(23)='1' or adder_result(22)='1'  or adder_result(21)='1' or
							adder_result(20)='1' or adder_result(19)='1'  or adder_result(18)='1' or
							adder_result(17)='1' or adder_result(16)='1' 
							else
						adder_result(31 downto 0) & x"00";	-- num + 8 zeros  s

type_shift 	<= 	'1' when --15 zeros + (num - 7 LSB(s))
							adder_result(23)='1' or adder_result(22)='1'  or adder_result(21)='1' or
							adder_result(20)='1' or adder_result(19)='1'  or adder_result(18)='1' or
							adder_result(17)='1' or adder_result(16)='1' 
							else
						'0';	--5 zeros + num + 3 zeros
						
end Behavioral;

