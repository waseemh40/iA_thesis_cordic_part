--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:24:00 06/04/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_cordic_seq_tan.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: coridc_seq_tan
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
 
ENTITY tb_cordic_seq_tan IS
END tb_cordic_seq_tan;
 
ARCHITECTURE behavior OF tb_cordic_seq_tan IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT coridc_seq_tan
    PORT(
         operand_a : IN  std_logic_vector(31 downto 0);
         operand_b : IN  std_logic_vector(31 downto 0);
         mode : IN  std_logic;
         angle : INOUT  std_logic_vector(31 downto 0);
         sqrt : INOUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         start : IN  std_logic;
         opr_done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal operand_a : std_logic_vector(31 downto 0) := (others => '0');
   signal operand_b : std_logic_vector(31 downto 0) := (others => '0');
   signal mode : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal start : std_logic := '0';

	--BiDirs
   signal angle : std_logic_vector(31 downto 0);
   signal sqrt : std_logic_vector(31 downto 0);

 	--Outputs
   signal opr_done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
--tan	angle signal x 			: std_logic_vector(31 downto 0):="00000000001011010000000000000000";--45 	
--tan angle	signal y 			: std_logic_vector(31 downto 0):="00000000000000000000000000000000"; --(0  
	signal x 			: std_logic_vector(31 downto 0):="11111111010011000000000000000000";--(-180)	
	signal y 			: std_logic_vector(31 downto 0):="00000000101101000000000000000000"; --180 

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
   uut: coridc_seq_tan PORT MAP (
          operand_a => operand_a,
          operand_b => operand_b,
          mode => mode,
          angle => angle,
          sqrt => sqrt,
          clk => clk,
          rst => rst,
          start => start,
          opr_done => opr_done
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

	rst 			<= '1' after 1 ns,'0' after clk_period;
	mode			<= '1' after clk_period;
	--process for quad and value of angle check i.e. tan check
process
	file      outfile  	: text is out "tan_sqrt_data_input_a.txt";  --declare output file
	file      outfile_1  : text is out "tan_sqrt_data_input_b.txt";  --declare output file
	file      outfile_2  : text is out "tan_sqrt_data_output.txt";  --declare output file
	variable  outline  	: line;   --line number declaration  
	begin
		for loop_var_ext in 0 to 1800 loop
			wait for 5*clk_period;
			for loop_var_int in 0 to 75 loop
--angle				operand_a <= (std_logic_vector(unsigned(x)+"00000000000000000000000000000000"));
--angle				operand_b <= (std_logic_vector(unsigned(y)+"00000000000000000001100110011001"));
				operand_a <= (std_logic_vector(unsigned(x)+"00000000000000010000000000000000"));
				operand_b <= (std_logic_vector(unsigned(y)-"00000000000000010000000000000000"));
				if(loop_var_int=10) then
					start <='1';
				else
					start	<= '0';
				end if;
				wait for clk_period;
			end loop;
			wait for clk_period;
		if(endoffile='0') then   --if the file end is not reached.
			--write(linenumber,value(real type),justified(side),field(width),digits(natural));
			write(outline, real(to_integer(unsigned(operand_a))), right, 16);
			writeline(outfile, outline);
			write(outline, real(to_integer(unsigned(operand_b))), right, 16);
			writeline(outfile_1, outline);			
			write(outline, real(to_integer(unsigned(sqrt))), right, 20);
			writeline(outfile_2, outline);
			linenumber <= linenumber + 1;
		else
			null;
		end if;
			x <=operand_a;
			y <=operand_b;
		end loop;
	end process;

	--for sqrt
--process
--	--variable loop_var_ext : integer range 0 to 20;
--	--variable loop_var_int : integer range 0 to 20;
--
--		--process for sqrt check
--	begin
--		for loop_var_ext in 0 to 100 loop
--			for loop_var_int in 0 to 70 loop
--				operand_a <= (std_logic_vector(unsigned(x)+x"50000"));
--				operand_b <= (std_logic_vector(unsigned(y)+x"50000"));
--				if(loop_var_int=5) then
--					start <='1';
--				else
--					start	<= '0';
--				end if;
--				wait for clk_period;
--			end loop;
--			wait for clk_period;
--			x <=operand_a;
--			y <=operand_b;
--		end loop;
--	end process;


	--process for quad and value of angle check i.e. tan check
--	signal x 			: std_logic_vector(31 downto 0):=x"00010000";	
--	signal y 			: std_logic_vector(31 downto 0):=x"FFF00000"; 

--	begin
--		for loop_var_ext in 0 to 100 loop
--			start <= '1';
--			for loop_var_int in 0 to 55 loop
--				operand_a <= (std_logic_vector(unsigned(x)-8000));
--				operand_b <= (std_logic_vector(unsigned(y)+50000));
--				if(loop_var_int=1) then
--					start <='0';
--				end if;
--				wait for clk_period;
--			end loop;
--			wait for clk_period;
--			x <=operand_a;
--			y <=operand_b;
--		end loop;
--	end process;
--	start			<= '0' after 1 ns, '1' after clk_period*3, '0' after 41 ns, '1' after clk_period*70, '0' after clk_period*71, '1' after clk_period*125, '0' after clk_period*126, '1' after clk_period*185, '0' after clk_period*186;--clk_period*175, '0' after clk_period*176;
--	operand_a 	<="00000000000000000000000011001000" after clk_period*2, "00000000001011010101000111101011" after clk_period*52, "00000000001000001000111101011100" after clk_period*104, "11111111111111111111111100111000" after 180*clk_period;--after 170*clk_period;
--	operand_b 	<="00000000000000000000000001100100" after clk_period*2, "00000000000001001000100000110001" after clk_period*52, "00000000000000001001000101111100" after clk_period*104, "11111111111111111111111110011100" after 180*clk_period;--after 170*clk_period;
	
END;
