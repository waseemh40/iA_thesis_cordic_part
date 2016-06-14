--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:57:41 06/01/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_forty_bits_add_sub.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: forty_bit_add_sub
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
 
ENTITY tb_forty_bits_add_sub IS
END tb_forty_bits_add_sub;
 
ARCHITECTURE behavior OF tb_forty_bits_add_sub IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT forty_bit_add_sub
    PORT(
         operand_a : IN  std_logic_vector(39 downto 0);
         operand_b : IN  std_logic_vector(39 downto 0);
         mode : IN  std_logic;
         over_flow : OUT  std_logic;
         carry_out : OUT  std_logic;
         result : INOUT  std_logic_vector(39 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal operand_a : std_logic_vector(39 downto 0) := (others => '0');
   signal operand_b : std_logic_vector(39 downto 0) := (others => '0');
   signal mode : std_logic := '0';

	--BiDirs
   signal result : std_logic_vector(39 downto 0);

 	--Outputs
   signal over_flow : std_logic;
   signal carry_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: forty_bit_add_sub PORT MAP (
          operand_a => operand_a,
          operand_b => operand_b,
          mode => mode,
          over_flow => over_flow,
          carry_out => carry_out,
          result => result
        );

operand_a 	<=x"0000000001" after 5 ns,x"7FFFFFFF00" after 10 ns,x"000000ABC0" after 15 ns,x"FFFA000000" after 20 ns,x"FFFA000000" after 25 ns,x"0000FB0000" after 30 ns;
operand_b 	<=x"0000000004" after 5 ns,x"7FFFFFFF00" after 10 ns,x"0000000F00" after 15 ns,x"0000FB0000" after 20 ns,x"0000FB0000" after 25 ns,x"0FFFFB0000" after 30 ns;
mode 			<= '0' 		  after 5 ns, '0' 		 after 10 ns, '1' 		 after 15 ns, '1' 		 after 20 ns,'0' 		 after 25 ns;

END;
