library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CARACTERES_ESPECIALES_REVC is

PORT( C1,C2,C3,C4,C5,C6,C7,C8 : OUT STD_LOGIC_VECTOR(39 DOWNTO 0);
		CLK : IN STD_LOGIC
		);
--


end CARACTERES_ESPECIALES_REVC;

architecture Behavioral of CARACTERES_ESPECIALES_REVC is

SIGNAL CHAR_1 : STD_LOGIC_VECTOR(39 DOWNTO 0) := X"0000000000";
SIGNAL CHAR_2 : STD_LOGIC_VECTOR(39 DOWNTO 0) := X"0000000000";
SIGNAL CHAR_3 : STD_LOGIC_VECTOR(39 DOWNTO 0) := X"0000000000";
SIGNAL CHAR_4 : STD_LOGIC_VECTOR(39 DOWNTO 0) := X"0000000000";
SIGNAL CHAR_5 : STD_LOGIC_VECTOR(39 DOWNTO 0) := X"0000000000";
SIGNAL CHAR_6 : STD_LOGIC_VECTOR(39 DOWNTO 0) := X"0000000000";
SIGNAL CHAR_7 : STD_LOGIC_VECTOR(39 DOWNTO 0) := X"0000000000";
SIGNAL CHAR_8 : STD_LOGIC_VECTOR(39 DOWNTO 0) := X"0000000000";
 
begin

------------------------------------------------------------------
---------------CARACTERES A DIBUJAR-------------------------------

CHAR_1 <= --SUMA

 "00000"&
 "00100"&	
 "00100"&
 "01110"&
 "00100"&
 "00100"&
 "00000"&
 "00000";
 
 CHAR_2 <= --RESTA
 
 "00000"&
 "00000"&	
 "00000"&
 "11111"&
 "00000"&
 "00000"&
 "00000"&
 "00000";
 
 CHAR_3 <= --MULTI
 
 "00000"&
 "10101"&	
 "01110"&
 "11111"&
 "01110"&
 "10101"&
 "00000"&
 "00000";
 
 CHAR_4 <= --DIV
 
 "00000"&
 "00001"&	
 "00011"&
 "00110"&
 "01100"&
 "11000"&
 "10000"&
 "00000";
 
 CHAR_5 <= -- =
 
 "00000"&
 "00000"&	
 "11111"&
 "00000"&
 "00000"&
 "11111"&
 "00000"&
 "00000";
 
 CHAR_6 <=
 
 "00000"&
 "00000"&	
 "00000"&
 "00000"&
 "00000"&
 "00000"&
 "00000"&
 "00000";
 
 CHAR_7 <=
 
 "00000"&
 "00000"&	
 "00000"&
 "00000"&
 "00000"&
 "00000"&
 "00000"&
 "00000";
 
 CHAR_8 <=
 
 "00000"&
 "00000"&	
 "00000"&
 "00000"&
 "00000"&
 "00000"&
 "00000"&
 "00000";
 
------------------------------------------------------------------
------------------------------------------------------------------

C1 <= CHAR_1;
C2 <= CHAR_2;
C3 <= CHAR_3;
C4 <= CHAR_4;
C5 <= CHAR_5;
C6 <= CHAR_6;
C7 <= CHAR_7;
C8 <= CHAR_8;

end Behavioral;