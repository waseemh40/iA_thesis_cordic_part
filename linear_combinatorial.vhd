----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:05:09 06/14/2016 
-- Design Name: 
-- Module Name:    linear_combinatorial - Behavioral 
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

entity linear_combinatorial is
    Port ( operand_a : in  STD_LOGIC_VECTOR (31 downto 0);
           operand_b : in  STD_LOGIC_VECTOR (31 downto 0);
           result 	: out STD_LOGIC_VECTOR (31 downto 0);
           reset 		: in  STD_LOGIC;
			  clk			: in 	STD_LOGIC;
           ovf 		: out STD_LOGIC);
end linear_combinatorial;

architecture Behavioral of linear_combinatorial is
	--initial signals
signal x_0,y_0,z_0	: std_logic_vector(39 downto 0);
	--x y and z signals
type my_sig_array is array (0 to 15) of std_logic_vector(39 downto 0);
signal x_sig	: my_sig_array :=(	x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000", 	
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000"
										);
signal y_sig	: my_sig_array :=(	x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000", 	
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000"
										);
signal z_sig	: my_sig_array :=(	x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000", 	
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000"
										);
	--constants for z adders											
constant my_one	: my_sig_array :=(	x"0001000000",	x"0000800000",	x"0000400000",	x"0000200000", 	
													x"0000100000",	x"0000080000",	x"0000040000",	x"0000020000",
													x"0000010000",	x"0000008000",	x"0000004000",	x"0000002000",
													x"0000001000",	x"0000000800",	x"0000000400",	x"0000000200"
										);
	--adder results
signal y_addr_rslt : my_sig_array :=(	x"0000010000",	x"0000000000",	x"0000000000",	x"0000000000", 	
													x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
													x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
													x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000"
											);
											
signal z_addr_rslt : my_sig_array :=(	x"0001000000",	x"0000000000",	x"0000000000",	x"0000000000", 	
													x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
													x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
													x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000"
											);
	--dummy signals for adders
signal dummy_cout_y				: std_logic_vector(15 downto 0);	
signal dummy_ovf_y				: std_logic_vector(15 downto 0);
signal dummy_cout_z				: std_logic_vector(15 downto 0);	
signal dummy_ovf_z				: std_logic_vector(15 downto 0);
signal dummy_out_1				: std_logic;
signal dummy_out_2				: std_logic;
	
begin

--------portmaps....-----------
	--normalization portmap
norm_1: entity work.norm_linear_module--normalization_module
	Port map ( 
			  operand 		=>	operand_a,
           norm_operand =>	x_0,
           type_shift 	=> dummy_out_1);
			  
norm_2: entity work.norm_linear_module--normalization_module
	Port map ( 
			  operand 		=>	operand_b,
           norm_operand =>	z_0,
           type_shift 	=> dummy_out_2);
		--y adders
GEN_Y_ADDERS: 
   for I in 0 to 15 generate
      y_adder : entity work.forty_bit_add_sub
		port map
			( operand_a 	=> y_sig(I),
           operand_b 	=> x_sig(I),
           mode 			=> z_sig(I)(39),			-- 0: addition; 1 subtraction
           over_flow 	=> dummy_cout_y(I),
			  carry_out 	=> dummy_ovf_y(I),
           result 		=> y_addr_rslt(I));
   end generate GEN_Y_ADDERS;
	--z adders
GEN_Z_ADDERS: 
   for I in 0 to 15 generate
      z_adder : entity work.forty_bit_add_sub
		port map
			( operand_a 	=> z_sig(I),
           operand_b 	=> my_one(I),
           mode 			=> not(z_sig(I)(39)),			-- 0: addition; 1 subtraction
           over_flow 	=> dummy_cout_z(I),
			  carry_out 	=> dummy_ovf_z(I),
           result 		=> z_addr_rslt(I));
   end generate GEN_Z_ADDERS;
	
--------combinatorial part: signal assignments--------
	--init
	y_0		<= x"0000000000";
	--x signals
x_sig(0)		<= x_0;
x_sig(1)		<= '0' & x_sig(0)( 39 downto 1);
x_sig(2)		<= '0' & x_sig(1)( 39 downto 1);
x_sig(3)		<= '0' & x_sig(2)( 39 downto 1);
x_sig(4)		<= '0' & x_sig(3)( 39 downto 1);
x_sig(5)		<= '0' & x_sig(4)( 39 downto 1);
x_sig(6)		<= '0' & x_sig(5)( 39 downto 1);
x_sig(7)		<= '0' & x_sig(6)( 39 downto 1);
x_sig(8)		<= '0' & x_sig(7)( 39 downto 1);
x_sig(9)		<= '0' & x_sig(8)( 39 downto 1);
x_sig(10)	<= '0' & x_sig(9)( 39 downto 1);
x_sig(11)	<= '0' & x_sig(10)( 39 downto 1);
x_sig(12)	<= '0' & x_sig(11)( 39 downto 1);
x_sig(13)	<= '0' & x_sig(12)( 39 downto 1);
x_sig(14)	<= '0' & x_sig(13)( 39 downto 1);
x_sig(15)	<= '0' & x_sig(14)( 39 downto 1);
	--y signals
y_sig(0)		<= y_0;
y_sig(1)		<= y_addr_rslt(0);
y_sig(2)		<= y_addr_rslt(1);
y_sig(3)		<= y_addr_rslt(2);
y_sig(4)		<= y_addr_rslt(3);
y_sig(5)		<= y_addr_rslt(4);
y_sig(6)		<= y_addr_rslt(5);
y_sig(7)		<= y_addr_rslt(6);
y_sig(8)		<= y_addr_rslt(7);
y_sig(9)		<= y_addr_rslt(8);
y_sig(10)	<= y_addr_rslt(9);
y_sig(11)	<= y_addr_rslt(10);
y_sig(12)	<= y_addr_rslt(11);
y_sig(13)	<= y_addr_rslt(12);
y_sig(14)	<= y_addr_rslt(13);
y_sig(15)	<= y_addr_rslt(14);
	--z signals
z_sig(0)		<= z_0;
z_sig(1)		<= z_addr_rslt(0);
z_sig(2)		<= z_addr_rslt(1);
z_sig(3)		<= z_addr_rslt(2);
z_sig(4)		<= z_addr_rslt(3);
z_sig(5)		<= z_addr_rslt(4);
z_sig(6)		<= z_addr_rslt(5);
z_sig(7)		<= z_addr_rslt(6);
z_sig(8)		<= z_addr_rslt(7);
z_sig(9)		<= z_addr_rslt(8);
z_sig(10)	<= z_addr_rslt(9);
z_sig(11)	<= z_addr_rslt(10);
z_sig(12)	<= z_addr_rslt(11);
z_sig(13)	<= z_addr_rslt(12);
z_sig(14)	<= z_addr_rslt(13);
z_sig(15)	<= z_addr_rslt(14);
end Behavioral;

