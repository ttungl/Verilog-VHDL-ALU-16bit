----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Tung Thanh Le, Ph.D. student @ CACS, UL Lafayette
-- Create Date:    10:36:35 12/11/2013 
-- Design Name: 
-- Module Name:    NOR16b - Behavioral 
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
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NOR16b is
	 Generic (n : integer :=16);
    Port ( input1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           input2 : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  cout_nor : out STD_LOGIC := '0';
           out_nor : out  STD_LOGIC_VECTOR (n-1 downto 0));
end NOR16b;

architecture Behavioral of NOR16b is

begin
	NOR_proc: process
	--	out_nor (n-1 downto 0) <= input1(n-1 downto 0) NOR input2(n-1 downto 0);
	begin
		
		for i in n-1 downto 0 loop
			out_nor(i) <= input1(i) NOR input2(i);
		end loop;
		
		wait for 0.1 ns;
		end process NOR_proc;
end Behavioral;

