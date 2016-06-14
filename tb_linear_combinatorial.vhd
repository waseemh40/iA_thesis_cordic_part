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

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
