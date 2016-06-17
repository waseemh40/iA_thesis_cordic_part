-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY tb_rot_combinatorial IS
  END tb_rot_combinatorial;

  ARCHITECTURE behavior OF tb_rot_combinatorial IS 

  -- Component Declaration
          COMPONENT rotational_combinatorial
          PORT(
                  angle : IN std_logic_vector(31 downto 0);
                  sin 	: out std_logic_vector(31 downto 0);       
                  cos 	: OUT std_logic_vector(31 downto 0)
                  );
          END COMPONENT;
				signal angle	: 	std_logic_vector(31 downto 0);
				SIGNAL sin 		:  std_logic_vector(31 downto 0);
				SIGNAL cos 		:  std_logic_vector(31 downto 0);
   constant clk_period : time := 10 ns;
				
          

  BEGIN

  -- Component Instantiation
          uut: rotational_combinatorial PORT MAP(
                  angle => angle,
                  sin 	=> sin,
						cos	=> cos
          );

angle 	<="00000000001011010001100110011001" after clk_period*2, "00000000010010110001100110011001" after clk_period*52, "00000000000011110101010001111010" after clk_period*104, "00000000001000010011001100110011" after 180*clk_period;--after 170*clk_period;

END;
