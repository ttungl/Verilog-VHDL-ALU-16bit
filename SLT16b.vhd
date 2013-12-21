----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:39:01 12/11/2013 
-- Design Name: 
-- Module Name:    SLT16b - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SLT16b is
	 Generic (n: integer :=16);
    Port( input1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           input2 : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  cout_slt : out STD_LOGIC := '0';	
           out_slt : out  STD_LOGIC_VECTOR (n-1 downto 0));
end SLT16b;

architecture Behavioral of SLT16b is


begin
	SetLessThan: process
		begin 
    
			if (input1 < input2) then  
				out_slt <= "0000000000000001";
			else
				out_slt <= "0000000000000000"; 
			end if; 
		   wait for 0.1 ns;
			
	end process SetLessThan;
end Behavioral;

