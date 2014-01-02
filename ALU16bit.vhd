----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Tung Thanh Le, Ph.D. student @ CACS, UL Lafayette
-- Create Date:    17:32:15 12/10/2013 
-- Design Name: 
-- Module Name:    ALU16bit - Behavioral 
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

entity ALU16bit is
    Port ( input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           input2 : in  STD_LOGIC_VECTOR (15 downto 0);
           cin : in  STD_LOGIC;
			  ALUcontrol: in STD_LOGIC_VECTOR (2 downto 0);			  
			  Overflow : out  STD_LOGIC;
           carryout : inout  STD_LOGIC;
           zero : out  STD_LOGIC;			  
           ALUresult : inout  STD_LOGIC_VECTOR (15 downto 0)
			  );
end ALU16bit;

architecture Behavioral of ALU16bit is
	-- components definition
	component ADD16b
		port(
			  input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           input2 : in  STD_LOGIC_VECTOR (15 downto 0);
			  cin: in STD_LOGIC;
			  cout_add : inout STD_LOGIC; --
			  overflow_add : out STD_LOGIC; 
           out_add : out  STD_LOGIC_VECTOR (15 downto 0)

		);
	end component;

	component SUB16b
		port(
				input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           input2 : in  STD_LOGIC_VECTOR (15 downto 0);
			  cin: in STD_LOGIC;
			  cout_sub : inout STD_LOGIC; 
			  overflow_sub : out STD_LOGIC;            
           out_sub : out  STD_LOGIC_VECTOR (15 downto 0)
		);
	end component;
	
	component AND16b
		port(
				input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           input2 : in  STD_LOGIC_VECTOR (15 downto 0);
			  cout_and : out STD_LOGIC;
           out_and : out  STD_LOGIC_VECTOR (15 downto 0)
		);
	end component;
	
	component OR16b
		port(
				input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           input2 : in  STD_LOGIC_VECTOR (15 downto 0);
			  cout_or : out STD_LOGIC;
           out_or : out  STD_LOGIC_VECTOR (15 downto 0)
		);
	end component;
	
	component NOR16b
		port(
				input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           input2 : in  STD_LOGIC_VECTOR (15 downto 0);
			  cout_nor : out STD_LOGIC;
           out_nor : out  STD_LOGIC_VECTOR (15 downto 0)
		);
	end component;
	
	component SLL16b
		port(
				input1 : in  STD_LOGIC_VECTOR (15 downto 0);
				cout_sll : out STD_LOGIC;
           out_sll : out  STD_LOGIC_VECTOR (15 downto 0)
		);
	end component;
	
	component SRL16b
		port(
				input1 : in  STD_LOGIC_VECTOR (15 downto 0);
				cout_srl : out STD_LOGIC;
           out_srl : out  STD_LOGIC_VECTOR (15 downto 0)
		);
	end component;
	
	component SLT16b
		port(
				input1 : in  STD_LOGIC_VECTOR (15 downto 0);
           input2 : in  STD_LOGIC_VECTOR (15 downto 0);
			  cout_slt : out STD_LOGIC;
           out_slt : out  STD_LOGIC_VECTOR (15 downto 0)
		);
	end component;
	
	
	-- signals definition
	signal r_add : STD_LOGIC_VECTOR (15 downto 0);
	signal r_sub : STD_LOGIC_VECTOR (15 downto 0);
	signal r_and : STD_LOGIC_VECTOR (15 downto 0);
	signal r_or : STD_LOGIC_VECTOR (15 downto 0);
	signal r_nor : STD_LOGIC_VECTOR (15 downto 0);
	signal r_slt : STD_LOGIC_VECTOR (15 downto 0);
	signal r_sll : STD_LOGIC_VECTOR (15 downto 0);
	signal r_srl : STD_LOGIC_VECTOR (15 downto 0);
	signal r_cout : STD_LOGIC;
	signal r_cout1 : STD_LOGIC;
	signal r_overflow : STD_LOGIC;
	signal r_overflow1 : STD_LOGIC;
	-- 
	signal r_cout_and, r_cout_or, r_cout_nor, r_cout_sll, r_cout_srl, r_cout_slt : STD_LOGIC;
	
	
begin

	P1: ADD16b
		port map (input1, input2, cin, r_cout, r_overflow, r_add);
		
	P2: SUB16b
		port map (input1, input2, cin, r_cout1, r_overflow1, r_sub);
	
	P3: AND16b
		port map (input1, input2, r_cout_and, r_and);
		
	P4: OR16b
		port map (input1, input2, r_cout_or, r_or);
--
	P5: NOR16b
		port map (input1, input2, r_cout_nor, r_nor);
--
	P6: SLL16b
		port map (input1, r_cout_sll, r_sll);
--
	P7: SRL16b
		port map (input1, r_cout_srl, r_srl);
--
	P8: SLT16b
		port map (input1, input2, r_cout_slt, r_slt);


	-- ALU control
	aluctrl: process(r_add, r_sub, r_and, r_or, r_nor, r_slt, r_sll, r_srl, r_overflow, r_cout, r_overflow1, r_cout1, r_cout_and, r_cout_or, r_cout_nor, r_cout_sll, r_cout_srl, r_cout_slt)
	begin  
		case ALUcontrol is
		  
			when "000" =>				
				ALUresult <= r_add;
				Overflow <= r_overflow;
				carryout <= r_cout;
				
			when "001" =>
				ALUresult <= r_sub;
				Overflow <= r_overflow1;
				carryout <= r_cout1;
--				
			when "010" =>
				ALUresult <= r_and;
				carryout <= r_cout_and;
				
			when "011" =>
				ALUresult <= r_or;
				carryout <= r_cout_or;
--				
			when "100" =>
				ALUresult <= r_nor;
				carryout <= r_cout_nor;
--				
			when "101" =>
				ALUresult <= r_slt;
				carryout <= r_cout_slt;
--				
			when "110" =>	
				ALUresult <= r_sll;
				carryout <= r_cout_sll;
				
			when "111" =>
				ALUresult <= r_srl;
				carryout <= r_cout_srl;
				
			when others => -- do nothing
			
		end case;
	
	end process aluctrl;
	
	-- zero checker
	zero_checker: process
	begin
	  if (ALUresult = "0000000000000000") then zero <= '1';
		 else zero <= '0';
	  end if;
	  wait for 2 ns;
	end process;  	
   
end Behavioral;

