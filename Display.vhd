library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Display IS
PORT(
	number:IN INTEGER;
	LedOutput:OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END Display;
ARCHITECTURE Logic OF Display IS
	BEGIN
	PROCESS (number)
		BEGIN
		CASE number IS
			WHEN 0 => LedOutput <= "1000000";
			WHEN 1 => LedOutput <= "1111001";
			WHEN 2 => LedOutput <= "0100100";
			WHEN 3 => LedOutput <= "0110000";
			WHEN 4 => LedOutput <= "0011001";
			WHEN 5 => LedOutput <= "0010010";
			WHEN 6 => LedOutput <= "0000010";
			WHEN 7 => LedOutput <= "1111000";
			WHEN 8 => LedOutput <= "0000000";
			WHEN 9 => LedOutput <= "0010000";
			WHEN OTHERS => LedOutput <= "1111111";
		END CASE;
	END PROCESS;
END Logic;