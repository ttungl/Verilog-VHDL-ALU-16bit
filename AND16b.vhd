----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:35:58 12/11/2013 
-- Design Name: 
-- Module Name:    AND16b - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AND16b is
	 Generic (n : integer :=16); 
    Port ( input1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           input2 : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  cout_and: out STD_LOGIC := '0';
           out_and : out  STD_LOGIC_VECTOR (n-1 downto 0)); 
end AND16b;

architecture Behavioral of AND16b is

begin
   
	AND_proc: process
		begin
				
		for i in n-1 downto 0 loop
			out_and(i) <= input1(i) AND input2(i);
		end loop;
		wait for 0.1 ns;
end process AND_proc;
end Behavioral;

