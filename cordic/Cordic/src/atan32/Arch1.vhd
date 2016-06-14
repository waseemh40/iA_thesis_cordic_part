
Architecture Arch1 of atan32 Is

signal ZData_s : std_logic_vector(31 downto 0);

Begin
	
  ZData <= ZData_s(31 downto 32-WIDTH); 	-- Connect to outside world
  process(ZA)
  begin
    Case ZA is	                           
       when "00000" => ZData_s <= X"3243f6a8";
       when "00001" => ZData_s <= X"1dac6705";
       when "00010" => ZData_s <= X"0fadbafc";
       when "00011" => ZData_s <= X"07f56ea6";
       when "00100" => ZData_s <= X"03feab76";
       when "00101" => ZData_s <= X"01ffd55b";
       when "00110" => ZData_s <= X"00fffaaa";
       when "00111" => ZData_s <= X"007fff55";
       when "01000" => ZData_s <= X"003fffea";
       when "01001" => ZData_s <= X"001ffffd";
       when "01010" => ZData_s <= X"000fffff";
       when "01011" => ZData_s <= X"0007ffff";
       when "01100" => ZData_s <= X"0003ffff";
       when "01101" => ZData_s <= X"0001ffff";
       when "01110" => ZData_s <= X"0000ffff";
       when "01111" => ZData_s <= X"00007fff";
       when "10000" => ZData_s <= X"00003fff";
       when "10001" => ZData_s <= X"00001fff";
       when "10010" => ZData_s <= X"00000fff";
       when "10011" => ZData_s <= X"000007ff";
       when "10100" => ZData_s <= X"000003ff";
       when "10101" => ZData_s <= X"000001ff";
       when "10110" => ZData_s <= X"000000ff";
       when "10111" => ZData_s <= X"0000007f";
       when "11000" => ZData_s <= X"0000003f";
       when "11001" => ZData_s <= X"0000001f";
       when "11010" => ZData_s <= X"0000000f";
       when "11011" => ZData_s <= X"00000007";
       when "11100" => ZData_s <= X"00000003";
       when "11101" => ZData_s <= X"00000001";
       when "11110" => ZData_s <= X"00000000";
       when "11111" => ZData_s <= X"00000000";
       When others  => ZData_s <= "--------------------------------";
    End Case;
  end process;
End Arch1;

