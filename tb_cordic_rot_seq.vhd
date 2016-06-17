--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:04:52 06/08/2016
-- Design Name:   
-- Module Name:   /home/waseemh/Xilinx_Proj/iA_cordic_6stage/tb_cordic_rot_seq.vhd
-- Project Name:  iA_cordic_6stage
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cordic_seq_rot
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
 
ENTITY tb_cordic_rot_seq IS
END tb_cordic_rot_seq;
 
ARCHITECTURE behavior OF tb_cordic_rot_seq IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cordic_seq_rot
    PORT(
         angle : IN  std_logic_vector(31 downto 0);
         sin : OUT  std_logic_vector(31 downto 0);
         cos : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         start : IN  std_logic;
         opr_done : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal angle : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal start : std_logic := '0';

 	--Outputs
   signal sin : std_logic_vector(31 downto 0);
   signal cos : std_logic_vector(31 downto 0);
   signal opr_done : std_logic;

   -- Clock period definitions
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
   uut: cordic_seq_rot PORT MAP (
          angle => angle,
          sin => sin,
          cos => cos,
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
	file      outfile  	: text is out "rotational_final_data_input.txt";  --declare output file
	file      outfile_1  : text is out "rotational_final_data_sin_output.txt";  --declare output file
	file      outfile_2  : text is out "rotational_final_data_cos_output.txt";  --declare output file
	variable  outline  	: line;   --line number declaration  
	begin
		for loop_var_ext in 0 to 40 loop
			wait for 5*clk_period;
			for loop_var_int in 0 to 75 loop
				angle <= (std_logic_vector(unsigned(x)+x"00010000"));
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
 
--	rst 			<= '1' after 1 ns,'0' after clk_period;
--	start			<= '0' after 1 ns, '1' after clk_period*3, '0' after 41 ns, '1' after clk_period*70, '0' after clk_period*71, '1' after clk_period*125, '0' after clk_period*126, '1' after clk_period*185, '0' after clk_period*186;--clk_period*175, '0' after clk_period*176;
--	angle 		<="00000000001111100000000000000000" after clk_period*2, "00000000100111110000000000000000" after clk_period*52, "00000000111111110000000000000000" after clk_period*104, "00000001001110000000000000000000" after 180*clk_period;--after 170*clk_period;
--1	angle 		<="00000000100001110100001010001111" after clk_period*2, "00000000000000011000000000000000" after clk_period*52, "00000000001101010000000000000000" after clk_period*104, "00000000001101011000000000000000" after 180*clk_period;--after 170*clk_period;
--2	angle 	<="00000000001011010001100110011001" after clk_period*2, "00000000010010110001100110011001" after clk_period*52, "00000000000011110101010001111010" after clk_period*104, "00000000001000010011001100110011" after 180*clk_period;--after 170*clk_period;
--1 => 135, 2, 52.5, 53.5
--2 =>45.1,75.1,15.33,33.2
--3 => 62, 159, 255, 312 
END;
