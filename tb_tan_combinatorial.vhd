--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:12:43 06/15/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_tan_combinatorial.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tan_combinatorial
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
 
ENTITY tb_tan_combinatorial IS
END tb_tan_combinatorial;
 
ARCHITECTURE behavior OF tb_tan_combinatorial IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT tan_combinatorial
    PORT(
         operand_a : IN  std_logic_vector(31 downto 0);
         operand_b : IN  std_logic_vector(31 downto 0);
         angle : OUT  std_logic_vector(31 downto 0);
         sqrt : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal operand_a : std_logic_vector(31 downto 0) := (others => '0');
   signal operand_b : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';
	signal clk : std_logic := '0';


 	--Outputs
   signal angle : std_logic_vector(31 downto 0);
   signal sqrt : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
signal x 			: std_logic_vector(31 downto 0):="00000000001011010000000000000000";--45 	
signal y 			: std_logic_vector(31 downto 0):="11111110110101000000000000000000"; --(300 with step of 4 and total 200 cycles)  

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
   uut: tan_combinatorial PORT MAP (
          operand_a => operand_a,
          operand_b => operand_b,
          angle => angle,
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

	reset 			<= '1' after 1 ns,'0' after clk_period;
	--process for quad and value of angle check i.e. tan check
process
	file      outfile  	: text is out "tan_comb_data_input_a.txt";  --declare output file
	file      outfile_1  : text is out "tan_comb_data_input_b.txt";  --declare output file
	file      outfile_2  : text is out "tan_comb_sqrt.txt";  --declare output file
	file      outfile_3  : text is out "tan_comb_angle.txt";  --declare output file
	variable  outline  	: line;   --line number declaration  
	begin
		for loop_var_ext in 0 to 300 loop
--				operand_a <= (std_logic_vector(unsigned(x)+"00000000000000000000000000000000"));
--				operand_b <= (std_logic_vector(unsigned(y)+"00000000000000010000000000000000"));
--				operand_a <= (std_logic_vector(unsigned(x)+"00000000000000010000000000000000"));
--				operand_b <= (std_logic_vector(unsigned(y)-"00000000000000010000000000000000"));
			if loop_var_ext > 150 then
				operand_a <= "11111111110100110000000000000000";
				operand_b <= (std_logic_vector(unsigned(y)+"11111111111111000000000000000000"));	--(-4)
			else
				operand_a <= (std_logic_vector(unsigned(x)+"00000000000000000000000000000000"));
				operand_b <= (std_logic_vector(unsigned(y)+"00000000000010000000000000000000"));			
			end if;
			
			wait for 10*clk_period;
		if(endoffile='0') then   --if the file end is not reached.
			--write(linenumber,value(real type),justified(side),field(width),digits(natural));
			write(outline, real(to_integer(unsigned(operand_a))), right, 16);
			writeline(outfile, outline);
			write(outline, real(to_integer(unsigned(operand_b))), right, 16);
			writeline(outfile_1, outline);			
			write(outline, real(to_integer(unsigned(sqrt))), right, 20);
			writeline(outfile_2, outline);
			write(outline, real(to_integer(unsigned(angle))), right, 20);
			writeline(outfile_3, outline);
			linenumber <= linenumber + 1;
		else
			null;
		end if;
			x <=operand_a;
			y <=operand_b;
		end loop;
	end process;

--	operand_a 	<="00000000000000000000000011001000" after clk_period*2, "00000000001011010101000111101011" after clk_period*52, "00000000001000001000111101011100" after clk_period*104, "11111111111111111111111100111000" after 180*clk_period;--after 170*clk_period;
--	operand_b 	<="00000000000000000000000001100100" after clk_period*2, "00000000000001001000100000110001" after clk_period*52, "00000000000000001001000101111100" after clk_period*104, "11111111111111111111111110011100" after 180*clk_period;--after 170*clk_period;



END;
