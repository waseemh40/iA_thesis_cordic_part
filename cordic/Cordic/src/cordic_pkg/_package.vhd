-- ==============================================================================
-- Cordic Package File
-- 
-- This library is free software; you can redistribute it and/or modify it 
-- under the terms of the GNU Lesser General Public License as published 
-- by the Free Software Foundation; either version 2.1 of the License, or 
-- (at your option) any later version.
-- 
-- This library is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE.   See the GNU Lesser General Public 
-- License for more details.   See http://www.gnu.org/copyleft/lesser.txt
-- 
-- ------------------------------------------------------------------------------
-- Version   Author          Date          Changes
-- 0.1       Hans Tiggeler   10/03/2000      Tested on Modelsim SE 5.5
-- ==============================================================================
        
library IEEE;
use IEEE.std_logic_1164.all;

package cordic_pkg is

  function std_to_natural   (Bits_c : Std_Logic_Vector) return natural;
  function natural_to_strhex(Data_c : natural)          return string;
  function strhex_to_natural(str    : string)           return natural;
  function std_to_string    (inp    : std_logic_vector) return string;
  function std_to_hex       (Vec    : std_logic_vector) return string; -- Std to hex string
      
end cordic_pkg; 

