library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--use IEEE.std_logic_unsigned.all;
--use IEEE.std_logic_arith.all;
USE WORK.COMANDOS_LCD_REVC.ALL;

entity LIB_LCD_INTESC_REVC is


PORT(CLK: IN STD_LOGIC;

-------------------------------------------------------
-------------PUERTOS DE LA LCD (NO BORRAR)-------------
	  RS : OUT STD_LOGIC;									  --
	  RW : OUT STD_LOGIC;									  --
	  ENA : OUT STD_LOGIC;									  --
	  CORD : IN STD_LOGIC;									  --
	  CORI : IN STD_LOGIC;									  --
	  DATA_LCD: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);     --
	  BLCD :  OUT STD_LOGIC_VECTOR(7 DOWNTO 0);        --
-------------------------------------------------------
	  
-----------------------------------------------------------
--------------ABAJO ESCRIBE TUS PUERTOS--------------------	
        
		  Uni : in STD_LOGIC_VECTOR (3 downto 0);
        Dec : in STD_LOGIC_VECTOR (3 downto 0);
        Cent : in STD_LOGIC_VECTOR (3 downto 0);
        Mil : in STD_LOGIC_VECTOR (3 downto 0);
        Dec_Mil : in STD_LOGIC_VECTOR (3 downto 0);
        Cen_Mil : in STD_LOGIC_VECTOR (3 downto 0);
        Millon : in STD_LOGIC_VECTOR (3 downto 0);
        Dec_Millon : in STD_LOGIC_VECTOR (3 downto 0);
        Cen_Millon : in STD_LOGIC_VECTOR (3 downto 0);
        Milardo : in STD_LOGIC_VECTOR (3 downto 0);
        signo : in STD_LOGIC;
		  OP : IN STD_LOGIC_VECTOR (1 DOWNTO 0)
	  );



end LIB_LCD_INTESC_REVC;

architecture Behavioral of LIB_LCD_INTESC_REVC is

-----------------------------------------------------------------
---------------SE�ALES DE LA LCD (NO BORRAR)---------------------
TYPE RAM IS ARRAY (0 TO  60) OF STD_LOGIC_VECTOR(8 DOWNTO 0);  --
																					--
SIGNAL INST : RAM;													--
																					--
COMPONENT PROCESADOR_LCD_REVC is											--
																					--
PORT(CLK : IN STD_LOGIC;													--
	  VECTOR_MEM : IN STD_LOGIC_VECTOR(8 DOWNTO 0);					--
	  INC_DIR : OUT INTEGER RANGE 0 TO 1024;							--
	  CORD : IN STD_LOGIC;													--
	  CORI : IN STD_LOGIC;													--
	  RS : OUT STD_LOGIC;													--
	  RW : OUT STD_LOGIC;													--
	  DELAY_COR : IN INTEGER RANGE 0 TO 1000;							--
	  BD_LCD : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);			         --
	  ENA  : OUT STD_LOGIC;													--
	  C1A,C2A,C3A,C4A : IN STD_LOGIC_VECTOR(39 DOWNTO 0);       --
	  C5A,C6A,C7A,C8A : IN STD_LOGIC_VECTOR(39 DOWNTO 0);       --
	  DATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)							--
		);																			--
																					--
end  COMPONENT PROCESADOR_LCD_REVC;										--
																					--
COMPONENT CARACTERES_ESPECIALES_REVC is										--
																					--
PORT( C1,C2,C3,C4:OUT STD_LOGIC_VECTOR(39 DOWNTO 0);				--
		C5,C6,C7,C8:OUT STD_LOGIC_VECTOR(39 DOWNTO 0);				--
		CLK : IN STD_LOGIC													--
		);																			--
																					--
end COMPONENT CARACTERES_ESPECIALES_REVC;	

             								--


                  							--

																					--
CONSTANT CHAR1 : INTEGER := 1;											--
CONSTANT CHAR2 : INTEGER := 2;											--
CONSTANT CHAR3 : INTEGER := 3;											--
CONSTANT CHAR4 : INTEGER := 4;											--
CONSTANT CHAR5 : INTEGER := 5;											--
CONSTANT CHAR6 : INTEGER := 6;											--
CONSTANT CHAR7 : INTEGER := 7;											--
CONSTANT CHAR8 : INTEGER := 8;											--
																					--
																					--
SIGNAL DIR : INTEGER RANGE 0 TO 1024 := 0;							--
SIGNAL VECTOR_MEM_S : STD_LOGIC_VECTOR(8 DOWNTO 0);				--
SIGNAL RS_S, RW_S, E_S : STD_LOGIC;										--
SIGNAL DATA_S : STD_LOGIC_VECTOR(7 DOWNTO 0);						--
SIGNAL DIR_S : INTEGER RANGE 0 TO 1024;								--
SIGNAL DELAY_COR : INTEGER RANGE 0 TO 1000;							--
SIGNAL C1S,C2S,C3S,C4S : STD_LOGIC_VECTOR(39 DOWNTO 0);	      --
SIGNAL C5S,C6S,C7S,C8S : STD_LOGIC_VECTOR(39 DOWNTO 0);  	   --
----------------------------------------------------------------
-----------------------------------------------------------------
signal last_value : STD_LOGIC_VECTOR(1 downto 0);
signal detect : std_LOGIC;
signal unidades, decenas, centenas,unidad_millar, decena_millar, centena_millar, unidad_millones, decena_millones, centena_millones, unidad_miyardo : integer range 0 to 9 :=0;
---------------------------------------------------------
--------------AGREGA TUS SE�ALES AQU�--------------------

---------------------------------------------------------

BEGIN


-----------------------------------------------------------
------------COMPONENTES PARA LCD (NO BORRAR)---------------
U1 : PROCESADOR_LCD_REVC PORT MAP(CLK  => CLK,				--
									 VECTOR_MEM => VECTOR_MEM_S,	--
									 RS  => RS_S,						--
									 RW  => RW_S,						--
									 ENA => E_S,						--
									 INC_DIR => DIR_S,				--
									 DELAY_COR => DELAY_COR,		--
									 BD_LCD => BLCD,					--
									 CORD => CORD,						--
									 CORI => CORI,						--
									 C1A =>C1S,  					   --	
									 C2A =>C2S,							--
									 C3A =>C3S,							--
									 C4A =>C4S,							--
									 C5A =>C5S,							--
									 C6A =>C6S,							--
									 C7A =>C7S,							--
									 C8A =>C8S,							--
									 DATA  => DATA_S );				--
																			--
U2 : CARACTERES_ESPECIALES_REVC PORT MAP(C1 =>C1S,			--	
									C2 =>C2S,							--
									C3 =>C3S,							--
									C4 =>C4S,							--
									C5 =>C5S,							--
									C6 =>C6S,							--
									C7 =>C7S,						   --
									C8 =>C8S,							--
							
							CLK => CLK							--
									);										--
																			--
DIR <= DIR_S;															--
VECTOR_MEM_S <= INST(DIR);								--
																			--
RS <= RS_S;																--
RW <= RW_S;																--
ENA <= E_S;																--
DATA_LCD <= DATA_S;

																			--
													                  --
-----------------------------------------------------------


DELAY_COR <= 600; --Modificar esta variable para la velocidad del corrimiento.

-------------------------------------------------------------------
-----------------ABAJO ESCRIBE TU C�DIGO EN VHDL-------------------
process(CLK)
begin
if rising_edge(clk) then
if last_value = "11" and OP /= "11" then
                detect <= '1'; -- Se detectó el cambio de 11 a otro valor
else
                detect <= '0'; -- No se detectó el cambio
end if;
last_value <= OP; -- Actualizar el último valor
END IF;
unidades <= to_integer(unsigned(Uni));
decenas <= to_integer(unsigned(Dec));
centenas <= to_integer(unsigned(Cent));
unidad_millar <= to_integer(unsigned(Mil));
decena_millar <= to_integer(unsigned(Dec_Mil));
centena_millar <= to_integer(unsigned(Cen_Mil));
unidad_millones <= to_integer(unsigned(Millon));
decena_millones <= to_integer(unsigned(Dec_Millon));
centena_millones <= to_integer(unsigned(Cen_Millon));
unidad_miyardo <= to_integer(unsigned(Milardo));

INST(0)  <= LCD_INI("11");
INST(1)  <= LCD_INI("00");
INST(2) <= BUCLE_INI(1);
INST(3) <= POS(1,3);
if signo = '1' then
INST(4)  <= CHAR_ASCII(X"2D");
else
INST(4)  <= CHAR_ASCII(X"2B");
end if;
INST(5) <= INT_NUM(unidad_miyardo);
INST(6) <= INT_NUM(centena_millones);
INST(7) <= INT_NUM(decena_millones);
INST(8) <= INT_NUM(unidad_millones);
INST(9) <= INT_NUM(centena_millar);
INST(10) <= INT_NUM(decena_millar);
if OP = "11" then
INST(11)  <= CHAR_ASCII(X"2E");
INST(12) <= INT_NUM(unidad_millar);
INST(13) <= INT_NUM(centenas);
INST(14) <= INT_NUM(decenas);
INST(15) <= INT_NUM(unidades);
INST(16) <= BUCLE_FIN(1);
INST(17)  <= CHAR_ASCII(X"20");
INST(18) <= CODIGO_FIN(1);
else 
INST(11) <= INT_NUM(unidad_millar);
INST(12) <= INT_NUM(centenas);
INST(13) <= INT_NUM(decenas);
INST(14) <= INT_NUM(unidades);
INST(15)  <= CHAR_ASCII(X"20");
INST(16) <= BUCLE_FIN(1);
INST(17)  <= CHAR_ASCII(X"20");
INST(18) <= CODIGO_FIN(1);
end if;

end process;
-----------------------------------------------------------------------------------------
-------------------------ABAJO ESCRIBE TU C�DIGO PARA LA LCD-----------------------------


-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------


end Behavioral;