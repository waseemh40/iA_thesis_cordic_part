--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:05:58 06/17/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_hyperbolic_comb.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: hyperbolic_combinatorial
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
USE ieee.numeric_std.ALL;
library std;
use std.textio.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_hyperbolic_comb IS
END tb_hyperbolic_comb;
 
ARCHITECTURE behavior OF tb_hyperbolic_comb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT hyperbolic_combinatorial
    PORT(
         operand_a : IN  std_logic_vector(31 downto 0);
         sqrt : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal operand_a : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal sqrt : std_logic_vector(31 downto 0);
	signal clk : std_logic := '0';

   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 	signal x 			: std_logic_vector(31 downto 0):=x"FFFEF333";		--(-1)	
	--file IO part
	signal 	endoffile : bit := '0';
	--data read from the file.
	signal    dataread : real;
	--data to be saved into the output file.
	signal    datatosave : real;
	--line number of the file read or written.
	signal    linenumber : integer:=1;	

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: hyperbolic_combinatorial PORT MAP (
          operand_a => operand_a,
          sqrt => sqrt
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	--process for quad and value of angle check i.e. tan check
process
	file      outfile  	: text is out "hyperbolic_comb_data_input.txt";  --declare output file
	file      outfile_1  : text is out "hyperbolic_comb_data_output.txt";  --declare output file
	variable  outline  	: line;   --line number declaration  
	begin
		for loop_var_ext in 0 to 40 loop
			wait for 5*clk_period;
			operand_a <= (std_logic_vector(unsigned(x)+"00000000000000000000110011001100"));
			wait for 5*clk_period;
		if(endoffile='0') then   --if the file end is not reached.
			--write(linenumber,value(real type),justified(side),field(width),digits(natural));
			write(outline, real(to_integer(unsigned(operand_a))), right, 16);
			writeline(outfile, outline);
			write(outline, real(to_integer(unsigned(sqrt))), right, 20);
			writeline(outfile_1, outline);
			linenumber <= linenumber + 1;
		else
			null;
		end if;
			x <=operand_a;
		end loop;
	end process;

END;
