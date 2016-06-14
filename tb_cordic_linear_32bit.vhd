--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:10:16 06/01/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_cordic_linear_32bit.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cordic_linear_32bits
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_cordic_linear_32bit IS
END tb_cordic_linear_32bit;
 
ARCHITECTURE behavior OF tb_cordic_linear_32bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cordic_linear_32bits
    PORT(
         operand_a : IN  std_logic_vector(31 downto 0);
         operand_b : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal operand_a : std_logic_vector(31 downto 0) := (others => '0');
   signal operand_b : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cordic_linear_32bits PORT MAP (
          operand_a => operand_a,
          operand_b => operand_b,
          result => result
        );

operand_a <="00000000000011011100000000000000" after 5 ns,"00000000000000000011000000000000" after 100 ns,"00000000111111110011000000000000" after 500 ns,"00000000111100001011001100110011" after 600ns,"00000000011111110100010100011110" after 700 ns,"00000000000000110101100110011001" after 800 ns;
operand_b <="00000000000011011000000000000000" after 5 ns,"00000000000000000010000000000000" after 100 ns,"00000000111111110011000000000000" after 500 ns,"00000000011010101010100011110101" after 600ns,"00000000011111110100010100011110" after 700 ns,"00000000000000110101100110011001" after 900 ns; 
--13.75*13.5
--0.1875*0.125
--255*255
--240.6999969482421875*106.6599884033203125
--127.27*127.27
--(-3.35)*127.27
--(-3.35)^2


END;
