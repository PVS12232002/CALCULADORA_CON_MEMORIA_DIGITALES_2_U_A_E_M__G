library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memoria_FlipFlop is
    Port (
        btn : in STD_LOGIC;  -- Botón de enter
        din0 : in STD_LOGIC; -- Entrada 0
        din1 : in STD_LOGIC; -- Entrada 1
        din2 : in STD_LOGIC; -- Entrada 2
        din3 : in STD_LOGIC; -- Entrada 3
        din4 : in STD_LOGIC; -- Entrada 4
        din5 : in STD_LOGIC; -- Entrada 5
        din6 : in STD_LOGIC; -- Entrada 6
        din7 : in STD_LOGIC; -- Entrada 7
        sout11 : out STD_LOGIC;  -- Salida 1, bit 0
        sout12 : out STD_LOGIC;  -- Salida 1, bit 1
        sout13 : out STD_LOGIC;  -- Salida 1, bit 2
        sout14 : out STD_LOGIC;  -- Salida 1, bit 3
        sout15 : out STD_LOGIC;  -- Salida 1, bit 4
        sout16 : out STD_LOGIC;  -- Salida 1, bit 5
        sout17 : out STD_LOGIC;  -- Salida 1, bit 6
        sout18 : out STD_LOGIC;  -- Salida 1, bit 7
        sout21 : out STD_LOGIC;  -- Salida 2, bit 0
        sout22 : out STD_LOGIC;  -- Salida 2, bit 1
        sout23 : out STD_LOGIC;  -- Salida 2, bit 2
        sout24 : out STD_LOGIC;  -- Salida 2, bit 3
        sout25 : out STD_LOGIC;  -- Salida 2, bit 4
        sout26 : out STD_LOGIC;  -- Salida 2, bit 5
        sout27 : out STD_LOGIC;  -- Salida 2, bit 6
        sout28 : out STD_LOGIC;  -- Salida 2, bit 7
        sout3 : out STD_LOGIC_VECTOR(1 downto 0);  -- Salida 3 como vector de 2 bits
        P1 : out STD_LOGIC;      -- LED 1
        P2 : out STD_LOGIC;      -- LED 2
        P3 : out STD_LOGIC       -- LED 3
    );
end Memoria_FlipFlop;

architecture Behavioral of Memoria_FlipFlop is
    signal memoria : STD_LOGIC_VECTOR (23 downto 0);
    signal contador : INTEGER range 0 to 3 := 0;  -- Inicializar el contador
begin
    process(btn)
    begin
        if btn'event and btn = '0' then  -- Flanco de subida del botón
            P1 <= '0';  -- Apaga LED 1
            P2 <= '0';  -- Apaga LED 2
            P3 <= '0';  -- Apaga LED 3
            

            case contador is
                when 0 =>
                    memoria(15 downto 8) <= din0 & din1 & din2 & din3 & din4 & din5 & din6 & din7;  -- Guardar 4 bits en la primera salida
                    contador <= 1;
                    P1 <= '1';  -- Prende LED 1
                when 1 =>
                    memoria(7 downto 0) <= din0 & din1 & din2 & din3 & din4 & din5 & din6 & din7;  -- Guardar 4 bits en la segunda salida
                    contador <= 2;
                    P1 <= '1';  -- Prende LED 1
                    P2 <= '1';  -- Prende LED 2
                when 2 =>
                    memoria(23 downto 22) <= din0 & din1;  -- Guardar bits adicionales en la tercera salida
                    contador <= 3;
                    P1 <= '1';  -- Prende LED 1
                    P2 <= '1';  -- Prende LED 2
                    P3 <= '1';  -- Prende LED 3
                when 3 =>
                    contador <= 0;  -- Reset contador
                    memoria(23 downto 0) <= (others => '0');  -- Reset memoria
                when others =>
                    null;
            end case;
        end if;
    end process;

    -- Asignación de salidas individuales
    sout11 <= memoria(15);
    sout12 <= memoria(14);
    sout13 <= memoria(13);
    sout14 <= memoria(12);
    sout15 <= memoria(11);
    sout16 <= memoria(10);
    sout17 <= memoria(9);
    sout18 <= memoria(8);

    sout21 <= memoria(7);
    sout22 <= memoria(6);
    sout23 <= memoria(5);
    sout24 <= memoria(4);
    sout25 <= memoria(3);
    sout26 <= memoria(2);
    sout27 <= memoria(1);
    sout28 <= memoria(0);

    -- Asignación de la salida como vector
    sout3 <= memoria(23 downto 22);  -- Salida 3 como un vector de 2 bits
end Behavioral;
