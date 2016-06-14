----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:23:31 05/31/2016 
-- Design Name: 
-- Module Name:    carry_look_ahead_block_extended - Behavioral 
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

entity carry_look_ahead_block_extended is
    Port ( c_in : in  STD_LOGIC;
           p_group : in  STD_LOGIC_VECTOR (9 downto 0);
           g_group : in  STD_LOGIC_VECTOR (9 downto 0);
           C_OUT : inout  STD_LOGIC_VECTOR (10 downto 1));
end carry_look_ahead_block_extended;

architecture Behavioral of carry_look_ahead_block_extended is

begin

	C_OUT(1) <= g_group(0) or (p_group(0) and c_in);
	C_OUT(2) <= g_group(1) or (p_group(1) and C_OUT(1));
	C_OUT(3) <= g_group(2) or (p_group(2) and C_OUT(2));
	C_OUT(4) <= g_group(3) or (p_group(3) and C_OUT(3));
	C_OUT(5) <= g_group(4) or (p_group(4) and C_OUT(4));
	C_OUT(6) <= g_group(5) or (p_group(5) and C_OUT(5));
	C_OUT(7) <= g_group(6) or (p_group(6) and C_OUT(6));
	C_OUT(8) <= g_group(7) or (p_group(7) and C_OUT(7));
	C_OUT(9) <= g_group(8) or (p_group(8) and C_OUT(8));
	C_OUT(10) <= g_group(9) or (p_group(9) and C_OUT(9));
	
end Behavioral;

