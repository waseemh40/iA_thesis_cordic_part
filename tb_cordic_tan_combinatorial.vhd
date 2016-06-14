--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:06:56 06/04/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_cordic_tan_combinatorial.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cordic_tan_combinatorial
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
 
ENTITY tb_cordic_tan_combinatorial IS
END tb_cordic_tan_combinatorial;
 
ARCHITECTURE behavior OF tb_cordic_tan_combinatorial IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cordic_tan_combinatorial
    PORT(
         x_in : IN  std_logic_vector(31 downto 0);
         y_in : IN  std_logic_vector(31 downto 0);
         angle_out : OUT  std_logic_vector(31 downto 0);
         sqrt_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x_in : std_logic_vector(31 downto 0) := (others => '0');
   signal y_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal angle_out : std_logic_vector(31 downto 0);
   signal sqrt_out : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cordic_tan_combinatorial PORT MAP (
          x_in => x_in,
          y_in => y_in,
          angle_out => angle_out,
          sqrt_out => sqrt_out
        );

x_in <="00000000000000010000000000000000" after 5 ns,"00000000000001010000000000000000" after 100 ns,"00000000000010100000000000000000" after 500 ns,"00000000000000101010011001100110" after 600ns,"00000000000011011110001111010111" after 700 ns,"00000000000000110101100110011001" after 800 ns;
y_in <="00000000000001010000000000000000" after 5 ns,"00000000000000100000000000000000" after 100 ns,"00000000000010100000000000000000" after 500 ns,"00000000000011011110001111010111" after 600ns,"00000000000000101010011001100110" after 700 ns,"00000000000000110101100110011001" after 900 ns; 
--13.75*13.5
--0.1875*0.125
--13106.1875*2.1875
--240.6999969482421875*106.6599884033203125
--127.27*127.27
--(-3.35)*127.27
--(-3.35)^2
--0000000000000000 0000000000000000
--600ns => 13.86/2.65
END;
