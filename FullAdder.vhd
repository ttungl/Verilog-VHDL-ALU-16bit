----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:51:53 12/11/2013 
-- Design Name: 
-- Module Name:    FullAdder - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FullAdder is
    Port ( input1 : in  STD_LOGIC;
           input2 : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sum : out  STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is

begin

 sum <=  input1 xor input2 xor cin;
 cout <= (input1 and input2) or (input1 and cin) or (input2 and cin);

end Behavioral;

