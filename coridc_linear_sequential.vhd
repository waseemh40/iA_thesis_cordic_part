----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:57 06/02/2016 
-- Design Name: 
-- Module Name:    coridc_linear_sequential - Behavioral 
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

entity coridc_linear_sequential is
    Port ( operand_a : in  STD_LOGIC_VECTOR (31 downto 0);
           operand_b : in  STD_LOGIC_VECTOR (31 downto 0);
           result 	: out  STD_LOGIC_VECTOR (31 downto 0);
           clk 		: in  STD_LOGIC;
           rst 		: in  STD_LOGIC;
           start 		: in  STD_LOGIC;
			  ovf			: out	STD_LOGIC;
           opr_done 	: out  STD_LOGIC);
end coridc_linear_sequential;

architecture Behavioral of coridc_linear_sequential is

	--computational signals
signal x_current,x_last : std_logic_vector(39 downto 0);
signal y_current,y_last : std_logic_vector(39 downto 0);
signal z_current,z_last : std_logic_vector(39 downto 0);
signal x_last_shftd 		: std_logic_vector(39 downto 0);
signal my_one_shftd 		: std_logic_vector(39 downto 0);
signal result_dummy 		: std_logic_vector(39 downto 0);

	--normilzation part
signal x_0,z_0 			: std_logic_vector(39 downto 0);
signal dummy_out_1		: std_logic;
signal dummy_out_2		: std_logic;
signal shamt_oprnd_1		: std_logic;
signal shamt_oprnd_2		: std_logic;
signal rslt_sign			: std_logic;

	--adder part
signal ovf_y				: std_logic;
signal cout_y				: std_logic;
signal y_add_result		: std_logic_vector(39 downto 0);
signal ovf_z				: std_logic;
signal cout_z				: std_logic;
signal z_add_result		: std_logic_vector(39 downto 0);
signal ovf_rslt			: std_logic;
signal cout_rslt			: std_logic;
signal r_addr_result		: std_logic_vector(39 downto 0);

signal loop_var 			: integer range 0 to 31;

	--constants
constant my_one_for_z	: std_logic_vector(39 downto 0):=x"0001000000"; --Q16_24 format
	
	--FSM signals
TYPE state_type IS (IDLE,READ_OPRND,CURR_CALC,LAST_UPDATE,SHIFT_AND_CHECK,DONE);
signal state 				: state_type;

begin
	--normalization portmap
norm_1: entity work.norm_linear_module--normalization_module
	Port map ( 
			  operand 		=>operand_a,
           norm_operand =>x_0,
           type_shift 	=> dummy_out_1);
			  
norm_2: entity work.norm_linear_module--normalization_module
	Port map ( 
			  operand 		=>operand_b,
           norm_operand =>z_0,
           type_shift 	=> dummy_out_2);

	--adders portmap
adder_y: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>y_last,
           operand_b 	=>x_last_shftd,
           mode 			=>z_last(39),			-- 0: addition; 1 subtraction
           over_flow 	=>ovf_y,
			  carry_out 	=>cout_y,
           result 		=>y_add_result);
adder_z: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>z_last,
           operand_b 	=>my_one_shftd,
           mode 			=>not(z_last(39)),			-- 0: sub; 1 add
           over_flow 	=>ovf_z,
			  carry_out 	=>cout_z,
           result 		=>z_add_result);
adder_result: entity work.forty_bit_add_sub
	Port map ( 
			  operand_a 	=>not(result_dummy),
           operand_b 	=>x"0000000001",
           mode 			=>'0', -- verified logic
           over_flow 	=>ovf_rslt,
			  carry_out 	=>cout_rslt,
           result 		=>r_addr_result);				  
			  
--actual FSM
fsm_process: process (clk, operand_a,operand_b)

--	variable loop_var 	: natural range 0 to 31;

	begin
		if rising_edge(clk) then
			if rst = '1' then
				state				<= idle;
				loop_var			<= 0;
				opr_done			<= '0';
				rslt_sign		<= '0';
				ovf				<= '0';
				x_current		<= (others => '0');
				x_last			<= (others => '0');
				x_last_shftd	<= (others => '0');
				y_current		<= (others => '0');
				y_last			<= (others => '0');
				z_current		<= (others => '0');
				z_last			<= (others => '0');
				my_one_shftd	<= (others => '0');
				result			<= (others => '0');
				result_dummy	<= (others => '0');
				
			else
				case state is
					when IDLE =>		--IDLE,READ_OPRND,CURR_CALC,LAST_UPDATE,CHECK,DONE)
					 if start ='1' then
						state 		<=	READ_OPRND;
					 else
						opr_done		<= '0';
						loop_var		<= 0;
						state 		<= IDLE;
					 end if;
 					when READ_OPRND =>		--IDLE,READ_OPRND,CURR_CALC,LAST_UPDATE,CHECK,DONE)
						x_last		 <=x_0;
						z_last  		 <=z_0;
						y_last		 <= (others => '0');
						x_last_shftd <= (others => '0');
						my_one_shftd <= (others => '0');
						result		 <= (others => '0');
						ovf			 <= '0';
						loop_var		 <= 0;
						state 		 <= CURR_CALC;
 					when CURR_CALC  =>		--IDLE,READ_OPRND,CURR_CALC,LAST_UPDATE,CHECK,DONE)
						x_current	<=x_0;	--always fixed in linear
						y_current	<=y_add_result;
						z_current  	<=z_add_result;
						state 		<=LAST_UPDATE;
					when 	LAST_UPDATE =>
						if loop_var = 0 then		--latch in the begining, else x_0 may change since  norm. is comb. part
							x_last	<=x_current;
							shamt_oprnd_1 <=dummy_out_1;
							shamt_oprnd_2 <=dummy_out_2;
							rslt_sign 				<=operand_a(31) xor operand_b(31);
						end if;
						y_last		<=y_current;
						z_last  		<=z_current;
						state 		<=SHIFT_AND_CHECK;
					when SHIFT_AND_CHECK =>
						case loop_var is
							when 0 => 	
								x_last_shftd 		<= x_last;
								my_one_shftd 		<= my_one_for_z;
							when 1 =>
								x_last_shftd	 	<= '0' & x_last(39 downto 1);
								my_one_shftd 		<= '0' & my_one_for_z(39 downto 1);
							when 2 =>
								x_last_shftd 		<= "00" & x_last(39 downto 2);
								my_one_shftd 		<= "00" & my_one_for_z(39 downto 2);
							when 3 => 	
								x_last_shftd 		<= "000" & x_last(39 downto 3);
								my_one_shftd 		<= "000" & my_one_for_z(39 downto 3);
							when 4 => 	
								x_last_shftd 		<= "0000" & x_last(39 downto 4);
								my_one_shftd 		<= "0000" & my_one_for_z(39 downto 4);
							when 5 => 	
								x_last_shftd 		<=	"00000" & x_last(39 downto 5);
								my_one_shftd 		<= "00000" & my_one_for_z(39 downto 5);
							when 6 => 	
								x_last_shftd 		<= "000000" & x_last(39 downto 6);
								my_one_shftd 		<= "000000" & my_one_for_z(39 downto 6);
							when 7 => 	
								x_last_shftd 		<= "0000000" & x_last(39 downto 7);
								my_one_shftd 		<= "0000000" & my_one_for_z(39 downto 7);
							when 8 => 	
								x_last_shftd 		<= "00000000" & x_last(39 downto 8);
								my_one_shftd 		<= "00000000" & my_one_for_z(39 downto 8);
							when 9 => 	
								x_last_shftd 		<= "000000000" & x_last(39 downto 9);
								my_one_shftd 		<= "000000000" & my_one_for_z(39 downto 9);
							when 10 =>	
								x_last_shftd 		<= "0000000000" & x_last(39 downto 10);
								my_one_shftd 		<= "0000000000" & my_one_for_z(39 downto 10);
							when 11 =>	
								x_last_shftd 		<= "00000000000" & x_last(39 downto 11);
								my_one_shftd 		<= "00000000000" & my_one_for_z(39 downto 11);
							when 12 => 	
								x_last_shftd 		<= "000000000000" & x_last(39 downto 12);
								my_one_shftd 		<= "000000000000" & my_one_for_z(39 downto 12);
							when 13 =>  
								x_last_shftd 		<= "0000000000000" & x_last(39 downto 13);
								my_one_shftd 		<= "0000000000000" & my_one_for_z(39 downto 13);
							when 14 => 	
								x_last_shftd 		<= "00000000000000" & x_last(39 downto 14);
								my_one_shftd 		<= "00000000000000" & my_one_for_z(39 downto 14);
							when 15 => 	
								x_last_shftd 		<= "000000000000000" & x_last(39 downto 15);
								my_one_shftd 		<= "000000000000000" & my_one_for_z(39 downto 15);
							when 16 => 	
								x_last_shftd 		<= "0000000000000000" & x_last(39 downto 16);
								my_one_shftd 		<= "0000000000000000" & my_one_for_z(39 downto 16);
							when 17 => 	
								x_last_shftd 		<= "00000000000000000" & x_last(39 downto 17);
								my_one_shftd 		<= "00000000000000000" & my_one_for_z(39 downto 17);
							when 18 => 	
								x_last_shftd 		<= "000000000000000000" & x_last(39 downto 18);
								my_one_shftd 		<= "000000000000000000" & my_one_for_z(39 downto 18);
							when 19 => 	
								x_last_shftd 		<= "0000000000000000000" & x_last(39 downto 19);
								my_one_shftd 		<= "0000000000000000000" & my_one_for_z(39 downto 19);
							when 20 => 	
								x_last_shftd 		<= "00000000000000000000" & x_last(39 downto 20);
								my_one_shftd 		<= "00000000000000000000" & my_one_for_z(39 downto 20);
							when others => null;
						end case;
						loop_var		<= loop_var + 1;
						if loop_var = 15 then
							if shamt_oprnd_1= '0' and shamt_oprnd_2='0' then
								result_dummy 		<= y_last(39 downto 0);
							elsif (shamt_oprnd_1= '1' and shamt_oprnd_2='0') or (shamt_oprnd_1= '0' and shamt_oprnd_2='1') then
								result_dummy 		<= y_last(31 downto 0) & x"00";
							else
								result_dummy 		<= y_last(23 downto 0) & x"0000";
							end if;
							opr_done 				<='1';
							state 					<=DONE;
						else
							state 					<=CURR_CALC;
						end if;						
					when 	DONE 		=>
							if (rslt_sign = '0') then
								result   			<=result_dummy(39 downto 8);
							else
								result   			<=r_addr_result(39 downto 8);
							end if;
							ovf			 			<= result_dummy(39);		--overflow signal
							opr_done 				<='0';
							state 					<=IDLE;
				end case;
			end if;		--rst='1'
		end if; 			--rising_edge(clk)
	end process; 
end Behavioral;

