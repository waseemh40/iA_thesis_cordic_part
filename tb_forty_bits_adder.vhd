--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:28:33 05/31/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/CPU-2016/fp_system_test/tb_thirty2_bits_adder.vhd
-- Project Name:  fp_system_test
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: thirty2_bit_adder
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
 
ENTITY tb_forty_bits_adder IS
END tb_forty_bits_adder;
 
ARCHITECTURE behavior OF tb_forty_bits_adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT forty_bit_adder
    PORT(
         operand_a : IN  std_logic_vector(39 downto 0);
         operand_b : IN  std_logic_vector(39 downto 0);
         sum : INOUT  std_logic_vector(39 downto 0);
         ovf : OUT  std_logic;
         carry_in : IN  std_logic;
         carry_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal operand_a : std_logic_vector(39 downto 0) := (others => '0');
   signal operand_b : std_logic_vector(39 downto 0) := (others => '0');
   signal carry_in : std_logic := '0';

	--BiDirs
   signal sum : std_logic_vector(39 downto 0);

 	--Outputs
   signal ovf : std_logic;
   signal carry_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: forty_bit_adder PORT MAP (
          operand_a => operand_a,
          operand_b => operand_b,
          sum => sum,
          ovf => ovf,
          carry_in => carry_in,
          carry_out => carry_out
        );

operand_a <=x"0F00000001" after 5 ns,x"0FFFFFFF00" after 10 ns,x"0000ABC000" after 15 ns,x"FFFA000000" after 20 ns;
operand_b <=x"0F00000004" after 5 ns,x"0FFFFFFF00" after 10 ns,x"0000000F00" after 15 ns,x"0000FB000A" after 20 ns;
 



END;
