----------------------------------------------------------------------------------
-- Company: 
-- Engineer: WH
-- 
-- Create Date:    14:23:51 06/01/2016 
-- Design Name: 
-- Module Name:    cordic_linear_32bits - Behavioral 
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

entity cordic_linear_divider_32bits is
    Port ( operand_a : in  STD_LOGIC_VECTOR (31 downto 0);
           operand_b : in  STD_LOGIC_VECTOR (31 downto 0);
           result 	: out STD_LOGIC_VECTOR (31 downto 0));
end cordic_linear_divider_32bits;

architecture Behavioral of cordic_linear_divider_32bits is

signal x_0			: std_logic_vector(39 downto 0);
signal y_0			: std_logic_vector(39 downto 0);
signal z_0			: std_logic_vector(39 downto 0);
signal y_1			: std_logic_vector(39 downto 0);
signal z_1			: std_logic_vector(39 downto 0);
signal y_2			: std_logic_vector(39 downto 0);
signal z_2			: std_logic_vector(39 downto 0);
signal y_3			: std_logic_vector(39 downto 0);
signal z_3			: std_logic_vector(39 downto 0);
signal y_4			: std_logic_vector(39 downto 0);
signal z_4			: std_logic_vector(39 downto 0);
signal y_5			: std_logic_vector(39 downto 0);
signal z_5			: std_logic_vector(39 downto 0);
signal y_6			: std_logic_vector(39 downto 0);
signal z_6			: std_logic_vector(39 downto 0);
signal y_7			: std_logic_vector(39 downto 0);
signal z_7			: std_logic_vector(39 downto 0);
signal y_8			: std_logic_vector(39 downto 0);
signal z_8			: std_logic_vector(39 downto 0);
signal y_9			: std_logic_vector(39 downto 0);
signal z_9			: std_logic_vector(39 downto 0);
signal y_10			: std_logic_vector(39 downto 0);
signal z_10			: std_logic_vector(39 downto 0);
signal y_11			: std_logic_vector(39 downto 0);
signal z_11			: std_logic_vector(39 downto 0);
signal y_12			: std_logic_vector(39 downto 0);
signal z_12			: std_logic_vector(39 downto 0);
signal y_13			: std_logic_vector(39 downto 0);
signal z_13			: std_logic_vector(39 downto 0);
signal y_14			: std_logic_vector(39 downto 0);
signal z_14			: std_logic_vector(39 downto 0);
signal y_15			: std_logic_vector(39 downto 0);
signal z_15			: std_logic_vector(39 downto 0);

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

signal my_one_for_z : std_logic_vector(39 downto 0);
signal dummy_out_1 : std_logic;
signal dummy_out_2 : std_logic;
signal temp : std_logic_vector(39 downto 0);
---------------------------------------------------------------------
begin

------ normalization:preparing operands for adders----------
--x_0				<= x_in;
z_0				<= x"0000000000";
--z_0				<= z_in;
my_one_for_z	<="0000000000000010000000000000000000000000"; --Q15_25 format

norm_1: entity work.normalization_module
	Port map ( 
			  operand 		=>operand_a,
           norm_operand =>y_0,
           type_shift 	=> dummy_out_1);
			  
norm_2: entity work.normalization_module
	Port map ( 
			  operand 		=>operand_b,
           norm_operand =>x_0,
           type_shift 	=> dummy_out_2);
			  
-----------------y adders---------
adder_y1: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_0,
           operand_b 	=>x_0,
           mode 			=>y_0(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_0,
			  carry_out 	=>cout_y_0,
           result 		=>y_1);
			  
adder_y2: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_1,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 1)),
           mode 			=>y_1(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_1,
			  carry_out 	=>cout_y_1,
           result 		=>y_2);
adder_y3: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_2,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 2)),
           mode 			=>y_2(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_2,
			  carry_out 	=>cout_y_2,
           result 		=>y_3);
adder_y4: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_3,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 3)),
           mode 			=>y_3(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_3,
			  carry_out 	=>cout_y_3,
           result 		=>y_4);

adder_y5: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_4,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 4)),
           mode 			=>y_4(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_4,
			  carry_out 	=>cout_y_4,
           result 		=>y_5);
adder_y6: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_5,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 5)),
           mode 			=>y_5(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_5,
			  carry_out 	=>cout_y_5,
           result 		=>y_6);
adder_y7: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_6,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 6)),
           mode 			=>y_6(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_6,
			  carry_out 	=>cout_y_6,
           result 		=>y_7);
adder_y8: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_7,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 7)),
           mode 			=>y_7(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_7,
			  carry_out 	=>cout_y_7,
           result 		=>y_8);
adder_y9: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_8,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 8)),
           mode 			=>y_8(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_8,
			  carry_out 	=>cout_y_8,
           result 		=>y_9);
adder_y10: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_9,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 9)),
           mode 			=>y_9(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_9,
			  carry_out 	=>cout_y_9,
           result 		=>y_10);
adder_y11: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_10,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 10)),
           mode 			=>y_10(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_10,
			  carry_out 	=>cout_y_10,
           result 		=>y_11);
adder_y12: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_11,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 11)),
           mode 			=>y_11(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_11,
			  carry_out 	=>cout_y_11,
           result 		=>y_12);
adder_y13: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_12,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 12)),
           mode 			=>y_12(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_12,
			  carry_out 	=>cout_y_12,
           result 		=>y_13);
adder_y14: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_13,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 13)),
           mode 			=>y_13(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_13,
			  carry_out 	=>cout_y_13,
           result 		=>y_14);
adder_y15: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_14,
           operand_b 	=>(std_logic_vector(unsigned(x_0) srl 14)),
           mode 			=>y_14(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_14,
			  carry_out 	=>cout_y_14,
           result 		=>y_15);			  

-----------------z adders---------
adder_z1: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_0,
           operand_b 	=>my_one_for_z,
           mode 			=>not(y_0(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_0,
			  carry_out 	=>cout_z_0,
           result 		=>z_1);
			  
adder_z2: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_1,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 1)),
           mode 			=>not(y_1(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_1,
			  carry_out 	=>cout_z_1,
           result 		=>z_2);
adder_z3: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_2,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 2)),
           mode 			=>not(y_2(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_2,
			  carry_out 	=>cout_z_2,
           result 		=>z_3);
adder_z4: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_3,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 3)),
           mode 			=>not(y_3(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_3,
			  carry_out 	=>cout_z_3,
           result 		=>z_4);

adder_z5: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_4,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 4)),
           mode 			=>not(y_4(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_4,
			  carry_out 	=>cout_z_4,
           result 		=>z_5);
adder_z6: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_5,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 5)),
           mode 			=>not(y_5(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_5,
			  carry_out 	=>cout_z_5,
           result 		=>z_6);		
adder_z7: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_6,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 6)),
           mode 			=>not(y_6(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_6,
			  carry_out 	=>cout_z_6,
           result 		=>z_7);
adder_z8: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_7,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 7)),
           mode 			=>not(y_7(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_7,
			  carry_out 	=>cout_z_7,
           result 		=>z_8);
adder_z9: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_8,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 8)),
           mode 			=>not(y_8(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_8,
			  carry_out 	=>cout_z_8,
           result 		=>z_9);			  
adder_z10: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_9,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 9)),
           mode 			=>not(y_9(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_9,
			  carry_out 	=>cout_z_9,
           result 		=>z_10);	
adder_z11: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_10,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 10)),
           mode 			=>not(y_10(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_10,
			  carry_out 	=>cout_z_10,
           result 		=>z_11);	
adder_z12: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_11,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 11)),
           mode 			=>not(y_11(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_11,
			  carry_out 	=>cout_z_11,
           result 		=>z_12);	
adder_z13: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_12,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 12)),
           mode 			=>not(y_12(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_12,
			  carry_out 	=>cout_z_12,
           result 		=>z_13);	
adder_z14: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_13,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 13)),
           mode 			=>not(y_13(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_13,
			  carry_out 	=>cout_z_13,
           result 		=>z_14);	
adder_z15: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_14,
           operand_b 	=>(std_logic_vector(unsigned(my_one_for_z) srl 14)),
           mode 			=>not(y_14(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_14,
			  carry_out 	=>cout_z_14,
           result 		=>z_15);				  
------results-------------------------------------
temp <=	(z_15) when ((dummy_out_1='0' and dummy_out_2='0') or (dummy_out_1='1' and dummy_out_2='1')) else
			(std_logic_vector(unsigned(z_15) sll 10)) when (dummy_out_1='1' and dummy_out_2='0') else
			(std_logic_vector(unsigned(z_15) srl 10)); 
result(31 downto 17) <= temp(39 downto 25);
result(16 downto 0) <= temp(24 downto 8); 
--------------------------------------------------
end Behavioral;
