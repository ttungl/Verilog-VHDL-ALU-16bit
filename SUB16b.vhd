----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:32:31 12/11/2013 
-- Design Name: 
-- Module Name:    SUB16b - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SUB16b is
	 Generic (n: integer :=16);
    Port ( input1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           input2 : in  STD_LOGIC_VECTOR (n-1 downto 0);
			  cin: in STD_LOGIC;
			  cout_sub : inout STD_LOGIC;
			  overflow_sub : out STD_LOGIC; 
           out_sub : out  STD_LOGIC_VECTOR (n-1 downto 0));
end SUB16b;

architecture Behavioral of SUB16b is

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
	signal t: STD_LOGIC_VECTOR (1 to n-1); -- carries
	signal invertInput2 : STD_LOGIC_VECTOR (0 to n-1);
--	signal cin_0: STD_LOGIC := X"0001";
	signal cin_0: STD_LOGIC_VECTOR(0 to n-1) := X"0001";
	signal c_cout: STD_LOGIC;
	
begin
	
--	t(0) <= cin;
	--invert input2
--   inverseInput2 <= not(input2); 
--	

		inv_Subtraction: for i in 0 to n-1 generate
			invertInput2(i) <= input2(i) XOR cin_0(i); 
		end generate inv_Subtraction; 
		

	-- Adder 16bit
	U1: FullAdder
		port map (cin, input1(0), invertInput2(0), out_sub(0), t(1));
		
	U_Generator: For i in 1 to n-2 generate
		U_i: FullAdder
			port map (t(i), input1(i), invertInput2(i), out_sub(i), t(i+1));
	end generate;

	U_n: FullAdder
		port map (t(n-1), input1(n-1), invertInput2(n-1), out_sub(n-1), cout_sub);	
	
	-- Overflow checker
	c_cout <= cout_sub;
	overflow_sub <= t(n-1) xor c_cout;


end Behavioral;

