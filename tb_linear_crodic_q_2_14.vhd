--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:02:11 05/31/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_linear_crodic_q_2_14.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cordic_linear
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
 
ENTITY tb_linear_crodic_q_2_14 IS
END tb_linear_crodic_q_2_14;
 
ARCHITECTURE behavior OF tb_linear_crodic_q_2_14 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cordic_linear
    PORT(
         x_in : IN  std_logic_vector(15 downto 0);
         y_in : IN  std_logic_vector(15 downto 0);
         z_in : IN  std_logic_vector(15 downto 0);
         z_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x_in : std_logic_vector(15 downto 0) := (others => '0');
   signal y_in : std_logic_vector(15 downto 0) := (others => '0');
   signal z_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal z_out : std_logic_vector(15 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cordic_linear PORT MAP (
          x_in => x_in,
          y_in => y_in,
          z_in => z_in,
          z_out => z_out
        );

x_in <="0000011000000000" after 5 ns,"0011000000000000" after 100 ns,"0011000000000000" after 500 ns;
z_in <="0000010000000000" after 5 ns,"001000000000000" after 100 ns,"0011000000000000" after 500 ns; 

END;
