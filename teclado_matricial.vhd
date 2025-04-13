library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Cambiar a esta librería

entity teclado_matricial is
    Port (
        clk         : in  STD_LOGIC;
        reset       : in  STD_LOGIC;  -- Pulso para reiniciar
        digito      : in  STD_LOGIC_VECTOR(3 downto 0); -- Entrada de 4 bits
        pulso      : out  STD_LOGIC;  -- Pulso para almacenar el valor
        salida      : out STD_LOGIC_VECTOR(16 downto 0)  -- Acumulador de 17 bits
    );
end teclado_matricial;

architecture Behavioral of teclado_matricial is
    signal acumulador : INTEGER := 0;
    signal signo      : INTEGER := 1;  -- 1 para positivo, -1 para negativo
    signal contador   : INTEGER := 0;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            acumulador <= 0;
            contador <= 0;
            salida <= (others => '0');
        elsif rising_edge(clk) then
				--if digito = "1111" then  -- Detección de reinicio
                --contador <= 6;
            --end if;
            if contador < 7 then
					pulso <= '0';
                case contador is
                    when 0 =>
								salida <= (others => '0');
                        acumulador <= to_integer(unsigned(digito)) ;
                    when 1 =>
                        acumulador <= acumulador + (to_integer(unsigned(digito)) * 10 );
                    when 2 =>
                        acumulador <= acumulador + (to_integer(unsigned(digito)) * 100 );
                    when 3 =>
                        acumulador <= acumulador + (to_integer(unsigned(digito)) * 1000 );
                    when 4 =>
                        acumulador <= acumulador + (to_integer(unsigned(digito)) * 10000 );
                    when 5 =>
								if digito(0) = '1' then 
                            signo <= 0;  -- Número negativo
									 acumulador <= acumulador * (-1);
                        else
                            signo <= 1;  -- Número positivo
									 acumulador <= acumulador;
                        end if;
							when 6 => 
								pulso <= '1';
								contador <= -1;
							when 7 =>
								pulso <= '0';
								contador <= -1;
                    when others =>
                        contador <= -1; -- No hacer nada en otros casos
                end case;
                contador <= contador + 1;
				else 
					contador <= 0;
            end if;
            salida <= std_logic_vector(to_unsigned(acumulador, 17));
        end if;
    end process;
end Behavioral;
