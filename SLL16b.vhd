----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:47:56 12/11/2013 
-- Design Name: 
-- Module Name:    SLL16b - Behavioral 
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

entity SLL16b is
	 Generic (n : integer :=16);
    Port ( input1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  cout_sll : out STD_LOGIC := '0';
           out_sll : out  STD_LOGIC_VECTOR (n-1 downto 0));
end SLL16b;

architecture Behavioral of SLL16b is

begin
	
	Result_proc1: process
	begin
		for i in 0 to 2 loop
			out_sll(i) <= '0';
			end loop;
		wait for 0.1 ns;
		
		
		for i in 15 downto 3 loop
			out_sll(i) <= input1(i-3);
			end loop;
		wait for 0.1 ns;
		
end process Result_proc1;

end Behavioral;

