--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:21:58 06/09/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_hyper_seq_module.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cordic_hyperbolic_seq
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
use std.textio.all;  --include package textio.vhd
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

 
ENTITY tb_hyper_seq_module IS
END tb_hyper_seq_module;
 
ARCHITECTURE behavior OF tb_hyper_seq_module IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cordic_hyperbolic_seq
    PORT(
         operand_a : IN  std_logic_vector(31 downto 0);
         sqrt : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         start : IN  std_logic;
         opr_done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal operand_a : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal start : std_logic := '0';

 	--Outputs
   signal sqrt : std_logic_vector(31 downto 0);
   signal opr_done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	signal x 			: std_logic_vector(31 downto 0):=x"FFFF0000";		--(-1)	
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
   uut: cordic_hyperbolic_seq PORT MAP (
          operand_a => operand_a,
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
 
	rst <= '1' after 1 ns,'0' after clk_period;
	--process for quad and value of angle check i.e. tan check
process
	file      outfile  	: text is out "hyperbolic_data_input.txt";  --declare output file
	file      outfile_1  : text is out "hyperbolic_data_output.txt";  --declare output file
	variable  outline  	: line;   --line number declaration  
	begin
		for loop_var_ext in 0 to 40 loop
			wait for 5*clk_period;
			for loop_var_int in 0 to 75 loop
				operand_a <= (std_logic_vector(unsigned(x)+"00000000000000000000110011001100"));
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
			write(outline, real(to_integer(unsigned(sqrt))), right, 20);
			writeline(outfile_1, outline);
			linenumber <= linenumber + 1;
		else
			null;
		end if;
			x <=operand_a;
		end loop;
	end process;
	------------------------
--write process
--	writing :
--	process
--		 file      outfile  : text is out "hyperbolic_data.txt";  --declare output file
--		 variable  outline  : line;   --line number declaration  
--	begin
--	wait until clk = '0' and clk'event;
--	if(endoffile='0') then   --if the file end is not reached.
--	--write(linenumber,value(real type),justified(side),field(width),digits(natural));
--	write(outline, loop_var, right, 16);
--	-- write line to external file.
--	writeline(outfile, outline);
--	linenumber <= linenumber + 1;
--	else
--	null;
--	end if;
--	end process writing;	
--------------------------------------------
	
--	start	<= '0' after 1 ns, '1' after clk_period*3, '0' after 41 ns, '1' after clk_period*57, '0' after clk_period*58, '1' after clk_period*109, '0' after clk_period*110, '1' after clk_period*161, '0' after clk_period*162, '1' after clk_period*215, '0' after clk_period*216, '1' after clk_period*270, '0' after clk_period*271, '1' after clk_period*330, '0' after clk_period*331, '1' after 400*clk_period, '0' after 401*clk_period, '1' after 455*clk_period, '0' after 456*clk_period;--clk_period*2
--	operand_a <="11111111111111110100000000000000" after 5 ns,"00000000000000000011000000000000" after clk_period*50,"00000000000000000001110000111100" after clk_period*100,"00000000000000001011001100110011" after clk_period*150,"00000000000000000100010100011110" after clk_period*200,"00000000000000001010011001100111" after clk_period*250,"00000000000000001010011001100111" after clk_period*310,"00000000000000000000001010001111" after 370*clk_period,"00000000000000000000001100010010" after 430*clk_period;

--0.75
--0.1875
--255*255
--240.6999969482421875*106.6599884033203125
--127.27*127.27
--(-3.35)*3.35
--(-3.35)(-3.35)
--0.01*0.05
--0.012*0.56

END;
