library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MULTIPLEXOR_2x24 is
    Port ( 
        entrada0 : in STD_LOGIC_VECTOR (33 downto 0);
        entrada1 : in STD_LOGIC_VECTOR (33 downto 0);
        seleccion : in STD_LOGIC;  -- 0: selecciona entrada0, 1: selecciona entrada1
        salida : out STD_LOGIC_VECTOR (33 downto 0)
    );
end MULTIPLEXOR_2x24;

architecture Behavioral of MULTIPLEXOR_2x24 is
begin
    proceso_combinatorio: process(entrada0, entrada1, seleccion)
    begin
        case seleccion is
            when '0' => 
                salida <= entrada0;
            when '1' => 
                salida <= entrada1;
            when others => 
                salida <= (others => '0');  -- valor por defecto
        end case;
    end process;
end Behavioral;