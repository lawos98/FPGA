library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Main IS PORT(
	clk:IN STD_LOGIC;
	num1,num2:IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	opt1,opt2: IN STD_LOGIC;
	LedOut1:OUT STD_LOGIC_VECTOR (6 DOWNTO 0):="1111111";
	LedOut2:OUT STD_LOGIC_VECTOR (6 DOWNTO 0):="1111111");
END Main;
ARCHITECTURE Logic OF Main IS	
	COMPONENT Calculator IS PORT(
			number1,number2:IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			operatorButton1,operatorButton2: IN STD_LOGIC;
			LedOutput1,LedOutput2:OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
            END COMPONENT;
	SIGNAL LedTemp1:STD_LOGIC_VECTOR (6 DOWNTO 0):="1111111";
	SIGNAL LedTemp2:STD_LOGIC_VECTOR (6 DOWNTO 0):="1111111";
	SIGNAL numTemp1:STD_LOGIC_VECTOR (3 DOWNTO 0):=num1;
	SIGNAL numTemp2:STD_LOGIC_VECTOR (3 DOWNTO 0):=num2;
	SIGNAL optTemp1:STD_LOGIC:=opt1;
	SIGNAL optTemp2:STD_LOGIC:=opt2;
	BEGIN
	calc: Calculator PORT MAP(
		number1=>num1,
		number2=>num2,
		operatorButton1=>opt1,
		operatorButton2=>opt2,
		LedOutput1=>LedTemp1,
		LedOutput2=>LedTemp2);
	PROCESS(num1,num2,opt1,opt2,numTemp1,numTemp2,optTemp1,optTemp2,clk)  IS
		CONSTANT clockDivisor: INTEGER := 5;
                        VARIABLE counter: INTEGER RANGE 0 TO clockDivisor := 0;
		BEGIN
		IF (rising_edge(clk)) THEN
			IF (counter = clockDivisor) THEN
				LedOut1<=LedTemp1;
				LedOut2<=LedTemp2;
			END IF;
			IF (counter <= clockDivisor) THEN
				counter := counter+1;
			END IF;
		END IF;
		IF(numTemp1/=num1 or numTemp2/=num2 or optTemp1/=opt1 or optTemp2/=opt2) THEN
				LedOut1<="1111111";
				LedOut2<="1111111";
				counter := 0;
				numTemp1<=num1;
				numTemp2<=num2;
				optTemp1<=opt1;
				optTemp1<=opt1;
		END IF;
	END PROCESS;
END Logic;