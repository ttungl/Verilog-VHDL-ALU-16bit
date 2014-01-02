----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Tung Thanh Le, Ph.D. student @ CACS, UL Lafayette
-- Create Date:    10:31:53 12/11/2013 
-- Design Name: 
-- Module Name:    ADD16b - Behavioral 
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
--use IEEE.STD_LOGIC_SIGNED.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- use Adder16bit
entity ADD16b is
	 Generic (n : integer :=16); 
    Port ( input1 : in  STD_LOGIC_VECTOR(n-1 downto 0); -- 
           input2 : in  STD_LOGIC_VECTOR(n-1 downto 0);
			  cin: in STD_LOGIC;
			  cout_add : inout STD_LOGIC;
			  overflow_add : out STD_LOGIC; 
           out_add : out  STD_LOGIC_VECTOR (n-1 downto 0)); -- sum
end ADD16b;

architecture Behavioral of ADD16b is
	-- component definition
	COMPONENT FullAdder 
    PORT(
      input1, input2: in STD_LOGIC; -- 
		cin : in STD_LOGIC;
      sum: out STD_LOGIC;
		cout: out STD_LOGIC -- 
		);
	END COMPONENT;

	-- signals definition
	signal t: STD_LOGIC_VECTOR (1 to n-1);
--	signal overflow: STD_LOGIC;
	signal c_cout: STD_LOGIC;
	--signal cin_0: STD_LOGIC := '0';

begin
	-- Adder 16bit
	U1: FullAdder
		port map (cin, input1(0), input2(0), out_add(0), t(1));
		
	U_Generator: For i in 1 to n-2 generate
		U_i: FullAdder
			port map (t(i), input1(i), input2(i), out_add(i), t(i+1));
	end generate;

	U_n: FullAdder
		port map (t(n-1), input1(n-1), input2(n-1), out_add(n-1), cout_add);	
	
	-- Overflow checker
	c_cout <= cout_add;
	overflow_add <= t(n-1) xor c_cout;
--	overflow <= overflow_out;


end Behavioral;

