----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:16:34 05/31/2016 
-- Design Name: 
-- Module Name:    thirty2_bit_adder - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity forty_bit_adder is
    Port ( operand_a : in  STD_LOGIC_VECTOR (39 downto 0);
           operand_b : in  STD_LOGIC_VECTOR (39 downto 0);
           sum 		: inout  STD_LOGIC_VECTOR (39 downto 0);
           ovf 		: out  STD_LOGIC;
           carry_in 	: in  STD_LOGIC;
           carry_out : out  STD_LOGIC);
end forty_bit_adder;

architecture Behavioral of forty_bit_adder is

signal p_group, g_group	: std_logic_vector(9 downto 0);
signal c_group				: std_logic_vector(10 downto 1);

begin
	first_4bits: entity work.four_bits_CLA_adder
    Port map ( a 			=> operand_a(3 downto 0),	
					b 			=> operand_b(3 downto 0),
					c_in 		=> carry_in,
					p_group 	=> p_group(0),
					g_group 	=> g_group(0),
					sum 		=> sum(3 downto 0));
	second_4bits: entity work.four_bits_CLA_adder
    Port map ( a 			=> operand_a(7 downto 4),	
					b 			=> operand_b(7 downto 4),
					c_in 		=> c_group(1),
					p_group 	=> p_group(1),
					g_group 	=> g_group(1),
					sum 		=> sum(7 downto 4));
	third_4bits: entity work.four_bits_CLA_adder
    Port map ( a 			=> operand_a(11 downto 8),	
					b 			=> operand_b(11 downto 8),
					c_in 		=> c_group(2),
					p_group 	=> p_group(2),
					g_group 	=> g_group(2),
					sum 		=> sum(11 downto 8));
	fourth_4bits: entity work.four_bits_CLA_adder
    Port map ( a 			=> operand_a(15 downto 12),	
					b 			=> operand_b(15 downto 12),
					c_in 		=> c_group(3),
					p_group 	=> p_group(3),
					g_group 	=> g_group(3),
					sum 		=> sum(15 downto 12));
	fifth_4bits: entity work.four_bits_CLA_adder
    Port map ( a 			=> operand_a(19 downto 16),	
					b 			=> operand_b(19 downto 16),
					c_in 		=> c_group(4),
					p_group 	=> p_group(4),
					g_group 	=> g_group(4),
					sum 		=> sum(19 downto 16));
	sixth_4bits: entity work.four_bits_CLA_adder
    Port map ( a 			=> operand_a(23 downto 20),	
					b 			=> operand_b(23 downto 20),
					c_in 		=> c_group(5),
					p_group 	=> p_group(5),
					g_group 	=> g_group(5),
					sum 		=> sum(23 downto 20));
	seventh_4bits: entity work.four_bits_CLA_adder
    Port map ( a 			=> operand_a(27 downto 24),	
					b 			=> operand_b(27 downto 24),
					c_in 		=> c_group(6),
					p_group 	=> p_group(6),
					g_group 	=> g_group(6),
					sum 		=> sum(27 downto 24));
	eighth_4bits: entity work.four_bits_CLA_adder
    Port map ( a 			=> operand_a(31 downto 28),	
					b 			=> operand_b(31 downto 28),
					c_in 		=> c_group(7),
					p_group 	=> p_group(7),
					g_group 	=> g_group(7),
					sum 		=> sum(31 downto 28));
	ninth_4bits: entity work.four_bits_CLA_adder
    Port map ( a 			=> operand_a(35 downto 32),	
					b 			=> operand_b(35 downto 32),
					c_in 		=> c_group(8),
					p_group 	=> p_group(8),
					g_group 	=> g_group(8),
					sum 		=> sum(35 downto 32));
	tenth_4bits: entity work.four_bits_CLA_adder
    Port map ( a 			=> operand_a(39 downto 36),	
					b 			=> operand_b(39 downto 36),
					c_in 		=> c_group(9),
					p_group 	=> p_group(9),
					g_group 	=> g_group(9),
					sum 		=> sum(39 downto 36));					
	CLA_block: entity work.carry_look_ahead_block_extended
	Port map ( 	c_in 		=> carry_in,
					p_group 	=> p_group,
					g_group 	=> g_group,
					C_OUT 	=> c_group);
		-- carry out of 16-bit adder
	carry_out 	<= c_group(10);
	ovf 			<= (not(operand_a(39)) and not(operand_b(39)) and sum(39)) 
					or (operand_a(39) and operand_b(39) and not(sum(39)));
end Behavioral;

