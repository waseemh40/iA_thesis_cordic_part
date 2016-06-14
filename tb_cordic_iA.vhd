--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   02:03:44 05/05/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_cordic_iA.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cordic_top_level
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
USE ieee.numeric_std.ALL;
 
ENTITY tb_cordic_iA IS
END tb_cordic_iA;
 
ARCHITECTURE behavior OF tb_cordic_iA IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cordic_top_level
    PORT(
         angle : IN  std_logic_vector(15 downto 0);
         sin : OUT  std_logic_vector(15 downto 0);
         cos : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal angle : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal sin : std_logic_vector(15 downto 0);
   signal cos : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cordic_top_level PORT MAP (
          angle => angle,
          sin => sin,
          cos => cos
        );


 process 
 begin
	angle <="0000000000000100";
	wait for clock_period;
	angle <="0000000000000101";
	wait for clock_period;
	angle <="0000000000000111";
	wait for clock_period;
	angle <="0000000000001000";
	wait for clock_period;
	angle <="0000000001000000";
	wait for clock_period;
	end process;
 --	angle <= "0000000000101101" after clock_period, "0000000001000110" after clock_period*10;

END;
