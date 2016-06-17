----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:48:50 06/16/2016 
-- Design Name: 
-- Module Name:    rot_combinatorial - Behavioral 
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

entity rot_combinatorial is
    Port ( angle : in  STD_LOGIC_VECTOR (31 downto 0);
           sin : out  STD_LOGIC_VECTOR (31 downto 0);
           cos : out  STD_LOGIC_VECTOR (31 downto 0));
end rot_combinatorial;

architecture Behavioral of rot_combinatorial is
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
		-- x and y shifted signals
signal x_shftd	: my_sig_array	:=(	x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000", 	
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000"
											 );
signal y_shftd	: my_sig_array:=	(	x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000", 	
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
												x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000"
											 );		
		--constants
type angle_array is array (0 to 15) of std_logic_vector(39 downto 0);		
	--for z adders											
constant angles	: angle_array :=(	"0010110011111111111111111111111111111111", "0001101010010000101001110011000110100110",	
												"0000111000001001010001110100000001111101", "0000011100100000000000010001001001001001", 
												"0000001110010011100010101010011001001100", "0000000111001010001101111001010011100101",
												"0000000011100101001010100001101010110001", "0000000001110010100101101101011110100001",
												"0000000000111001010010111010010100011011", "0000000000011100101001011101100110110111",
												"0000000000001110010100101110110111000000", "0000000000000111001010010111011011111101",
												"0000000000000011100101001011101110000010", "0000000000000001110010100101110111000001",
												"0000000000000000111001010010111011100000", "0000000000000000011100101001011101110000"
											);
	--adder results
signal x_addr_rslt : my_sig_array :=(	x"0000010000",	x"0000000000",	x"0000000000",	x"0000000000", 	
													x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
													x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000",
													x"0000000000",	x"0000000000",	x"0000000000",	x"0000000000"
												);

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
	--constants
constant K_n	:std_logic_vector(39 downto 0) :=x"009B780346";	--0.6073*256 Q16_24 format	

	--result adder logic
signal sin_invrtd				: std_logic_vector(39 downto 0);
signal cos_invrtd				: std_logic_vector(39 downto 0);
signal sin_add_result		: std_logic_vector(39 downto 0);
signal cos_add_result		: std_logic_vector(39 downto 0);
signal quadrant				: std_logic_vector(1 downto 0);
	

begin

--------portmaps....-----------

	--normalization portmap
norm_1: entity work.norm_rotation_mode
	Port map ( 
			  angle 		 	=> angle,
           norm_angle 	=> z_0,
			  quad			=> quadrant
			  );
			  
		--x adders
GEN_X_ADDERS: 
   for I in 0 to 14 generate
      x_adder : entity work.forty_bit_add_sub
		port map
			( operand_a 	=> x_sig(I),
           operand_b 	=> y_shftd(I),
           mode 			=> not(z_sig(I)(39)),			
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> x_addr_rslt(I));
   end generate GEN_X_ADDERS;
		
		--y adders
GEN_Y_ADDERS: 
   for I in 0 to 14 generate
      y_adder : entity work.forty_bit_add_sub
		port map
			( operand_a 	=> y_sig(I),
           operand_b 	=> x_shftd(I),
           mode 			=> z_sig(I)(39),			-- 0: addition; 1 subtraction
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> y_addr_rslt(I));
   end generate GEN_Y_ADDERS;
	--z adders
GEN_Z_ADDERS: 
   for I in 0 to 14 generate
      z_adder : entity work.forty_bit_add_sub
		port map
			( operand_a 	=> z_sig(I),
           operand_b 	=> angles(I),
           mode 			=> not(z_sig(I)(39)),			-- maybe a problem in synthesis...
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> z_addr_rslt(I));
   end generate GEN_Z_ADDERS;
		--result adder
adder_sin: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=> sin_invrtd,
           operand_b 	=> x"0000000001",
           mode 			=> '0',
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> sin_add_result);			  
adder_cos: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=> cos_invrtd,
           operand_b 	=> x"0000000001",
           mode 			=> '0',
           over_flow 	=> open,
			  carry_out 	=> open,
           result 		=> cos_add_result);			  
--------combinatorial part: signal assignments--------
	--init
	y_0			<= x"0000000000";	
	--x signals update
	x_sig(0)		<= K_n;
	x_sig(1)		<= x_addr_rslt(0);
	x_sig(2)		<= x_addr_rslt(1);
	x_sig(3)		<= x_addr_rslt(2);
	x_sig(4)		<= x_addr_rslt(3);
	x_sig(5)		<= x_addr_rslt(4);
	x_sig(6)		<= x_addr_rslt(5);
	x_sig(7)		<= x_addr_rslt(6);
	x_sig(8)		<= x_addr_rslt(7);
	x_sig(9)		<= x_addr_rslt(8);
	x_sig(10)	<= x_addr_rslt(9);
	x_sig(11)	<= x_addr_rslt(10);
	x_sig(12)	<= x_addr_rslt(11);
	x_sig(13)	<= x_addr_rslt(12);
	x_sig(14)	<= x_addr_rslt(13);
	x_sig(15)	<= x_addr_rslt(14);
	--y signals update
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
	
		-- shifted signals
	-- x shifted siganls
	x_shftd(0)		<= x_sig(0);		--same as x_0
	x_shftd(1)		<= '0' & x_sig(1)(39 downto 1) when x_sig(1)(39)='0' else
							'1' & x_sig(1)(39 downto 1);
	x_shftd(2)		<= "00" & x_sig(2)(39 downto 2) when x_sig(2)(39)='0' else
							"11" & x_sig(2)(39 downto 2);
	x_shftd(3)		<= "000" & x_sig(3)(39 downto 3) when x_sig(3)(39)='0' else
							"111" & x_sig(3)(39 downto 3);
	x_shftd(4)		<= "0000" & x_sig(4)(39 downto 4) when x_sig(4)(39)='0' else
							"1111" & x_sig(4)(39 downto 4);
	x_shftd(5)		<= "00000" & x_sig(5)(39 downto 5) when x_sig(5)(39)='0' else
							"11111" & x_sig(5)(39 downto 5);
	x_shftd(6)		<= "000000" & x_sig(6)(39 downto 6) when x_sig(6)(39)='0' else
							"111111" & x_sig(6)(39 downto 6);
	x_shftd(7)		<= "0000000" & x_sig(7)(39 downto 7) when x_sig(7)(39)='0' else
							"1111111" & x_sig(7)(39 downto 7);
	x_shftd(8)		<= "00000000" & x_sig(8)(39 downto 8) when x_sig(8)(39)='0' else
							"11111111" & x_sig(8)(39 downto 8);	
	x_shftd(9)		<= "000000000" & x_sig(9)(39 downto 9) when x_sig(9)(39)='0' else
							"111111111" & x_sig(9)(39 downto 9);
	x_shftd(10)		<= "0000000000" & x_sig(10)(39 downto 10) when x_sig(10)(39)='0' else
							"1111111111" & x_sig(10)(39 downto 10);
	x_shftd(11)		<= "00000000000" & x_sig(11)(39 downto 11) when x_sig(11)(39)='0' else
							"11111111111" & x_sig(11)(39 downto 11);
	x_shftd(12)		<= "000000000000" & x_sig(12)(39 downto 12) when x_sig(12)(39)='0' else
							"111111111111" & x_sig(12)(39 downto 12);	
	x_shftd(13)		<= "0000000000000" & x_sig(13)(39 downto 13) when x_sig(13)(39)='0' else
							"1111111111111" & x_sig(13)(39 downto 13);
	x_shftd(14)		<= "00000000000000" & x_sig(14)(39 downto 14) when x_sig(14)(39)='0' else
							"11111111111111" & x_sig(14)(39 downto 14);
	x_shftd(15)		<= "000000000000000" & x_sig(15)(39 downto 15) when x_sig(15)(39)='0' else
							"111111111111111" & x_sig(15)(39 downto 15);
	-- y shifted siganls
	y_shftd(0)		<= y_sig(0);		--same as x_0
	y_shftd(1)		<= '0' & y_sig(1)(39 downto 1) when y_sig(1)(39)='0' else
							'1' & y_sig(1)(39 downto 1);
	y_shftd(2)		<= "00" & y_sig(2)(39 downto 2) when y_sig(2)(39)='0' else
							"11" & y_sig(2)(39 downto 2);
	y_shftd(3)		<= "000" & y_sig(3)(39 downto 3) when y_sig(3)(39)='0' else
							"111" & y_sig(3)(39 downto 3);
	y_shftd(4)		<= "0000" & y_sig(4)(39 downto 4) when y_sig(4)(39)='0' else
							"1111" & y_sig(4)(39 downto 4);
	y_shftd(5)		<= "00000" & y_sig(5)(39 downto 5) when y_sig(5)(39)='0' else
							"11111" & y_sig(5)(39 downto 5);
	y_shftd(6)		<= "000000" & y_sig(6)(39 downto 6) when y_sig(6)(39)='0' else
							"111111" & y_sig(6)(39 downto 6);
	y_shftd(7)		<= "0000000" & y_sig(7)(39 downto 7) when y_sig(7)(39)='0' else
							"1111111" & y_sig(7)(39 downto 7);
	y_shftd(8)		<= "00000000" & y_sig(8)(39 downto 8) when y_sig(8)(39)='0' else
							"11111111" & y_sig(8)(39 downto 8);	
	y_shftd(9)		<= "000000000" & y_sig(9)(39 downto 9) when y_sig(9)(39)='0' else
							"111111111" & y_sig(9)(39 downto 9);
	y_shftd(10)		<= "0000000000" & y_sig(10)(39 downto 10) when y_sig(10)(39)='0' else
							"1111111111" & y_sig(10)(39 downto 10);
	y_shftd(11)		<= "00000000000" & y_sig(11)(39 downto 11) when y_sig(11)(39)='0' else
							"11111111111" & y_sig(11)(39 downto 11);
	y_shftd(12)		<= "000000000000" & y_sig(12)(39 downto 12) when y_sig(12)(39)='0' else
							"111111111111" & y_sig(12)(39 downto 12);	
	y_shftd(13)		<= "0000000000000" & y_sig(13)(39 downto 13) when y_sig(13)(39)='0' else
							"1111111111111" & y_sig(13)(39 downto 13);
	y_shftd(14)		<= "00000000000000" & y_sig(14)(39 downto 14) when y_sig(14)(39)='0' else
							"11111111111111" & y_sig(14)(39 downto 14);
	y_shftd(15)		<= "000000000000000" & y_sig(15)(39 downto 15) when y_sig(15)(39)='0' else
							"111111111111111" & y_sig(15)(39 downto 15);				
	--result shift logic
	sin_invrtd 		<= not(y_sig(15));
	cos_invrtd 		<= not(x_sig(15));

	sin		 		<=	x"00" & y_sig(15)(39 downto 16) when (quadrant="00" or quadrant="01") else
							x"FF" & sin_add_result(39 downto 16);
	cos				<= x"00" & x_sig(15)(39 downto 16) when (quadrant="00" or quadrant="11") else
							x"FF" & cos_add_result(39 downto 16);						
end Behavioral;
