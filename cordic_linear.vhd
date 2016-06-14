----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:27 05/31/2016 
-- Design Name: 
-- Module Name:    cordic_linear - Behavioral 
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

entity cordic_linear is
    Port ( x_in : in  STD_LOGIC_VECTOR (15 downto 0);
           y_in : in  STD_LOGIC_VECTOR (15 downto 0);
           z_in : in  STD_LOGIC_VECTOR (15 downto 0);
           z_out : out  STD_LOGIC_VECTOR (15 downto 0));
end cordic_linear;

architecture Behavioral of cordic_linear is

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
signal x_10			: std_logic_vector(15 downto 0);
signal y_10			: std_logic_vector(15 downto 0);
signal z_10			: std_logic_vector(15 downto 0);
signal x_11			: std_logic_vector(15 downto 0);
signal y_11			: std_logic_vector(15 downto 0);
signal z_11			: std_logic_vector(15 downto 0);
signal x_12			: std_logic_vector(15 downto 0);
signal y_12			: std_logic_vector(15 downto 0);
signal z_12			: std_logic_vector(15 downto 0);
signal x_13			: std_logic_vector(15 downto 0);
signal y_13			: std_logic_vector(15 downto 0);
signal z_13			: std_logic_vector(15 downto 0);
signal x_14			: std_logic_vector(15 downto 0);
signal y_14			: std_logic_vector(15 downto 0);
signal z_14			: std_logic_vector(15 downto 0);
signal x_15			: std_logic_vector(15 downto 0);
signal y_15			: std_logic_vector(15 downto 0);
signal z_15			: std_logic_vector(15 downto 0);

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
signal ovf_y_9		: std_logic;
signal cout_y_9	: std_logic;
signal ovf_y_10	: std_logic;
signal cout_y_10	: std_logic;
signal ovf_y_11	: std_logic;
signal cout_y_11	: std_logic;
signal ovf_y_12	: std_logic;
signal cout_y_12	: std_logic;
signal ovf_y_13	: std_logic;
signal cout_y_13	: std_logic;
signal ovf_y_14	: std_logic;
signal cout_y_14	: std_logic;
signal ovf_y_15	: std_logic;
signal cout_y_15	: std_logic;
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
signal ovf_z_9		: std_logic;
signal cout_z_9	: std_logic;
signal ovf_z_10		: std_logic;
signal cout_z_10	: std_logic;
signal ovf_z_11		: std_logic;
signal cout_z_11	: std_logic;
signal ovf_z_12		: std_logic;
signal cout_z_12	: std_logic;
signal ovf_z_13		: std_logic;
signal cout_z_13	: std_logic;
signal ovf_z_14		: std_logic;
signal cout_z_14	: std_logic;
signal ovf_z_15		: std_logic;
signal cout_z_15	: std_logic;
signal my_one_for_z : std_logic_vector(15 downto 0);
---------------------------------------------------------------------
begin

------ preparing operands for adders----------
x_0				<= x_in;
y_0				<= x"0000";
z_0				<= z_in;
my_one_for_z	<="0100000000000000"; --Q2_14 format

-----------------y adders---------
adder_y1: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_0,
           operand_b 	=>x_0,
           mode 			=>z_0(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_0,
			  carry_out 	=>cout_y_0,
           result 		=>y_1);
			  
adder_y2: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_1,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 1)),
           mode 			=>z_1(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_1,
			  carry_out 	=>cout_y_1,
           result 		=>y_2);
adder_y3: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_2,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 2)),
           mode 			=>z_2(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_2,
			  carry_out 	=>cout_y_2,
           result 		=>y_3);
adder_y4: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_3,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 3)),
           mode 			=>z_3(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_3,
			  carry_out 	=>cout_y_3,
           result 		=>y_4);

adder_y5: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_4,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 4)),
           mode 			=>z_4(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_4,
			  carry_out 	=>cout_y_4,
           result 		=>y_5);
adder_y6: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_5,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 5)),
           mode 			=>z_5(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_5,
			  carry_out 	=>cout_y_5,
           result 		=>y_6);
adder_y7: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_6,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 6)),
           mode 			=>z_6(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_6,
			  carry_out 	=>cout_y_6,
           result 		=>y_7);
adder_y8: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_7,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 7)),
           mode 			=>z_7(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_7,
			  carry_out 	=>cout_y_7,
           result 		=>y_8);
adder_y9: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_8,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 8)),
           mode 			=>z_8(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_8,
			  carry_out 	=>cout_y_8,
           result 		=>y_9);
adder_y10: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_9,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 9)),
           mode 			=>z_9(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_9,
			  carry_out 	=>cout_y_9,
           result 		=>y_10);
adder_y11: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_10,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 10)),
           mode 			=>z_10(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_10,
			  carry_out 	=>cout_y_10,
           result 		=>y_11);
adder_y12: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_11,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 11)),
           mode 			=>z_11(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_11,
			  carry_out 	=>cout_y_11,
           result 		=>y_12);
adder_y13: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_12,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 12)),
           mode 			=>z_12(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_12,
			  carry_out 	=>cout_y_12,
           result 		=>y_13);
adder_y14: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_13,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 13)),
           mode 			=>z_13(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_13,
			  carry_out 	=>cout_y_13,
           result 		=>y_14);
adder_y15: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>y_14,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 14)),
           mode 			=>z_14(15),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_14,
			  carry_out 	=>cout_y_14,
           result 		=>y_15);			  

-----------------z adders---------
adder_z1: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_0,
           operand_b 	=>my_one_for_z,
           mode 			=>not(z_0(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_0,
			  carry_out 	=>cout_z_0,
           result 		=>z_1);
			  
adder_z2: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_1,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 1)),
           mode 			=>not(z_1(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_1,
			  carry_out 	=>cout_z_1,
           result 		=>z_2);
adder_z3: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_2,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 2)),
           mode 			=>not(z_2(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_2,
			  carry_out 	=>cout_z_2,
           result 		=>z_3);
adder_z4: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_3,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 3)),
           mode 			=>not(z_3(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_3,
			  carry_out 	=>cout_z_3,
           result 		=>z_4);

adder_z5: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_4,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 4)),
           mode 			=>not(z_4(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_4,
			  carry_out 	=>cout_z_4,
           result 		=>z_5);
adder_z6: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_5,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 5)),
           mode 			=>not(z_5(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_5,
			  carry_out 	=>cout_z_5,
           result 		=>z_6);		
adder_z7: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_6,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 6)),
           mode 			=>not(z_6(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_6,
			  carry_out 	=>cout_z_6,
           result 		=>z_7);
adder_z8: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_7,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 7)),
           mode 			=>not(z_7(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_7,
			  carry_out 	=>cout_z_7,
           result 		=>z_8);
adder_z9: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_8,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 8)),
           mode 			=>not(z_8(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_8,
			  carry_out 	=>cout_z_8,
           result 		=>z_9);			  
adder_z10: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_9,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 9)),
           mode 			=>not(z_9(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_9,
			  carry_out 	=>cout_z_9,
           result 		=>z_10);	
adder_z11: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_10,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 10)),
           mode 			=>not(z_10(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_10,
			  carry_out 	=>cout_z_10,
           result 		=>z_11);	
adder_z12: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_11,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 11)),
           mode 			=>not(z_11(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_11,
			  carry_out 	=>cout_z_11,
           result 		=>z_12);	
adder_z13: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_12,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 12)),
           mode 			=>not(z_12(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_12,
			  carry_out 	=>cout_z_12,
           result 		=>z_13);	
adder_z14: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_13,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 13)),
           mode 			=>not(z_13(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_13,
			  carry_out 	=>cout_z_13,
           result 		=>z_14);	
adder_z15: entity work.sixteen_bits_add_sub
	Port map ( 
			  operand_a 	=>z_14,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 14)),
           mode 			=>not(z_14(15)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_14,
			  carry_out 	=>cout_z_14,
           result 		=>z_15);				  
------results-------------------------------------
z_out <=y_15;
--------------------------------------------------
end Behavioral;

