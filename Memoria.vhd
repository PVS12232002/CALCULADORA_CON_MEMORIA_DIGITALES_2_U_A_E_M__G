library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memoria is
    Port (
        btn : in STD_LOGIC;  -- Botón de enter
        ENTRADA0 : in STD_LOGIC; -- Entrada 0
        ENTRADA1 : in STD_LOGIC; -- Entrada 1
        ENTRADA2 : in STD_LOGIC; -- Entrada 2
        ENTRADA3 : in STD_LOGIC; -- Entrada 3
        ENTRADA4 : in STD_LOGIC; -- Entrada 4
        ENTRADA5 : in STD_LOGIC; -- Entrada 5
        ENTRADA6 : in STD_LOGIC; -- Entrada 6
        ENTRADA7 : in STD_LOGIC; -- Entrada 7
        ENTRADA8 : in STD_LOGIC; -- Entrada 8
        ENTRADA9 : in STD_LOGIC; -- Entrada 9
        ENTRADA10 : in STD_LOGIC; -- Entrada 10
        ENTRADA11 : in STD_LOGIC; -- Entrada 11
        ENTRADA12 : in STD_LOGIC; -- Entrada 12
        ENTRADA13 : in STD_LOGIC; -- Entrada 13
        ENTRADA14 : in STD_LOGIC; -- Entrada 14
        ENTRADA15 : in STD_LOGIC; -- Entrada 15
        ENTRADA16 : in STD_LOGIC; -- Entrada 16
        A0 : out STD_LOGIC;  -- Salida A, bit 0
        A1 : out STD_LOGIC;  -- Salida A, bit 1
        A2 : out STD_LOGIC;  -- Salida A, bit 2
        A3 : out STD_LOGIC;  -- Salida A, bit 3
        A4 : out STD_LOGIC;  -- Salida A, bit 4
        A5 : out STD_LOGIC;  -- Salida A, bit 5
        A6 : out STD_LOGIC;  -- Salida A, bit 6
        A7 : out STD_LOGIC;  -- Salida A, bit 7
        A8 : out STD_LOGIC;  -- Salida A, bit 8
        A9 : out STD_LOGIC;  -- Salida A, bit 9
        A10 : out STD_LOGIC;  -- Salida A, bit 10
        A11 : out STD_LOGIC;  -- Salida A, bit 11
        A12 : out STD_LOGIC;  -- Salida A, bit 12
        A13 : out STD_LOGIC;  -- Salida A, bit 13
        A14 : out STD_LOGIC;  -- Salida A, bit 14
        A15 : out STD_LOGIC;  -- Salida A, bit 15
        A16 : out STD_LOGIC;  -- Salida A, bit 16
        B0 : out STD_LOGIC;  -- Salida B, bit 0
        B1 : out STD_LOGIC;  -- Salida B, bit 1
        B2 : out STD_LOGIC;  -- Salida B, bit 2
        B3 : out STD_LOGIC;  -- Salida B, bit 3
        B4 : out STD_LOGIC;  -- Salida B, bit 4
        B5 : out STD_LOGIC;  -- Salida B, bit 5
        B6 : out STD_LOGIC;  -- Salida B, bit 6
        B7 : out STD_LOGIC;  -- Salida B, bit 7
        B8 : out STD_LOGIC;  -- Salida B, bit 8
        B9 : out STD_LOGIC;  -- Salida B, bit 9
        B10 : out STD_LOGIC;  -- Salida B, bit 10
        B11 : out STD_LOGIC;  -- Salida B, bit 11
        B12 : out STD_LOGIC;  -- Salida B, bit 12
        B13 : out STD_LOGIC;  -- Salida B, bit 13
        B14 : out STD_LOGIC;  -- Salida B, bit 14
        B15 : out STD_LOGIC;  -- Salida B, bit 15
        B16 : out STD_LOGIC;  -- Salida B, bit 16
        OP : out STD_LOGIC_VECTOR(1 DOWNTO 0);  -- Salida OP
        PROCESO1 : out STD_LOGIC;      -- LED 1 PARA SABER EN QUE PASO DE LA MEMORIA ESTA
        PROCESO2 : out STD_LOGIC;      -- LED 2 PARA SABER EN QUE PASO DE LA MEMORIA ESTA
        PROCESO3 : out STD_LOGIC       -- LED 3 PARA SABER EN QUE PASO DE LA MEMORIA ESTA
    );
end Memoria;

architecture Behavioral of Memoria is
    signal Entrada_Vector : STD_LOGIC_VECTOR (16 downto 0);
    signal memoria : STD_LOGIC_VECTOR (35 downto 0); -- 17 + 17 + 2 bits
    signal contador : INTEGER range 0 to 3 := 0;  -- Inicializar el contador
begin
    process(btn)
    begin
        Entrada_Vector <= ENTRADA16 & ENTRADA15 & ENTRADA14 & ENTRADA13 & 
                         ENTRADA12 & ENTRADA11 & ENTRADA10 & ENTRADA9 & 
                         ENTRADA8 & ENTRADA7 & ENTRADA6 & ENTRADA5 & 
                         ENTRADA4 & ENTRADA3 & ENTRADA2 & ENTRADA1 & 
                         ENTRADA0;  -- Guardar 17 bits en vector

        if btn'event and btn = '0' then  -- Flanco de bajada del botón
            PROCESO1 <= '0';  -- Apaga LED 1
            PROCESO2 <= '0';  -- Apaga LED 2
            PROCESO3 <= '0';  -- Apaga LED 3
            case contador is
                when 0 =>
                    memoria(16 downto 0) <= Entrada_Vector;  -- Guardar primera entrada
                    contador <= 1;
                    PROCESO1 <= '1';  -- Prende LED 1
                when 1 =>
                    memoria(33 downto 17) <= Entrada_Vector;  -- Guardar segunda entrada
                    contador <= 2;
                    PROCESO1 <= '1';  -- Prende LED 1
                    PROCESO2 <= '1';  -- Prende LED 2
                when 2 =>
                    memoria(35 downto 34) <= Entrada_Vector(1 downto 0);  -- Guardar bits adicionales en la tercera salida
                    contador <= 3;
                    PROCESO1 <= '1';  -- Prende LED 1
                    PROCESO2 <= '1';  -- Prende LED 2
                    PROCESO3 <= '1';  -- Prende LED 3
                when 3 =>
                    contador <= 0;  -- Reset contador
                    memoria(35 downto 0) <= (others => '0');  -- Reset memoria
                when others =>
                    null;
            end case;
        end if;
    end process;

    -- Asignación de salidas individuales para A
    A0 <= memoria(0);
    A1 <= memoria(1);
    A2 <= memoria(2);
    A3 <= memoria(3);
    A4 <= memoria(4);
    A5 <= memoria(5);
    A6 <= memoria(6);
    A7 <= memoria(7);
    A8 <= memoria(8);
    A9 <= memoria(9);
    A10 <= memoria(10);
    A11 <= memoria(11);
    A12 <= memoria(12);
    A13 <= memoria(13);
    A14 <= memoria(14);
    A15 <= memoria(15);
    A16 <= memoria(16);

    -- Asignación de salidas individuales para B
    B0 <= memoria(17);
    B1 <= memoria(18);
    B2 <= memoria(19);
    B3 <= memoria(20);
    B4 <= memoria(21);
    B5 <= memoria(22);
    B6 <= memoria(23);
    B7 <= memoria(24);
    B8 <= memoria(25);
    B9 <= memoria(26);
    B10 <= memoria(27);
    B11 <= memoria(28);
    B12 <= memoria(29);
    B13 <= memoria(30);
    B14 <= memoria(31);
    B15 <= memoria(32);
    B16 <= memoria(33);

    -- Asignación de salidas individuales para OP
    OP <= memoria(35 DOWNTO 34);

end Behavioral;
