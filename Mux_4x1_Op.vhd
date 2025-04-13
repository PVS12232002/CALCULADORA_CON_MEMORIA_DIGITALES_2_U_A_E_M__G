library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Mux_4x1_Op is
    Port (
        suma          : in  STD_LOGIC_VECTOR (33 downto 0);  -- Updated to 34 bits
        resta         : in  STD_LOGIC_VECTOR (33 downto 0);  -- Updated to 34 bits
        multiplicacion : in  STD_LOGIC_VECTOR (33 downto 0);  -- Updated to 34 bits
        division      : in  STD_LOGIC_VECTOR (33 downto 0);  -- Updated to 34 bits
        sel           : in  STD_LOGIC_VECTOR (1 downto 0);
        salida        : out STD_LOGIC_VECTOR (33 downto 0)   -- Updated to 34 bits
    );
end Mux_4x1_Op;

architecture Behavioral of Mux_4x1_Op is
begin
    process(sel, suma, resta, multiplicacion, division) 
    begin
        case sel is
            when "00" =>
                salida <= suma;
            when "01" =>
                salida <= resta;
            when "10" =>
                salida <= multiplicacion;
            when "11" =>
                salida <= division;
            when others =>
                salida <= (others => '0');  -- Default case
        end case;
    end process;
end Behavioral;
