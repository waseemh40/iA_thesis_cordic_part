--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:12:47 06/02/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_cordic_mul_sequ.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: coridc_linear_sequential
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
 
ENTITY tb_cordic_mul_sequ IS
END tb_cordic_mul_sequ;
 
ARCHITECTURE behavior OF tb_cordic_mul_sequ IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT coridc_linear_sequential
    PORT(
         operand_a : IN  std_logic_vector(31 downto 0);
         operand_b : IN  std_logic_vector(31 downto 0);
         result : INOUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         start : IN  std_logic;
			ovf	: OUT std_logic;
         opr_done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal operand_a : std_logic_vector(31 downto 0) := (others => '0');
   signal operand_b : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal start : std_logic := '0';
	signal ovf		: std_logic:='0';

	--BiDirs
   signal result : std_logic_vector(31 downto 0);

 	--Outputs
   signal opr_done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
		--x=> -180 to 180 with setp of 1
		--y=> 180 to -180 with step of -1
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
   uut: coridc_linear_sequential PORT MAP (
          operand_a => operand_a,
          operand_b => operand_b,
          result => result,
          clk => clk,
          rst => rst,
          start => start,
			 ovf => ovf,
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
 	rst <= '1' after 1 ns,'0' after clk_period;
	--process for quad and value of angle check i.e. tan check
process
	file      outfile  	: text is out "linear_final_input_a.txt";  --declare output file
	file      outfile_1  : text is out "linear_final_input_b.txt";  --declare output file
	file      outfile_2  : text is out "linear_final_output.txt";  --declare output file
	variable  outline  	: line;   --line number declaration  
	begin
		for loop_var_ext in 0 to 360 loop
			wait for 5*clk_period;
			for loop_var_int in 0 to 75 loop
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
			write(outline, real(to_integer(unsigned(result))), right, 20);
			writeline(outfile_2, outline);
			linenumber <= linenumber + 1;
		else
			null;
		end if;
			x <=operand_a;
			y <=operand_b;
		end loop;
	end process;

--	rst <= '1' after 1 ns,'0' after clk_period;
--	start	<= '0' after 1 ns, '1' after clk_period*3, '0' after 41 ns, '1' after clk_period*57, '0' after clk_period*58, '1' after clk_period*109, '0' after clk_period*110, '1' after clk_period*161, '0' after clk_period*162, '1' after clk_period*215, '0' after clk_period*216, '1' after clk_period*270, '0' after clk_period*271, '1' after clk_period*330, '0' after clk_period*331, '1' after 400*clk_period, '0' after 401*clk_period, '1' after 455*clk_period, '0' after 456*clk_period;--clk_period*2
--	operand_a <="00000000000011011100000000000000" after 5 ns,"00000000000000000011000000000000" after clk_period*50,"00000000111111110000000000000000" after clk_period*100,"00000000111100001011001100110011" after clk_period*150,"00000000011111110100010100011110" after clk_period*200,"11111111111111001010011001100111" after clk_period*250,"11111111111111001010011001100111" after clk_period*310,"00000000000000000000001010001111" after 370*clk_period,"00000000000000000000001100010010" after 430*clk_period;
--	operand_b <="00000000000011011000000000000000" after 5 ns,"00000000000000000010000000000000" after clk_period*50,"00000000111111110000000000000000" after clk_period*100,"00000000011010101010100011110101" after clk_period*150,"00000000011111110100010100011110" after clk_period*200,"00000000000000110101100110011001" after clk_period*250,"11111111111111001010011001100111" after clk_period*310,"00000000000000000000110011001101" after 370*clk_period,"00000000000000001000111101011100" after 430*clk_period; 
--13.75*13.5
--0.1875*0.125
--255*255
--240.6999969482421875*106.6599884033203125
--127.27*127.27
--(-3.35)*3.35
--(-3.35)(-3.35)
--0.01*0.05
--0.012*0.56
END;
