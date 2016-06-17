--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:49:23 06/16/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_rot_combintorial.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rot_combinatorial
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
library std;
use std.textio.all;  --include package textio.vhd 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY tb_rot_combintorial IS
END tb_rot_combintorial;
 
ARCHITECTURE behavior OF tb_rot_combintorial IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rot_combinatorial
    PORT(
         angle : IN  std_logic_vector(31 downto 0);
         sin : OUT  std_logic_vector(31 downto 0);
         cos : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal angle : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal sin : std_logic_vector(31 downto 0);
   signal cos : std_logic_vector(31 downto 0);
   signal clk : std_logic := '0';
 
   constant clk_period : time := 10 ns;
		signal x 			: std_logic_vector(31 downto 0):=x"00000000";	
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
   uut: rot_combinatorial PORT MAP (
          angle => angle,
          sin => sin,
          cos => cos
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
	file      outfile  	: text is out "rot_comb_data_input.txt";  --declare output file
	file      outfile_1  : text is out "rot_comb_data_sin_output.txt";  --declare output file
	file      outfile_2  : text is out "rot_comb_data_cos_output.txt";  --declare output file
	variable  outline  	: line;   --line number declaration  
	begin
		for loop_var_ext in 0 to 40 loop
			wait for 5*clk_period;
			angle <= (std_logic_vector(unsigned(x)+x"00010000"));
			wait for 5*clk_period;
			if(endoffile='0') then   --if the file end is not reached.
				--write(linenumber,value(real type),justified(side),field(width),digits(natural));
				write(outline, real(to_integer(unsigned(angle))), right, 16);
				writeline(outfile, outline);
				write(outline, real(to_integer(unsigned(sin))), right, 20);
				writeline(outfile_1, outline);
				write(outline, real(to_integer(unsigned(cos))), right, 20);
				writeline(outfile_2, outline);			
				linenumber <= linenumber + 1;
			else
				null;
			end if;
			x <=angle;
		end loop;
	end process; 
		  
--	angle 	<="00000000001011010001100110011001" after clk_period*2, "00000000010010110001100110011001" after clk_period*52, "00000000000011110101010001111010" after clk_period*104, "00000000001000010011001100110011" after 180*clk_period;--after 170*clk_period;


END;
