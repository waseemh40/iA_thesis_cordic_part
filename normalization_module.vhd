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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity normalization_module is
    Port ( operand : in  STD_LOGIC_VECTOR (31 downto 0);
           norm_operand : out  STD_LOGIC_VECTOR (39 downto 0);
			  type_shift 	: out	std_logic);	
end normalization_module;

architecture Behavioral of normalization_module is
signal temp_normalized : std_logic_vector (39 downto 0);
begin
temp_normalized(39 downto 25) <= operand(31 downto 17);
temp_normalized(24 downto 8) 	<= operand(16 downto 0);
temp_normalized(7 downto 0)	<= x"00";

norm_operand <= 	(std_logic_vector(unsigned(temp_normalized) srl 15)) when --15 zeros + (num - 7 LSB(s))
							operand(31)='1' or operand(30)='1'  or operand(29)='1' or
							operand(28)='1' or operand(27)='1'  or operand(26)='1' or
							operand(25)='1' or operand(24)='1'  or operand(23)='1' or
							operand(22)='1' else
						(std_logic_vector(unsigned(temp_normalized) srl 5));	--5 zeros + num + 3 zeros

type_shift 	<= 	'1' when --15 zeros + (num - 7 LSB(s))
							operand(31)='1' or operand(30)='1'  or operand(29)='1' or
							operand(28)='1' or operand(27)='1'  or operand(26)='1' or
							operand(25)='1' or operand(24)='1'  or operand(23)='1' or
							operand(22)='1' else
						'0';	--5 zeros + num + 3 zeros
						
end Behavioral;

