library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vector_a_bits is
    Port (
        entrada : in  STD_LOGIC_VECTOR(16 downto 0); -- Entrada de 17 bits
        bit0    : out STD_LOGIC; -- Salida del bit 0
        bit1    : out STD_LOGIC; -- Salida del bit 1
        bit2    : out STD_LOGIC; -- Salida del bit 2
        bit3    : out STD_LOGIC; -- Salida del bit 3
        bit4    : out STD_LOGIC; -- Salida del bit 4
        bit5    : out STD_LOGIC; -- Salida del bit 5
        bit6    : out STD_LOGIC; -- Salida del bit 6
        bit7    : out STD_LOGIC; -- Salida del bit 7
        bit8    : out STD_LOGIC; -- Salida del bit 8
        bit9    : out STD_LOGIC; -- Salida del bit 9
        bit10   : out STD_LOGIC; -- Salida del bit 10
        bit11   : out STD_LOGIC; -- Salida del bit 11
        bit12   : out STD_LOGIC; -- Salida del bit 12
        bit13   : out STD_LOGIC; -- Salida del bit 13
        bit14   : out STD_LOGIC; -- Salida del bit 14
        bit15   : out STD_LOGIC; -- Salida del bit 15
        bit16   : out STD_LOGIC  -- Salida del bit 16
    );
end vector_a_bits;

architecture Behavioral of vector_a_bits is
begin

    process(entrada)
    begin
        -- Asignar cada bit de la entrada a las salidas individuales
        bit0  <= entrada(0);
        bit1  <= entrada(1);
        bit2  <= entrada(2);
        bit3  <= entrada(3);
        bit4  <= entrada(4);
        bit5  <= entrada(5);
        bit6  <= entrada(6);
        bit7  <= entrada(7);
        bit8  <= entrada(8);
        bit9  <= entrada(9);
        bit10 <= entrada(10);
        bit11 <= entrada(11);
        bit12 <= entrada(12);
        bit13 <= entrada(13);
        bit14 <= entrada(14);
        bit15 <= entrada(15);
        bit16 <= entrada(16);
    end process;

end Behavioral;
