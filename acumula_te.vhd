library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity acumula_te is
    Port (
        clk      : in  STD_LOGIC;
        reset    : in  STD_LOGIC;
        entrada  : in  STD_LOGIC_VECTOR(3 downto 0); -- 4 bits para números del 0 al 9
        salida   : out STD_LOGIC_VECTOR(16 downto 0); -- 17 bits para el número acumulado + signo
        pulso_ent : out STD_LOGIC -- Pulso de salida
    );
end acumula_te;

architecture Modified of acumula_te is
    signal acumulado : UNSIGNED(31 downto 0) := (others => '0'); -- 32 bits para la acumulación
    signal contador  : INTEGER := 0; -- Contador de entradas
    signal listo     : BOOLEAN := false; -- Indicador de estado de preparación
    signal pulso_reg : STD_LOGIC := '0'; -- Registro temporal para el pulso de salida

begin
    process(clk, reset)
    begin
        if reset = '1' then
            acumulado <= (others => '0');
            contador <= 0;
            pulso_reg <= '0'; -- Reiniciar registro de pulso
            listo <= false;
        elsif rising_edge(clk) then
            case contador is
                when 0 =>
                    acumulado <= RESIZE(UNSIGNED(entrada), 32); -- Solo la entrada (0-9)
                    contador <= contador + 1; -- Incrementar contador
                    pulso_reg <= '0'; -- Reiniciar pulso

                when 1 =>
                    acumulado <= acumulado + (RESIZE(UNSIGNED(entrada)*10, 32) ); -- Acumular entrada * 10
                    contador <= contador + 1; -- Incrementar contador
                    pulso_reg <= '0'; -- Reiniciar pulso

                when 2 =>
                    acumulado <= acumulado + (RESIZE(UNSIGNED(entrada)*100, 32) ); -- Acumular entrada * 100
                    contador <= contador + 1; -- Incrementar contador
                    pulso_reg <= '0'; -- Reiniciar pulso

                when 3 =>
                    acumulado <= acumulado + (RESIZE(UNSIGNED(entrada)*1000, 32) ); -- Acumular entrada * 1000
                    contador <= contador + 1; -- Incrementar contador
                    pulso_reg <= '0'; -- Reiniciar pulso

                when 4 =>
                    acumulado <= acumulado + (RESIZE(UNSIGNED(entrada)*10000, 32)); -- Acumular entrada * 10000
                    contador <= contador + 1; -- Incrementar contador
                    pulso_reg <= '0'; -- Reiniciar pulso

                when 5 =>
                    acumulado(31) <= entrada(0); -- Asignar signo según el bit más bajo de entrada
                    if entrada(0) = '1' then
                        acumulado(30 downto 0) <= (not acumulado(30 downto 0)) + 1; -- Hacer negativo
                    end if;
                    listo <= true; -- Establecer estado de preparación
                    pulso_reg <= '1'; -- Generar pulso de enter
                    contador <= contador + 1; -- Prepararse para el siguiente estado

                when others =>
                    if listo then
                        pulso_reg <= '1'; -- Generar pulso al final
                        acumulado <= (others => '0'); -- Reiniciar acumulador
                        contador <= 0; -- Reiniciar contador
                        listo <= false; -- Prepararse para acumular de nuevo
                    else
                        pulso_reg <= '0'; -- Reiniciar pulso
                    end if;
            end case;
        end if;
    end process;

    pulso_ent <= pulso_reg; -- Asignar el pulso de salida
    salida <= std_logic_vector(resize(acumulado, 17)); -- Convertir de UNSIGNED a STD_LOGIC_VECTOR
end Modified;
