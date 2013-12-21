----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:39:14 12/10/2013 
-- Design Name: 
-- Module Name:    dec17_bcd - COMB 
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

entity dec17_bcd is
    Port ( Cout_in : in  STD_LOGIC;
           Sum_in : in  STD_LOGIC_VECTOR (15 downto 0);
           Unit : out  STD_LOGIC_VECTOR (3 downto 0);
           Ten : out  STD_LOGIC_VECTOR (3 downto 0);
           Hundred : out  STD_LOGIC_VECTOR (3 downto 0);
			  Thousand : out STD_LOGIC_VECTOR (3 downto 0);
			  Tthousand : out STD_LOGIC_VECTOR (3 downto 0);
			  Hthousand : out STD_LOGIC_VECTOR (3 downto 0));
end dec17_bcd;

architecture behavioral of dec17_bcd is

--The largest integer of the output
--from the 16-bit adder is 131071,
--which, in total includes 6 digits at most
signal BIN2DEC : integer range 0 to 131071; 
--signal UNIS : integer range 0 to 9; 
--signal TENS : integer range 0 to 9;
--signal HUNDS : integer range 0 to 9;
--signal THOUS : integer range 0 to 9;
--signal TTHOUS : integer range 0 to 9;
--signal HTHOUS : integer range 0 to 1;

begin

BIN2DEC <= conv_integer(unsigned(Cout_in&Sum_in (15 downto 0)));


conversion: process (BIN2DEC)

variable RES99_VAR : integer range 0 to 99999;
variable VAR_UNIS : integer range 0 to 9; 
variable VAR_TENS : integer range 0 to 9;
variable VAR_HUNDS : integer range 0 to 9;
variable VAR_THOUS : integer range 0 to 9;
variable VAR_TTHOUS : integer range 0 to 9;
variable VAR_HTHOUS : integer range 0 to 1;

begin
	if BIN2DEC > 99999 then VAR_HTHOUS := 1;
	else VAR_HTHOUS := 0;
	end if;
	
	RES99_VAR := BIN2DEC - (VAR_HTHOUS * 100000);
	if RES99_VAR > 89999 then VAR_TTHOUS := 9;
	elsif RES99_VAR > 79999 then VAR_TTHOUS := 8;
	elsif RES99_VAR > 69999 then VAR_TTHOUS := 7;
	elsif RES99_VAR > 59999 then VAR_TTHOUS := 6;
	elsif RES99_VAR > 49999 then VAR_TTHOUS := 5;
	elsif RES99_VAR > 39999 then VAR_TTHOUS := 4;
	elsif RES99_VAR > 29999 then VAR_TTHOUS := 3;
	elsif RES99_VAR > 19999 then VAR_TTHOUS := 2;
	elsif RES99_VAR > 9999 then VAR_TTHOUS := 1;
	else VAR_TTHOUS := 0;
	end if;
	
	RES99_VAR := RES99_VAR - (VAR_TTHOUS * 10000);
	if RES99_VAR > 8999 then VAR_THOUS := 9;
	elsif RES99_VAR > 7999 then VAR_THOUS := 8;
	elsif RES99_VAR > 6999 then VAR_THOUS := 7;
	elsif RES99_VAR > 5999 then VAR_THOUS := 6;
	elsif RES99_VAR > 4999 then VAR_THOUS := 5;
	elsif RES99_VAR > 3999 then VAR_THOUS := 4;
	elsif RES99_VAR > 2999 then VAR_THOUS := 3;
	elsif RES99_VAR > 1999 then VAR_THOUS := 2;
	elsif RES99_VAR > 999 then VAR_THOUS := 1;
	else VAR_THOUS := 0;
	end if;
	
	RES99_VAR := RES99_VAR - (VAR_THOUS * 1000);
	if RES99_VAR > 899 then VAR_HUNDS := 9;
	elsif RES99_VAR > 799 then VAR_HUNDS := 8;
	elsif RES99_VAR > 699 then VAR_HUNDS := 7;
	elsif RES99_VAR > 599 then VAR_HUNDS := 6;
	elsif RES99_VAR > 499 then VAR_HUNDS := 5;
	elsif RES99_VAR > 399 then VAR_HUNDS := 4;
	elsif RES99_VAR > 299 then VAR_HUNDS := 3;
	elsif RES99_VAR > 199 then VAR_HUNDS := 2;
	elsif RES99_VAR > 99 then VAR_HUNDS := 1;
	else VAR_HUNDS := 0;
	end if;
	
	RES99_VAR := RES99_VAR - (VAR_HUNDS * 100);
	if RES99_VAR > 89 then VAR_TENS := 9;
	elsif RES99_VAR > 79 then VAR_TENS := 8;
	elsif RES99_VAR > 69 then VAR_TENS := 7;
	elsif RES99_VAR > 59 then VAR_TENS := 6;
	elsif RES99_VAR > 49 then VAR_TENS := 5;
	elsif RES99_VAR > 39 then VAR_TENS := 4;
	elsif RES99_VAR > 29 then VAR_TENS := 3;
	elsif RES99_VAR > 19 then VAR_TENS := 2;
	elsif RES99_VAR > 9 then VAR_TENS := 1;
	else VAR_TENS := 0;
	end if;
	
	VAR_UNIS := RES99_VAR - (VAR_TENS * 10);
	
	--UNIS <= VAR_UNIS;
	--TENS <= VAR_TENS;
	--HUNDS <= VAR_HUNDS;
	--THOUS <= VAR_THOUS;
	--TTHOUS <= VAR_TTHOUS;
	--HTHOUS <= VAR_HTHOUS;
	
	Unit <= conv_std_logic_vector (VAR_UNIS, 4);
	Ten <= conv_std_logic_vector (VAR_TENS, 4);
	Hundred <= conv_std_logic_vector (VAR_HUNDS, 4);
	Thousand <= conv_std_logic_vector (VAR_THOUS, 4);
	Tthousand <= conv_std_logic_vector (VAR_TTHOUS, 4);
	Hthousand <= conv_std_logic_vector (VAR_HTHOUS, 4); 
	end process conversion;

	
end behavioral;

