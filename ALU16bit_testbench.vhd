-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.std_logic_ARITH.ALL;
  USE ieee.std_logic_UNSIGNED.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY ALU16bit_testbench IS     
  END ALU16bit_testbench;

  ARCHITECTURE behavior OF ALU16bit_testbench IS 

	-- signal declaration
			  signal t_input1:  STD_LOGIC_VECTOR (15 downto 0);
           signal t_input2 :  STD_LOGIC_VECTOR (15 downto 0);
			  signal t_cin :  STD_LOGIC;
           signal t_ALUcontrol:  STD_LOGIC_VECTOR (2 downto 0);			  
			  signal t_Overflow :  STD_LOGIC;
           signal t_carryout :  STD_LOGIC;
           signal t_zero :  STD_LOGIC;			  
           signal t_ALUresult :  STD_LOGIC_VECTOR (15 downto 0);


  -- Component Declaration
          COMPONENT ALU16bit
          PORT(
				  input1 : in  STD_LOGIC_VECTOR (15 downto 0);
				  input2 : in  STD_LOGIC_VECTOR (15 downto 0);
				  cin : in STD_LOGIC;
				  ALUcontrol: in STD_LOGIC_VECTOR (2 downto 0);			  
				  Overflow : out  STD_LOGIC;
				  carryout : inout  STD_LOGIC;
				  zero : out  STD_LOGIC;			  
				  ALUresult : inout  STD_LOGIC_VECTOR (15 downto 0)
                  );
          END COMPONENT;



  BEGIN

  -- Component Instantiation
          uut: ALU16bit PORT MAP(
						input1 => t_input1,
						input2 => t_input2,
						cin => t_cin,
						ALUcontrol => t_ALUcontrol,
					   Overflow => t_Overflow,
						carryout => t_carryout,
						zero => t_zero,
						ALUresult => t_ALUresult

          );


  --  Test Bench Statements
     tb : PROCESS
     BEGIN
			
		-- ADD16b	
		
		t_input1 <= X"FFFC";
		t_input2 <= X"0010";
		t_cin <= '1';
		t_ALUcontrol <= "000";
		WAIT FOR 10 ns;
			
		t_input1 <= X"FFFC";
		t_input2 <= X"8001";
		t_cin <= '1';
		t_ALUcontrol <= "000";
		WAIT FOR 10 ns;

		t_input1 <= X"FFFC";
		t_input2 <= X"0004";
		t_cin <= '0';
		t_ALUcontrol <= "000";
		WAIT FOR 10 ns;
	
--		-- SUB16b
--		
		t_input1 <= X"FFFC";
		t_input2 <= X"0010";
		t_cin <= '1';
		t_ALUcontrol <= "001";
		WAIT FOR 10 ns;
			
		t_input1 <= X"FFFC";
		t_input2 <= X"8001";
		t_cin <= '0';
		t_ALUcontrol <= "001";
		WAIT FOR 10 ns;

		t_input1 <= X"FFFC";
		t_input2 <= X"0004";
		t_cin <= '1';
		t_ALUcontrol <= "001";
		WAIT FOR 10 ns;
--		
--		
--		-- AND16b
--		
		
		t_input1 <= X"FFFC";
		t_input2 <= X"0010";
		t_ALUcontrol <= "010";
		WAIT FOR 10 ns;
		
		t_input1 <= X"FFFC";
		t_input2 <= X"8001";
		t_ALUcontrol <= "010";
		WAIT FOR 10 ns;
		
		t_input1 <= X"FFFC";
		t_input2 <= X"0004";
		t_ALUcontrol <= "010";
		WAIT FOR 10 ns;
		
--		-- OR16b
--		
		t_input1 <= X"FFFC";
		t_input2 <= X"0010";
		t_ALUcontrol <= "011";
		WAIT FOR 10 ns;
		
		t_input1 <= X"FFFC";
		t_input2 <= X"8001";
		t_ALUcontrol <= "011";
		WAIT FOR 10 ns;
		
		t_input1 <= X"FFFC";
		t_input2 <= X"0004";
		t_ALUcontrol <= "011";
		WAIT FOR 10 ns;
--		
--		
--		-- NOR16b
--		
		t_input1 <= X"FFFC";
		t_input2 <= X"0010";
		t_ALUcontrol <= "100";
		WAIT FOR 10 ns;
		
		t_input1 <= X"FFFC";
		t_input2 <= X"8001";
		t_ALUcontrol <= "100";
		WAIT FOR 10 ns;
		
		t_input1 <= X"FFFC";
		t_input2 <= X"0004";
		t_ALUcontrol <= "100";
		WAIT FOR 10 ns;
--		
--		
--		-- SLT16b
		t_input1 <= X"FFFC";
		t_input2 <= X"0010";
		t_ALUcontrol <= "101";		
		WAIT FOR 10 ns;
		
		t_input1 <= X"FFFC";
		t_input2 <= X"8001";
		t_ALUcontrol <= "101";
		WAIT FOR 10 ns;
		
		t_input1 <= X"FFFC";
		t_input2 <= X"0004";		
		t_ALUcontrol <= "101";		
		WAIT FOR 10 ns;
		
--		
--		
--		
--		
--		-- SLL16b
--		
		t_input1 <= X"0004";
		t_ALUcontrol <= "110";
		WAIT FOR 10 ns;
--		
--	
--		

--		-- SRL16b
	
			t_input1 <= X"0004";	
			t_ALUcontrol <= "111";
			WAIT FOR 10 ns;
		
--
--		
				
		
			
       -- wait for 100 ns; -- wait until global set/reset completes

        -- Add user defined stimulus here

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
