library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity freq_divider is
    Port ( clk_in  : in  STD_LOGIC;  -- Entrada de 25 MHz
           rst     : in  STD_LOGIC;  -- Reset
           clk_out  : out STD_LOGIC); -- Salida de 20 Hz
end freq_divider;

architecture Behavioral of freq_divider is
    signal div10_counter : integer := 0;
    signal div1250_counter : integer := 0;
    signal clk_div10 : STD_LOGIC := '0';
    signal clk_out_buf : STD_LOGIC := '0'; -- Usamos un buffer para la salida
begin

    -- Divisor de 10
    process(clk_in, rst)
    begin
        if rst = '1' then
            div10_counter <= 0;
            clk_div10 <= '0';
        elsif rising_edge(clk_in) then
            if div10_counter = 4 then  -- 25MHz / 10 = 2.5MHz
                div10_counter <= 0;
                clk_div10 <= not clk_div10;
            else
                div10_counter <= div10_counter + 1;
            end if;
        end if;
    end process;

    -- Divisor de 1250
    process(clk_div10, rst)
    begin
        if rst = '1' then
            div1250_counter <= 0;
            clk_out_buf <= '0'; -- Usamos el buffer
        elsif rising_edge(clk_div10) then
            if div1250_counter = 10000 then  -- 2.5MHz / 1250 = 2kHz
                div1250_counter <= 0;
                clk_out_buf <= not clk_out_buf; -- Alternamos el buffer
            else
                div1250_counter <= div1250_counter + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_out_buf; -- Asignamos el valor del buffer a la salida

end Behavioral;
