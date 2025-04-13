library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity EXTENSOR_8A24 is
    Port ( 
        bit7 : in STD_LOGIC;
        bit6 : in STD_LOGIC;
        bit5 : in STD_LOGIC;
        bit4 : in STD_LOGIC;
        bit3 : in STD_LOGIC;
        bit2 : in STD_LOGIC;
        bit1 : in STD_LOGIC;
        bit0 : in STD_LOGIC;
        salida : out STD_LOGIC_VECTOR (23 downto 0)
    );
end EXTENSOR_8A24;

architecture Behavioral of EXTENSOR_8A24 is
begin
    proceso_combinatorio: process(bit7, bit6, bit5, bit4, bit3, bit2, bit1, bit0)
    begin
        salida <= (others => '0');
        salida(7 downto 0) <= bit7 & bit6 & bit5 & bit4 & bit3 & bit2 & bit1 & bit0;
    end process;
end Behavioral;