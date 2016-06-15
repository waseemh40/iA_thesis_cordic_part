--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:10:26 06/14/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_linear_combinatorial.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: linear_combinatorial
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
 
ENTITY tb_linear_combinatorial IS
END tb_linear_combinatorial;
 
ARCHITECTURE behavior OF tb_linear_combinatorial IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT linear_combinatorial
    PORT(
         operand_a : IN  std_logic_vector(31 downto 0);
         operand_b : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic;
         ovf : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal operand_a : std_logic_vector(31 downto 0) := (others => '0');
   signal operand_b : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   signal ovf : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: linear_combinatorial PORT MAP (
          operand_a => operand_a,
          operand_b => operand_b,
          result => result,
          reset => reset,
          clk => clk,
          ovf => ovf
        );

operand_a <="00000000000000000011000000000000" after 5 ns,"00000000000011011100000000000000" after 100 ns,"00000000111111110011000000000000" after 500 ns,"00000000111100001011001100110011" after 600ns,"00000000011111110100010100011110" after 700 ns,"00000000000000110101100110011001" after 800 ns, "11111111111111001010011001100111" after 1000 ns; 
operand_b <="00000000000000000010000000000000" after 5 ns,"00000000000011011000000000000000" after 100 ns,"00000000111111110011000000000000" after 500 ns,"00000000011010101010100011110101" after 600ns,"00000000011111110100010100011110" after 700 ns,"11111111111111001010011001100111" after 900 ns, "11111111111111001010011001100111" after 1000 ns; 
--0.1875*0.125
--13.75*13.5 
--255*255
--240.6999969482421875*106.6599884033203125
--127.27*127.27
--(-3.35)*127.27
--(-3.35)^2



END;
