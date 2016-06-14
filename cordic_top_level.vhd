----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:57:45 05/05/2016 
-- Design Name: 
-- Module Name:    cordic_top_level - Behavioral 
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

entity cordic_top_level is
    Port ( angle	: in  STD_LOGIC_VECTOR (15 downto 0);
           sin 	: out  STD_LOGIC_VECTOR (15 downto 0);
           cos 	: out  STD_LOGIC_VECTOR (15 downto 0));
end cordic_top_level;

architecture Behavioral of cordic_top_level is
signal angle_shifted: std_logic_vector(15 downto 0);
signal sin_8_bit: std_logic_vector(7 downto 0);
signal cos_8_bit: std_logic_vector(7 downto 0);
signal x_0			: std_logic_vector(15 downto 0);
signal y_0			: std_logic_vector(15 downto 0);
signal z_0			: std_logic_vector(15 downto 0);
signal x_1			: std_logic_vector(15 downto 0);
signal y_1			: std_logic_vector(15 downto 0);
signal z_1			: std_logic_vector(15 downto 0);
signal x_2			: std_logic_vector(15 downto 0);
signal y_2			: std_logic_vector(15 downto 0);
signal z_2			: std_logic_vector(15 downto 0);
signal x_3			: std_logic_vector(15 downto 0);
signal y_3			: std_logic_vector(15 downto 0);
signal z_3			: std_logic_vector(15 downto 0);
signal x_4			: std_logic_vector(15 downto 0);
signal y_4			: std_logic_vector(15 downto 0);
signal z_4			: std_logic_vector(15 downto 0);
signal x_5			: std_logic_vector(15 downto 0);
signal y_5			: std_logic_vector(15 downto 0);
signal z_5			: std_logic_vector(15 downto 0);
signal x_6			: std_logic_vector(15 downto 0);
signal y_6			: std_logic_vector(15 downto 0);
signal z_6			: std_logic_vector(15 downto 0);
signal x_7			: std_logic_vector(15 downto 0);
signal y_7			: std_logic_vector(15 downto 0);
signal z_7			: std_logic_vector(15 downto 0);
signal x_8			: std_logic_vector(15 downto 0);
signal y_8			: std_logic_vector(15 downto 0);
signal z_8			: std_logic_vector(15 downto 0);
signal x_9			: std_logic_vector(15 downto 0);
signal y_9			: std_logic_vector(15 downto 0);
signal z_9			: std_logic_vector(15 downto 0);
	-- signals for shifted operands
signal x_1_s		: std_logic_vector(15 downto 0);
signal x_2_s		: std_logic_vector(15 downto 0);
signal x_3_s		: std_logic_vector(15 downto 0);
signal x_4_s		: std_logic_vector(15 downto 0);
signal x_5_s		: std_logic_vector(15 downto 0);
signal x_6_s		: std_logic_vector(15 downto 0);
signal x_7_s		: std_logic_vector(15 downto 0);
signal x_8_s		: std_logic_vector(15 downto 0);
signal y_1_s		: std_logic_vector(15 downto 0);
signal y_2_s		: std_logic_vector(15 downto 0);
signal y_3_s		: std_logic_vector(15 downto 0);
signal y_4_s		: std_logic_vector(15 downto 0);
signal y_5_s		: std_logic_vector(15 downto 0);
signal y_6_s		: std_logic_vector(15 downto 0);
signal y_7_s		: std_logic_vector(15 downto 0);
signal y_8_s		: std_logic_vector(15 downto 0);
	-- signals for x carry and ovf
signal ovf_x_0		: std_logic;
signal cout_x_0	: std_logic;	
signal ovf_x_1		: std_logic;
signal cout_x_1	: std_logic;
signal ovf_x_2		: std_logic;
signal cout_x_2	: std_logic;
signal ovf_x_3		: std_logic;
signal cout_x_3	: std_logic;
signal ovf_x_4		: std_logic;
signal cout_x_4	: std_logic;
signal ovf_x_5		: std_logic;
signal cout_x_5	: std_logic;
signal ovf_x_6		: std_logic;
signal cout_x_6	: std_logic;
signal ovf_x_7		: std_logic;
signal cout_x_7	: std_logic;
signal ovf_x_8		: std_logic;
signal cout_x_8	: std_logic;
	-- signals for y carry and ovf
signal ovf_y_0		: std_logic;
signal cout_y_0	: std_logic;	
signal ovf_y_1		: std_logic;
signal cout_y_1	: std_logic;
signal ovf_y_2		: std_logic;
signal cout_y_2	: std_logic;
signal ovf_y_3		: std_logic;
signal cout_y_3	: std_logic;
signal ovf_y_4		: std_logic;
signal cout_y_4	: std_logic;
signal ovf_y_5		: std_logic;
signal cout_y_5	: std_logic;
signal ovf_y_6		: std_logic;
signal cout_y_6	: std_logic;
signal ovf_y_7		: std_logic;
signal cout_y_7	: std_logic;
signal ovf_y_8		: std_logic;
signal cout_y_8	: std_logic;
		--signals for z carry and ovf
signal ovf_z_0		: std_logic;
signal cout_z_0	: std_logic;	
signal ovf_z_1		: std_logic;
signal cout_z_1	: std_logic;
signal ovf_z_2		: std_logic;
signal cout_z_2	: std_logic;
signal ovf_z_3		: std_logic;
signal cout_z_3	: std_logic;
signal ovf_z_4		: std_logic;
signal cout_z_4	: std_logic;
signal ovf_z_5		: std_logic;
signal cout_z_5	: std_logic;	
signal ovf_z_6		: std_logic;
signal cout_z_6	: std_logic;
signal ovf_z_7		: std_logic;
signal cout_z_7	: std_logic;
signal ovf_z_8		: std_logic;
signal cout_z_8	: std_logic;
	--constants
type angle_array is array (0 to 8) of std_logic_vector(15 downto 0);
--64 bits constant angles	: angle_array :=("0000101101000000", "0000011010100110", "0000001110000000", "0000000111000110", "0000000011100110", "0000000001110011" );
constant angles	: angle_array :=("0010110100000000", "0001101010011001", "0000111000000000", "0000011100011001", "0000001110011001", "0000000111001100","0000000011100110","0000000001100110","0000000000110011");
--64 bits constant K_init	: std_logic_vector(15 downto 0):="0000000000100110";
constant K_init	: std_logic_vector(15 downto 0):="0000000010011011";
---------------------------------------------------------------------
begin

------ preparing operands for adders----------
	--x shifted
x_0	<= K_init;
x_1_s	<= "0" & x_1(15 downto 1);
x_2_s	<= "00" & x_2(15 downto 2);
x_3_s	<= "000" & x_3(15 downto 3);
x_4_s	<= "0000" & x_4(15 downto 4);
x_5_s	<= "00000" & x_5(15 downto 5);
x_6_s	<= "00000" & x_6(15 downto 5);
x_7_s	<= "00000" & x_7(15 downto 5);
x_8_s	<= "00000" & x_8(15 downto 5);

	--y shifted
y_0	<= x"0000";
y_1_s	<="0" & y_1(15 downto 1);
y_2_s	<= "00" & y_2(15 downto 2);
y_3_s	<= "000" & y_3(15 downto 3);
y_4_s	<= "0000" & y_4(15 downto 4);
y_5_s	<= "00000" & y_5(15 downto 5);
y_6_s	<= "00000" & y_6(15 downto 5);
y_7_s	<= "00000" & y_7(15 downto 5);
y_8_s	<= "00000" & y_8(15 downto 5);
	--z
angle_shifted	<=angle(7 downto 0) & "00000000"; 	
z_0	<= angle_shifted;
--------------------x adders-----------------	
adder_x0: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>x_0,
           operand_b 	=>y_0,
           mode 			=>not(z_0(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_0,
			  carry_out 	=>cout_x_0,
           result 		=>x_1);
			  
adder_x1: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>x_1,
           operand_b 	=>y_1_s,
           mode 			=>not(z_1(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_1,
			  carry_out 	=>cout_x_1,
           result 		=>x_2);
adder_x2: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>x_2,
           operand_b 	=>y_2_s,
           mode 			=>not(z_2(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_2,
			  carry_out 	=>cout_x_2,
           result 		=>x_3);
adder_x3: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>x_3,
           operand_b 	=>y_3_s,
           mode 			=>not(z_3(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_3,
			  carry_out 	=>cout_x_3,
           result 		=>x_4);

adder_x4: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>x_4,
           operand_b 	=>y_4_s,
           mode 			=>not(z_4(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_4,
			  carry_out 	=>cout_x_4,
           result 		=>x_5);
adder_x5: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>x_5,
           operand_b 	=>y_5_s,
           mode 			=>not(z_5(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_5,
			  carry_out 	=>cout_x_5,
           result 		=>x_6);
adder_x6: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>x_6,
           operand_b 	=>y_6_s,
           mode 			=>not(z_6(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_6,
			  carry_out 	=>cout_x_6,
           result 		=>x_7);
adder_x7: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>x_7,
           operand_b 	=>y_7_s,
           mode 			=>not(z_7(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_7,
			  carry_out 	=>cout_x_7,
           result 		=>x_8);
adder_x8: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>x_8,
           operand_b 	=>y_8_s,
           mode 			=>not(z_8(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_8,
			  carry_out 	=>cout_x_8,
           result 		=>x_9);

-----------------y adders---------
adder_y0: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_0,
           operand_b 	=>x_0,
           mode 			=>z_0(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_0,
			  carry_out 	=>cout_y_0,
           result 		=>y_1);
			  
adder_y1: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_1,
           operand_b 	=>x_1_s,
           mode 			=>z_1(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_1,
			  carry_out 	=>cout_y_1,
           result 		=>y_2);
adder_y2: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_2,
           operand_b 	=>x_2_s,
           mode 			=>z_2(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_2,
			  carry_out 	=>cout_y_2,
           result 		=>y_3);
adder_y3: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_3,
           operand_b 	=>x_3_s,
           mode 			=>z_3(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_3,
			  carry_out 	=>cout_y_3,
           result 		=>y_4);

adder_y4: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_4,
           operand_b 	=>x_4_s,
           mode 			=>z_4(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_4,
			  carry_out 	=>cout_y_4,
           result 		=>y_5);
adder_y5: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_5,
           operand_b 	=>x_5_s,
           mode 			=>z_5(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_5,
			  carry_out 	=>cout_y_5,
           result 		=>y_6);
adder_y6: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_6,
           operand_b 	=>x_6_s,
           mode 			=>z_6(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_6,
			  carry_out 	=>cout_y_6,
           result 		=>y_7);
adder_y7: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_7,
           operand_b 	=>x_7_s,
           mode 			=>z_7(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_7,
			  carry_out 	=>cout_y_7,
           result 		=>y_8);
adder_y8: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_8,
           operand_b 	=>x_8_s,
           mode 			=>z_8(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_8,
			  carry_out 	=>cout_y_8,
           result 		=>y_9);

-----------------z adders---------
adder_z0: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_0,
           operand_b 	=>angles(0),
           mode 			=>not(z_0(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_0,
			  carry_out 	=>cout_z_0,
           result 		=>z_1);
			  
adder_z1: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_1,
           operand_b 	=>angles(1),
           mode 			=>not(z_1(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_1,
			  carry_out 	=>cout_z_1,
           result 		=>z_2);
adder_z2: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_2,
           operand_b 	=>angles(2),
           mode 			=>not(z_2(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_2,
			  carry_out 	=>cout_z_2,
           result 		=>z_3);
adder_z3: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_3,
           operand_b 	=>angles(3),
           mode 			=>not(z_3(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_3,
			  carry_out 	=>cout_z_3,
           result 		=>z_4);

adder_z4: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_4,
           operand_b 	=>angles(4),
           mode 			=>not(z_4(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_4,
			  carry_out 	=>cout_z_4,
           result 		=>z_5);
adder_z5: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_5,
           operand_b 	=>angles(5),
           mode 			=>not(z_5(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_5,
			  carry_out 	=>cout_z_5,
           result 		=>z_6);		
adder_z6: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_6,
           operand_b 	=>angles(6),
           mode 			=>not(z_6(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_6,
			  carry_out 	=>cout_z_6,
           result 		=>z_7);
adder_z7: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_7,
           operand_b 	=>angles(7),
           mode 			=>not(z_7(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_7,
			  carry_out 	=>cout_z_7,
           result 		=>z_8);
adder_z8: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_8,
           operand_b 	=>angles(8),
           mode 			=>not(z_8(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_8,
			  carry_out 	=>cout_z_8,
           result 		=>z_9);			  
------results-------------------------------------
cos		<= x_9;-- (11 downto 0);
sin		<= y_9;--(11 downto 0);	
sin_8_bit	<=y_9(7 downto 0); 
cos_8_bit	<=x_9(7 downto 0);		  
--------------------------------------------------
end Behavioral;

