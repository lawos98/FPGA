library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

ENTITY Calculator IS
PORT(
	number1,number2:IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	operatorButton1,operatorButton2: IN STD_LOGIC;
	LedOutput1,LedOutput2:OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END Calculator;

ARCHITECTURE Logic OF Calculator IS	
	COMPONENT Display IS PORT(
		number:IN INTEGER;
		LedOutput:OUT STD_LOGIC_VECTOR (6 DOWNTO 0) );
    END COMPONENT;
	
	SIGNAL numberOutput:INTEGER;
	SIGNAL digitOutput1:INTEGER;
	SIGNAL digitOutput2:INTEGER;
	SIGNAL numberInput1:INTEGER;
	SIGNAL numberInput2:INTEGER;
	
	BEGIN
	PROCESS(number1,number2,operatorButton1,operatorButton2,numberInput1,numberInput2,numberOutput) IS
	BEGIN
		IF(operatorButton1 = operatorButton2) THEN
			digitOutput1<=10;
			digitOutput2<=10;
		ELSE
			numberInput1<=to_integer(unsigned(number1));
			numberInput2<=to_integer(unsigned(number2));
			IF(operatorButton1='1') THEN
				numberOutput<=numberInput1+numberInput2;
			ELSE
				numberOutput<=numberInput1*numberInput2;
			END IF;
			digitOutput1<=numberOutput MOD 10;
			IF(numberOutput MOD 1000/100 =0) and (numberOutput MOD 100/10 =0) THEN
				digitOutput2<=10;
			ELSE
				digitOutput2<=numberOutput MOD 100/10;
			END IF;
		END IF;
	END PROCESS;
	
	display1: Display PORT MAP(
		number => digitOutput1,
		LedOutput => LedOutput1
		);
		
	display2: Display PORT MAP(
		number=>digitOutput2,
		LedOutput => LedOutput2
		);
		
END Logic;