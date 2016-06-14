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

entity cordic_tan_combinatorial is
    Port ( 	x_in		: in  STD_LOGIC_VECTOR (31 downto 0);
				y_in		: in  STD_LOGIC_VECTOR (31 downto 0);	
           angle_out : out  STD_LOGIC_VECTOR (31 downto 0);
           sqrt_out 	: out  STD_LOGIC_VECTOR (15 downto 0));
end cordic_tan_combinatorial;

architecture Behavioral of cordic_tan_combinatorial is

signal x_0			: std_logic_vector(39 downto 0);
signal y_0			: std_logic_vector(39 downto 0);
signal z_0			: std_logic_vector(39 downto 0);
signal x_1			: std_logic_vector(39 downto 0);
signal y_1			: std_logic_vector(39 downto 0);
signal z_1			: std_logic_vector(39 downto 0);
signal x_2			: std_logic_vector(39 downto 0);
signal y_2			: std_logic_vector(39 downto 0);
signal z_2			: std_logic_vector(39 downto 0);
signal x_3			: std_logic_vector(39 downto 0);
signal y_3			: std_logic_vector(39 downto 0);
signal z_3			: std_logic_vector(39 downto 0);
signal x_4			: std_logic_vector(39 downto 0);
signal y_4			: std_logic_vector(39 downto 0);
signal z_4			: std_logic_vector(39 downto 0);
signal x_5			: std_logic_vector(39 downto 0);
signal y_5			: std_logic_vector(39 downto 0);
signal z_5			: std_logic_vector(39 downto 0);
signal x_6			: std_logic_vector(39 downto 0);
signal y_6			: std_logic_vector(39 downto 0);
signal z_6			: std_logic_vector(39 downto 0);
signal x_7			: std_logic_vector(39 downto 0);
signal y_7			: std_logic_vector(39 downto 0);
signal z_7			: std_logic_vector(39 downto 0);
signal x_8			: std_logic_vector(39 downto 0);
signal y_8			: std_logic_vector(39 downto 0);
signal z_8			: std_logic_vector(39 downto 0);
signal x_9			: std_logic_vector(39 downto 0);
signal y_9			: std_logic_vector(39 downto 0);
signal z_9			: std_logic_vector(39 downto 0);

	-- signals for shifted operands
signal x_1_s		: std_logic_vector(39 downto 0);
signal x_2_s		: std_logic_vector(39 downto 0);
signal x_3_s		: std_logic_vector(39 downto 0);
signal x_4_s		: std_logic_vector(39 downto 0);
signal x_5_s		: std_logic_vector(39 downto 0);
signal x_6_s		: std_logic_vector(39 downto 0);
signal x_7_s		: std_logic_vector(39 downto 0);
signal x_8_s		: std_logic_vector(39 downto 0);
signal y_1_s		: std_logic_vector(39 downto 0);
signal y_2_s		: std_logic_vector(39 downto 0);
signal y_3_s		: std_logic_vector(39 downto 0);
signal y_4_s		: std_logic_vector(39 downto 0);
signal y_5_s		: std_logic_vector(39 downto 0);
signal y_6_s		: std_logic_vector(39 downto 0);
signal y_7_s		: std_logic_vector(39 downto 0);
signal y_8_s		: std_logic_vector(39 downto 0);
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
type angle_array is array (0 to 15) of std_logic_vector(39 downto 0);
--constant angles	: angle_array :=(	"0000000000000000110010010000111111011010", "0000000000000000011101101011000110011100",	
--												"0000000000000000001111101011011011101011", "0000000000000000000111111101010110111010", 
--												"0000000000000000000011111111101010101101", "0000000000000000000001111111111101010101",
--												"0000000000000000000000111111111111101010", "0000000000000000000000011111111111111101",
--												"0000000000000000000000001111111111111111", "0000000000000000000000001000000000000000",
--												"0000000000000000000000000011111111111111", "0000000000000000000000000010000000000000",
--												"0000000000000000000000000000111111111111", "0000000000000000000000000000011111111111",
--												"0000000000000000000000000000010000000000", "0000000000000000000000000000001000000000");
constant angles	: angle_array :=(	"0000000011001001000011111101101010100010", "0000000001110110101100011001110000010101",	
												"0000000000111110101101101110101111110010", "0000000000011111110101011011101010011010", 
												"0000000000001111111110101010110111011011", "0000000000000111111111110101010101101110",
												"0000000000000011111111111110101010101011", "0000000000000001111111111111110101010101",
												"0000000000000000111111111111111110101010", "0000000000000000011111111111111111110101",
												"0000000000000000001111111111111111111110", "0000000000000000000111111111111111111111",
												"0000000000000000000011111111111111111111", "0000000000000000000001111111111111111111",
												"0000000000000000000000111111111111111111", "0000000000000000000000011111111111111111");

--64 bits constant K_init	: std_logic_vector(15 downto 0):="0000000000100110";
constant K_init	: std_logic_vector(15 downto 0):="0000000010011011";
---------------------------------------------------------------------
begin

------ preparing operands for adders----------
	--x shifted
x_0	<=  x_in & "00000000";
x_1_s	<= "0" & x_1(39 downto 1);
x_2_s	<= "00" & x_2(39 downto 2);
x_3_s	<= "000" & x_3(39 downto 3);
x_4_s	<= "0000" & x_4(39 downto 4);
x_5_s	<= "00000" & x_5(39 downto 5);
x_6_s	<= "00000" & x_6(39 downto 5);
x_7_s	<= "00000" & x_7(39 downto 5);
x_8_s	<= "00000" & x_8(39 downto 5);

	--y shifted
y_0	<= y_in & "00000000" ;
y_1_s	<="0" & y_1(39 downto 1);
y_2_s	<= "00" & y_2(39 downto 2);
y_3_s	<= "000" & y_3(39 downto 3);
y_4_s	<= "0000" & y_4(39 downto 4);
y_5_s	<= "00000" & y_5(39 downto 5);
y_6_s	<= "00000" & y_6(39 downto 5);
y_7_s	<= "00000" & y_7(39 downto 5);
y_8_s	<= "00000" & y_8(39 downto 5);
	--z
z_0	<= (others => '0');
--------------------x adders-----------------	
adder_x0: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>x_0,
           operand_b 	=>y_0,
           mode 			=>(y_0(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_0,
			  carry_out 	=>cout_x_0,
           result 		=>x_1);
			  
adder_x1: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>x_1,
           operand_b 	=>y_1_s,
           mode 			=>(y_1(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_1,
			  carry_out 	=>cout_x_1,
           result 		=>x_2);
adder_x2: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>x_2,
           operand_b 	=>y_2_s,
           mode 			=>(y_2(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_2,
			  carry_out 	=>cout_x_2,
           result 		=>x_3);
adder_x3: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>x_3,
           operand_b 	=>y_3_s,
           mode 			=>(y_3(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_3,
			  carry_out 	=>cout_x_3,
           result 		=>x_4);
adder_x4: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>x_4,
           operand_b 	=>y_4_s,
           mode 			=>(y_4(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_4,
			  carry_out 	=>cout_x_4,
           result 		=>x_5);
adder_x5: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>x_5,
           operand_b 	=>y_5_s,
           mode 			=>(y_5(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_5,
			  carry_out 	=>cout_x_5,
           result 		=>x_6);
adder_x6: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>x_6,
           operand_b 	=>y_6_s,
           mode 			=>(y_6(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_6,
			  carry_out 	=>cout_x_6,
           result 		=>x_7);
adder_x7: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>x_7,
           operand_b 	=>y_7_s,
           mode 			=>(y_7(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_7,
			  carry_out 	=>cout_x_7,
           result 		=>x_8);
adder_x8: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>x_8,
           operand_b 	=>y_8_s,
           mode 			=>(y_8(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_x_8,
			  carry_out 	=>cout_x_8,
           result 		=>x_9);

			  
-----------------y adders---------
adder_y0: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_0,
           operand_b 	=>x_0,
           mode 			=>not(y_0(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_0,
			  carry_out 	=>cout_y_0,
           result 		=>y_1);
			  
adder_y1: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_1,
           operand_b 	=>x_1_s,
           mode 			=>not(y_1(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_1,
			  carry_out 	=>cout_y_1,
           result 		=>y_2);
adder_y2: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_2,
           operand_b 	=>x_2_s,
           mode 			=>not(y_2(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_2,
			  carry_out 	=>cout_y_2,
           result 		=>y_3);
adder_y3: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_3,
           operand_b 	=>x_3_s,
           mode 			=>not(y_3(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_3,
			  carry_out 	=>cout_y_3,
           result 		=>y_4);

adder_y4: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_4,
           operand_b 	=>x_4_s,
           mode 			=>not(y_4(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_4,
			  carry_out 	=>cout_y_4,
           result 		=>y_5);
adder_y5: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_5,
           operand_b 	=>x_5_s,
           mode 			=>not(y_5(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_5,
			  carry_out 	=>cout_y_5,
           result 		=>y_6);
adder_y6: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_6,
           operand_b 	=>x_6_s,
           mode 			=>not(y_6(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_6,
			  carry_out 	=>cout_y_6,
           result 		=>y_7);
adder_y7: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_7,
           operand_b 	=>x_7_s,
           mode 			=>not(y_7(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_7,
			  carry_out 	=>cout_y_7,
           result 		=>y_8);
adder_y8: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_8,
           operand_b 	=>x_8_s,
           mode 			=>not(y_8(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y_8,
			  carry_out 	=>cout_y_8,
           result 		=>y_9);

-----------------z adders---------
adder_z0: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_0,
           operand_b 	=>angles(0),
           mode 			=>(y_0(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_0,
			  carry_out 	=>cout_z_0,
           result 		=>z_1);
			  
adder_z1: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_1,
           operand_b 	=>angles(1),
           mode 			=>(y_1(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_1,
			  carry_out 	=>cout_z_1,
           result 		=>z_2);
adder_z2: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_2,
           operand_b 	=>angles(2),
           mode 			=>(y_2(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_2,
			  carry_out 	=>cout_z_2,
           result 		=>z_3);
adder_z3: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_3,
           operand_b 	=>angles(3),
           mode 			=>(y_3(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_3,
			  carry_out 	=>cout_z_3,
           result 		=>z_4);

adder_z4: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_4,
           operand_b 	=>angles(4),
           mode 			=>(y_4(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_4,
			  carry_out 	=>cout_z_4,
           result 		=>z_5);
adder_z5: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_5,
           operand_b 	=>angles(5),
           mode 			=>(y_5(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_5,
			  carry_out 	=>cout_z_5,
           result 		=>z_6);		
adder_z6: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_6,
           operand_b 	=>angles(6),
           mode 			=>(y_6(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_6,
			  carry_out 	=>cout_z_6,
           result 		=>z_7);
adder_z7: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_7,
           operand_b 	=>angles(7),
           mode 			=>(y_7(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_7,
			  carry_out 	=>cout_z_7,
           result 		=>z_8);
adder_z8: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_8,
           operand_b 	=>angles(8),
           mode 			=>(y_8(39)),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_z_8,
			  carry_out 	=>cout_z_8,
           result 		=>z_9);			  
------results-------------------------------------
angle_out <=z_9(39 downto 8); 		  
--------------------------------------------------
end Behavioral;



