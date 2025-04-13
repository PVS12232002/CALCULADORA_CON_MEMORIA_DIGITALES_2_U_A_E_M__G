library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2x1 is --para reafirmar error
    Port (
        error : in STD_LOGIC;
        tierra : in STD_LOGIC;
        sel : in STD_LOGIC_VECTOR (1 downto 0);
        errors : out STD_LOGIC
    );
end Mux_2x1;

architecture Behavioral of Mux_2x1 is
begin
    Process(sel, error, tierra)
    begin
        case sel is
            when "11" =>
                errors <= error;
            when others =>
                errors <= tierra;
        end case;
    end process;
end Behavioral;
