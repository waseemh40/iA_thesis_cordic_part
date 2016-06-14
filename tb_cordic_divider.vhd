--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:45:41 06/01/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_cordic_divider.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cordic_linear_divider_32bits
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
 
ENTITY tb_cordic_divider IS
END tb_cordic_divider;
 
ARCHITECTURE behavior OF tb_cordic_divider IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cordic_linear_divider_32bits
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
   uut: cordic_linear_divider_32bits PORT MAP (
          operand_a => operand_a,
          operand_b => operand_b,
          result => result
        );

operand_a <="00000000000011011100000000000000" after 5 ns,"00000000000000000011000000000000" after 100 ns,"00110011001100100011000000000000" after 500 ns,"00000000111100001011001100110011" after 600ns;
operand_b <="00000000000011011000000000000000" after 5 ns,"00000000000000000010000000000000" after 100 ns,"00000000000001000011000000000000" after 500 ns,"00000000011010101010100011110101" after 600ns; 
--120.35* 53.33
 



END;
