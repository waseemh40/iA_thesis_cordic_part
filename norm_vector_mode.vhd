----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:15:14 06/04/2016 
-- Design Name: 
-- Module Name:    norm_vector_mode - Behavioral 
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

entity norm_vector_mode is
    Port ( operand 		: in  STD_LOGIC_VECTOR (31 downto 0);
           norm_operand : out  STD_LOGIC_VECTOR (39 downto 0));	
end norm_vector_mode;

architecture Behavioral of norm_vector_mode is

signal oprnd_inverted	: std_logic_vector(39 downto 0);
signal norm_oprnd_pos	: std_logic_vector(39 downto 0);
signal norm_oprnd_neg	: std_logic_vector(39 downto 0);
signal adder_result		: std_logic_vector(39 downto 0);
signal ovf_dummy			: std_logic;
signal cout_dummy			: std_logic;

begin
			  
adder: entity work.forty_bit_adder
	port map ( 
			  operand_a => oprnd_inverted,
           operand_b => x"0000000001",
           sum 		=> adder_result,
			  ovf			=> ovf_dummy,
           carry_in 	=> '0',
           carry_out => cout_dummy);		
			  
oprnd_inverted <=	"00000000" & not(operand);			--zeros since operand is converted from negative to positive not the other way!!!  
norm_oprnd_pos <= "00000000" & operand ;	--8 zeros + num in case of positive operand
norm_operand 	<= norm_oprnd_pos when operand(31)='0' else
						adder_result;
end Behavioral;



