----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:32:10 06/08/2016 
-- Design Name: 
-- Module Name:    norm_rotation_mode - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity norm_rotation_mode is
    Port ( angle 			: in  STD_LOGIC_VECTOR (31 downto 0);
           norm_angle 	: out STD_LOGIC_VECTOR (39 downto 0);
			  quad			: out	STD_LOGIC_VECTOR (1  downto 0)); 
end norm_rotation_mode;

architecture Behavioral of norm_rotation_mode is

	--calculation signals for adder
signal angle_in_int		: integer range 0 to 20694720;
signal second_oprnd		: std_logic_vector(39 downto 0);
signal adder_result		: std_logic_vector(39 downto 0);
signal mode					: std_logic;
signal ovf_dummy			: std_logic;
signal cout_dummy			: std_logic;
	--constants
constant	zero_deg			: std_logic_vector(39 downto 0):=x"0000000000";	
constant	one_80_deg		: std_logic_vector(39 downto 0):=x"0000B40000";
constant	three_60_deg	: std_logic_vector(39 downto 0):=x"0001680000";
constant minus_180_deg	: std_logic_vector(39 downto 0):=x"FFFF4C0000";
constant ninty_deg_int	: integer	:=5898240;
constant one_80_deg_int	: integer	:=11796480;
constant two_70_deg_int	: integer	:=17694720;

begin

adder: entity work.forty_bit_add_sub

	port map ( 
			  operand_a => second_oprnd,
           operand_b => (x"00" & angle),
			  mode 		=> mode,			-- z <0 => add
           over_flow => ovf_dummy,
			  carry_out => cout_dummy,
           result 	=> adder_result);

			  
		angle_in_int 	<= to_integer(unsigned(angle));
		quad 				<= "00" when angle_in_int <= ninty_deg_int else
								"01" when (angle_in_int > ninty_deg_int and angle_in_int <= one_80_deg_int) else
								"10" when (angle_in_int > one_80_deg_int and angle_in_int <= two_70_deg_int) else
								"11";
		mode 				<= '0' when angle_in_int <= ninty_deg_int else
								'1' when (angle_in_int > ninty_deg_int and angle_in_int <= one_80_deg_int) else
								'0' when (angle_in_int > one_80_deg_int and angle_in_int <= two_70_deg_int) else
								'1';
								
		second_oprnd 	<= zero_deg 		when angle_in_int <= ninty_deg_int else 
								one_80_deg 		when (angle_in_int > ninty_deg_int and angle_in_int <= one_80_deg_int) else		--180
								minus_180_deg 	when (angle_in_int > one_80_deg_int and angle_in_int <= two_70_deg_int) else		--180
								three_60_deg;					  
		norm_angle		<= adder_result(23 downto 0) & x"0000";						
end Behavioral;


