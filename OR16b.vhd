----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:35:25 12/11/2013 
-- Design Name: 
-- Module Name:    OR16b - Behavioral 
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

entity OR16b is
	 Generic (n : integer :=16);
    Port ( input1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           input2 : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  cout_or : out STD_LOGIC := '0';
           out_or : out  STD_LOGIC_VECTOR (n-1 downto 0));
end OR16b;

architecture Behavioral of OR16b is

begin

	OR_proc: process
		begin
		for i in n-1 downto 0 loop
			out_or(i) <= input1(i) OR input2(i);
		end loop;
		wait for 0.1 ns;
		end process OR_proc;
end Behavioral;

