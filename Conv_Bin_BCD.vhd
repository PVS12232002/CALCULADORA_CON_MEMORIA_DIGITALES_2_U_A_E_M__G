library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Conv_Bin_BCD is
    Port (
        bin_34bits : in STD_LOGIC_VECTOR (33 downto 0);
        selector : in STD_LOGIC_VECTOR (1 downto 0);
        Uni : out STD_LOGIC_VECTOR (3 downto 0);
        Dec : out STD_LOGIC_VECTOR (3 downto 0);
        Cent : out STD_LOGIC_VECTOR (3 downto 0);
        Mil : out STD_LOGIC_VECTOR (3 downto 0);
        Dec_Mil : out STD_LOGIC_VECTOR (3 downto 0);
        Cen_Mil : out STD_LOGIC_VECTOR (3 downto 0);
        Millon : out STD_LOGIC_VECTOR (3 downto 0);
        Dec_Millon : out STD_LOGIC_VECTOR (3 downto 0);
        Cen_Millon : out STD_LOGIC_VECTOR (3 downto 0);
        Milardo : out STD_LOGIC_VECTOR (3 downto 0);
        signo : out STD_LOGIC
    );
end Conv_Bin_BCD;

architecture Behavioral of Conv_Bin_BCD is
    signal bcd : unsigned(39 downto 0);
begin
    Process(bin_34bits, selector)
        variable temp : unsigned(33 downto 0);
        variable bcd_temp : unsigned(39 downto 0);
    begin
        -- Determinar el signo y ajustar el número a positivo si es necesario
        if bin_34bits(33) = '1' then
            signo <= '1';
            temp := unsigned(not bin_34bits) + 1;
        else
            signo <= '0';
            temp := unsigned(bin_34bits);
        end if;

        -- Algoritmo Double Dabble
        bcd_temp := (others => '0');
        for i in 33 downto 0 loop
            if bcd_temp(3 downto 0) > 4 then
                bcd_temp(3 downto 0) := bcd_temp(3 downto 0) + 3;
            end if;
            if bcd_temp(7 downto 4) > 4 then
                bcd_temp(7 downto 4) := bcd_temp(7 downto 4) + 3;
            end if;
            if bcd_temp(11 downto 8) > 4 then
                bcd_temp(11 downto 8) := bcd_temp(11 downto 8) + 3;
            end if;
            if bcd_temp(15 downto 12) > 4 then
                bcd_temp(15 downto 12) := bcd_temp(15 downto 12) + 3;
            end if;
            if bcd_temp(19 downto 16) > 4 then
                bcd_temp(19 downto 16) := bcd_temp(19 downto 16) + 3;
            end if;
            if bcd_temp(23 downto 20) > 4 then
                bcd_temp(23 downto 20) := bcd_temp(23 downto 20) + 3;
            end if;
            if bcd_temp(27 downto 24) > 4 then
                bcd_temp(27 downto 24) := bcd_temp(27 downto 24) + 3;
            end if;
            if bcd_temp(31 downto 28) > 4 then
                bcd_temp(31 downto 28) := bcd_temp(31 downto 28) + 3;
            end if;
            if bcd_temp(39 downto 32) > 4 then
                bcd_temp(39 downto 32) := bcd_temp(39 downto 32) + 3;
            end if;

            -- Desplazamiento
            bcd_temp := bcd_temp(38 downto 0) & temp(33);
            temp := temp(32 downto 0) & '0';
        end loop;

        bcd <= bcd_temp;

        -- Asignación de salidas BCD
        Uni <= std_logic_vector(bcd(3 downto 0));        -- Unidades
        Dec <= std_logic_vector(bcd(7 downto 4));        -- Decenas
        Cent <= std_logic_vector(bcd(11 downto 8));      -- Centenas
        Mil <= std_logic_vector(bcd(15 downto 12));      -- Unidad de millar
        Dec_Mil <= std_logic_vector(bcd(19 downto 16));   -- Decenas de millar
        Cen_Mil <= std_logic_vector(bcd(23 downto 20));   -- Centena de millar
        Millon <= std_logic_vector(bcd(27 downto 24));    -- Unidad de millón
        Dec_Millon <= std_logic_vector(bcd(31 downto 28)); -- Decena de millón
        Cen_Millon <= std_logic_vector(bcd(35 downto 32)); -- Centena de millón
        Milardo <= std_logic_vector(bcd(39 downto 36));    -- Unidad de milardo
    end process;
end Behavioral;
