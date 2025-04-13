library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PulseGenerator is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           data : in STD_LOGIC_VECTOR(3 downto 0);
           pulse_out : out STD_LOGIC);
end PulseGenerator;

architecture Behavioral of PulseGenerator is
    signal count : INTEGER := 0;
    signal pulse_reg : STD_LOGIC := '0';
    signal active : BOOLEAN := false;

    constant CYCLE_LIMIT : INTEGER := 12500000;  -- 25 MHz * 0.5 s
begin
    process(clk, rst)
    begin
        if rst = '1' then
            count <= 0;
            pulse_reg <= '0';
            active <= false;
        elsif rising_edge(clk) then
            if count < CYCLE_LIMIT then
                count <= count + 1;
            else
                count <= 0;
                if active then
                    pulse_reg <= '1';
                    active <= false;  -- Reset active state
                else
                    pulse_reg <= '0';
                end if;
            end if;

            -- Check if any bit in 'data' is 1
            if data /= "0000" then
                active <= true;  -- Set active if any input is high
            end if;
        end if;
    end process;

    pulse_out <= pulse_reg;

end Behavioral;
