----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:46:08 06/01/2016 
-- Design Name: 
-- Module Name:    denormalization_module - Behavioral 
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

entity denormalization_module is
    Port ( operand 			: in  STD_LOGIC_VECTOR (39 downto 0);
           type_shift 		: in  STD_LOGIC;
           denorm_operand 	: out  STD_LOGIC_VECTOR (31 downto 0));
end denormalization_module;

architecture Behavioral of denormalization_module is

begin

denorm_operand	<= operand (34 downto 3) when type_shift='0' else
						operand (24 downto 0);
end Behavioral;

