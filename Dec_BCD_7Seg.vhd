library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Dec_BCD_7Seg is
    Port (
        selector : in STD_LOGIC_VECTOR (1 downto 0);
        unidades : in STD_LOGIC_VECTOR (3 downto 0);
        decenas : in STD_LOGIC_VECTOR (3 downto 0);
        centenas : in STD_LOGIC_VECTOR (3 downto 0);
        mil : in STD_LOGIC_VECTOR (3 downto 0);
        dec_mil : in STD_LOGIC_VECTOR (3 downto 0);
        cen_mil : in STD_LOGIC_VECTOR (3 downto 0);
        billon : in STD_LOGIC_VECTOR (3 downto 0);
        signo : in STD_LOGIC;
        error : in STD_LOGIC;
        unid : out STD_LOGIC_VECTOR (6 downto 0);
        dece : out STD_LOGIC_VECTOR (6 downto 0);
        cente : out STD_LOGIC_VECTOR (6 downto 0);
        umillar : out STD_LOGIC_VECTOR (6 downto 0);
        dmillar : out STD_LOGIC_VECTOR (6 downto 0);
        cmillar : out STD_LOGIC_VECTOR (6 downto 0);
        ubillon : out STD_LOGIC_VECTOR (6 downto 0);
		  signalmenos: out STD_LOGIC_VECTOR (6 downto 0);
		  LED3 : in STD_LOGIC;
        punto : out STD_LOGIC
    );
end Dec_BCD_7Seg;
architecture Behavioral of Dec_BCD_7Seg is
begin
		
    visualizador: process (selector, unidades, decenas, centenas, mil, dec_mil, cen_mil, billon, signo, error)
	 begin
	 punto <= '0';
	 if error = '1' then
	 case selector is
	 when "11" => 
	 unid<="1111010";
	 dece<="1100010";
	 cente<="1111010";
	 umillar<="1111010";
	 dmillar<="0110000";
	 cmillar<="1111111";
	 ubillon<="1111111";
	 signalmenos<="1111111";
	 when others => null;
	 end case;
	 else 
	 case selector is
            when "00" =>
				case unidades is
            when "0000" =>  unid <= "0000001"; -- 0
            when "0001" =>  unid <= "1001111"; -- 1
            when "0010" =>  unid <= "0010010"; -- 2
            when "0011" =>  unid <= "0000110"; -- 3
            when "0100" =>  unid <= "1001100"; -- 4
            when "0101" =>  unid <= "0100100"; -- 5
            when "0110" =>  unid <= "0100000"; -- 6
            when "0111" =>  unid <= "0001111"; -- 7
            when "1000" =>  unid <= "0000000"; -- 8
            when "1001" =>  unid <= "0000100"; -- 9            
            when others => unid <= "1111111"; --nada
        end case;
		  case decenas is
            when "0000" =>  dece <= "0000001"; -- 0
            when "0001" =>  dece <= "1001111"; -- 1
            when "0010" =>  dece <= "0010010"; -- 2
            when "0011" =>  dece <= "0000110"; -- 3
            when "0100" =>  dece <= "1001100"; -- 4
            when "0101" =>  dece <= "0100100"; -- 5
            when "0110" =>  dece <= "0100000"; -- 6
            when "0111" =>  dece <= "0001111"; -- 7
            when "1000" =>  dece <= "0000000"; -- 8
            when "1001" =>  dece <= "0000100"; -- 9            
            when others =>  dece <= "1111111"; --nada
        end case;
		  case centenas is
            when "0000" =>  cente <= "0000001"; -- 0
            when "0001" =>  cente <= "1001111"; -- 1
            when "0010" =>  cente <= "0010010"; -- 2
            when "0011" =>  cente <= "0000110"; -- 3
            when "0100" =>  cente <= "1001100"; -- 4
            when "0101" =>  cente <= "0100100"; -- 5
            when "0110" =>  cente <= "0100000"; -- 6
            when "0111" =>  cente <= "0001111"; -- 7
            when "1000" =>  cente <= "0000000"; -- 8
            when "1001" =>  cente <= "0000100"; -- 9            
            when others => cente <= "1111111"; --nada
        end case;
		  case mil is
		   when "1111" =>
                        if signo = '1' then
                            umillar <= "1111110"; -- signo negativo
                        else
                            umillar <= "1111111"; -- nada
                        end if;
                    when others => umillar <= "1111111"; -- nada
                end case;
		  case dec_mil is
            when "1111" => dmillar <= "1111111"; --nada
				when others => dmillar <= "1111111";
        end case;
		  case cen_mil is
           when "1111" => cmillar <= "1111111"; --nada
			  when others => cmillar <= "1111111";
        end case;
		  case billon is
            when "1111" => ubillon <= "1111111"; --nada
				signalmenos <= "1111111"; --nada
				when others => ubillon <= "1111111";
        end case;
				when "01" =>
				case unidades is
            when "0000" =>  unid <= "0000001"; -- 0
            when "0001" =>  unid <= "1001111"; -- 1
            when "0010" =>  unid <= "0010010"; -- 2
            when "0011" =>  unid <= "0000110"; -- 3
            when "0100" =>  unid <= "1001100"; -- 4
            when "0101" =>  unid <= "0100100"; -- 5
            when "0110" =>  unid <= "0100000"; -- 6
            when "0111" =>  unid <= "0001111"; -- 7
            when "1000" =>  unid <= "0000000"; -- 8
            when "1001" =>  unid <= "0000100"; -- 9            
            when others => unid <= "1111111"; --nada
        end case;
		  case decenas is
            when "0000" =>  dece <= "0000001"; -- 0
            when "0001" =>  dece <= "1001111"; -- 1
            when "0010" =>  dece <= "0010010"; -- 2
            when "0011" =>  dece <= "0000110"; -- 3
            when "0100" =>  dece <= "1001100"; -- 4
            when "0101" =>  dece <= "0100100"; -- 5
            when "0110" =>  dece <= "0100000"; -- 6
            when "0111" =>  dece <= "0001111"; -- 7
            when "1000" =>  dece <= "0000000"; -- 8
            when "1001" =>  dece <= "0000100"; -- 9            
            when others =>  dece <= "1111111"; --nada
        end case;
		  case centenas is
            when "0000" =>  cente <= "0000001"; -- 0
            when "0001" =>  cente <= "1001111"; -- 1
            when "0010" =>  cente <= "0010010"; -- 2
            when "0011" =>  cente <= "0000110"; -- 3
            when "0100" =>  cente <= "1001100"; -- 4
            when "0101" =>  cente <= "0100100"; -- 5
            when "0110" =>  cente <= "0100000"; -- 6
            when "0111" =>  cente <= "0001111"; -- 7
            when "1000" =>  cente <= "0000000"; -- 8
            when "1001" =>  cente <= "0000100"; -- 9            
            when others => cente <= "1111111"; --nada
        end case;
		 case mil is
		  when "1111" => if signo = '1' then
            umillar <= "1111110"; -- signo
					else
            umillar <= "1111111"; --nada
			end if;
			when others => ubillon <= "1111111";
			if signo = '1' then
            umillar <= "1111110"; -- signo
					else
            umillar <= "1111111"; --nada
			end if;
        end case;
		  case dec_mil is
            when "1111" => dmillar <= "1111111"; --nada
				when others => dmillar <= "1111111"; --nada
        end case;
		  case cen_mil is
            when "1111" => cmillar <= "1111111"; --nada
				when others => cmillar <= "1111111"; --nada
        end case;
		  case billon is
           when "1111" => ubillon <= "1111111"; --nada
				signalmenos <= "1111111"; --nada
				 when others => ubillon <= "1111111"; --nada
				 signalmenos <= "1111111"; --nada
        end case;
		
				when "10" =>
				case unidades is
            when "0000" =>  unid <= "0000001"; -- 0
            when "0001" =>  unid <= "1001111"; -- 1
            when "0010" =>  unid <= "0010010"; -- 2
            when "0011" =>  unid <= "0000110"; -- 3
            when "0100" =>  unid <= "1001100"; -- 4
            when "0101" =>  unid <= "0100100"; -- 5
            when "0110" =>  unid <= "0100000"; -- 6
            when "0111" =>  unid <= "0001111"; -- 7
            when "1000" =>  unid <= "0000000"; -- 8
            when "1001" =>  unid <= "0000100"; -- 9            
            when others => unid <= "1111111"; --nada
        end case;
		  case decenas is
            when "0000" =>  dece <= "0000001"; -- 0
            when "0001" =>  dece <= "1001111"; -- 1
            when "0010" =>  dece <= "0010010"; -- 2
            when "0011" =>  dece <= "0000110"; -- 3
            when "0100" =>  dece <= "1001100"; -- 4
            when "0101" =>  dece <= "0100100"; -- 5
            when "0110" =>  dece <= "0100000"; -- 6
            when "0111" =>  dece <= "0001111"; -- 7
            when "1000" =>  dece <= "0000000"; -- 8
            when "1001" =>  dece <= "0000100"; -- 9            
            when others =>  dece <= "1111111"; --nada
        end case;
		  case centenas is
            when "0000" =>  cente <= "0000001"; -- 0
            when "0001" =>  cente <= "1001111"; -- 1
            when "0010" =>  cente <= "0010010"; -- 2
            when "0011" =>  cente <= "0000110"; -- 3
            when "0100" =>  cente <= "1001100"; -- 4
            when "0101" =>  cente <= "0100100"; -- 5
            when "0110" =>  cente <= "0100000"; -- 6
            when "0111" =>  cente <= "0001111"; -- 7
            when "1000" =>  cente <= "0000000"; -- 8
            when "1001" =>  cente <= "0000100"; -- 9            
            when others => cente <= "1111111"; --nada
        end case;
		  case mil is
            when "0000" =>  umillar <= "0000001"; -- 0
            when "0001" =>  umillar <= "1001111"; -- 1
            when "0010" =>  umillar <= "0010010"; -- 2
            when "0011" =>  umillar <= "0000110"; -- 3
            when "0100" =>  umillar <= "1001100"; -- 4
            when "0101" =>  umillar <= "0100100"; -- 5
            when "0110" =>  umillar <= "0100000"; -- 6
            when "0111" =>  umillar <= "0001111"; -- 7
            when "1000" =>  umillar <= "0000000"; -- 8
            when "1001" =>  umillar <= "0000100"; -- 9            
            when others =>  umillar <= "1111111"; --nada
        end case;
		  case dec_mil is
            when "0000" =>  dmillar <= "0000001"; -- 0
            when "0001" =>  dmillar <= "1001111"; -- 1
            when "0010" =>  dmillar <= "0010010"; -- 2
            when "0011" =>  dmillar <= "0000110"; -- 3
            when "0100" =>  dmillar <= "1001100"; -- 4
            when "0101" =>  dmillar <= "0100100"; -- 5
            when "0110" =>  dmillar <= "0100000"; -- 6
            when "0111" =>  dmillar <= "0001111"; -- 7
            when "1000" =>  dmillar <= "0000000"; -- 8
            when "1001" =>  dmillar <= "0000100"; -- 9            
            when others =>  dmillar <= "1111111"; --nada
        end case;
		  case cen_mil is
		  when "1111" => if signo = '1' then
            cmillar <= "1111110"; -- signo
					else
            cmillar <= "1111111"; --nada cmillar
			end if;
			 when others => cmillar <= "1111111"; --nada
        end case;
		  case billon is
            when "1111" => ubillon <= "1111111"; --nada
				signalmenos <= "1111111"; --nada
				when others => ubillon <= "1111111"; --nada
				signalmenos <= "1111111"; --nada
        end case;
				when "11" =>
				punto <= '1';
				case unidades is
            when "0000" =>  unid <= "0000001"; -- 0
            when "0001" =>  unid <= "1001111"; -- 1
            when "0010" =>  unid <= "0010010"; -- 2
            when "0011" =>  unid <= "0000110"; -- 3
            when "0100" =>  unid <= "1001100"; -- 4
            when "0101" =>  unid <= "0100100"; -- 5
            when "0110" =>  unid <= "0100000"; -- 6
            when "0111" =>  unid <= "0001111"; -- 7
            when "1000" =>  unid <= "0000000"; -- 8
            when "1001" =>  unid <= "0000100"; -- 9            
            when others => unid <= "1111111"; --nada
        end case;
		  case decenas is
            when "0000" =>  dece <= "0000001"; -- 0
            when "0001" =>  dece <= "1001111"; -- 1
            when "0010" =>  dece <= "0010010"; -- 2
            when "0011" =>  dece <= "0000110"; -- 3
            when "0100" =>  dece <= "1001100"; -- 4
            when "0101" =>  dece <= "0100100"; -- 5
            when "0110" =>  dece <= "0100000"; -- 6
            when "0111" =>  dece <= "0001111"; -- 7
            when "1000" =>  dece <= "0000000"; -- 8
            when "1001" =>  dece <= "0000100"; -- 9            
            when others =>  dece <= "1111111"; --nada
        end case;
		  case centenas is
            when "0000" =>  cente <= "0000001"; -- 0
            when "0001" =>  cente <= "1001111"; -- 1
            when "0010" =>  cente <= "0010010"; -- 2
            when "0011" =>  cente <= "0000110"; -- 3
            when "0100" =>  cente <= "1001100"; -- 4
            when "0101" =>  cente <= "0100100"; -- 5
            when "0110" =>  cente <= "0100000"; -- 6
            when "0111" =>  cente <= "0001111"; -- 7
            when "1000" =>  cente <= "0000000"; -- 8
            when "1001" =>  cente <= "0000100"; -- 9            
            when others => cente <= "1111111"; --nada
        end case;
		  case mil is
            when "0000" =>  umillar <= "0000001"; -- 0
            when "0001" =>  umillar <= "1001111"; -- 1
            when "0010" =>  umillar <= "0010010"; -- 2
            when "0011" =>  umillar <= "0000110"; -- 3
            when "0100" =>  umillar <= "1001100"; -- 4
            when "0101" =>  umillar <= "0100100"; -- 5
            when "0110" =>  umillar <= "0100000"; -- 6
            when "0111" =>  umillar <= "0001111"; -- 7
            when "1000" =>  umillar <= "0000000"; -- 8
            when "1001" =>  umillar <= "0000100"; -- 9            
            when others =>  umillar <= "1111111"; --nada
        end case;
		  case dec_mil is
            when "0000" =>  dmillar <= "0000001"; -- 0
            when "0001" =>  dmillar <= "1001111"; -- 1
            when "0010" =>  dmillar <= "0010010"; -- 2
            when "0011" =>  dmillar <= "0000110"; -- 3
            when "0100" =>  dmillar <= "1001100"; -- 4
            when "0101" =>  dmillar <= "0100100"; -- 5
            when "0110" =>  dmillar <= "0100000"; -- 6
            when "0111" =>  dmillar <= "0001111"; -- 7
            when "1000" =>  dmillar <= "0000000"; -- 8
            when "1001" =>  dmillar <= "0000100"; -- 9            
            when others =>  dmillar <= "1111111"; --nada
        end case;
		  case cen_mil is
            when "0000" =>  cmillar <= "0000001"; -- 0
            when "0001" =>  cmillar <= "1001111"; -- 1
            when "0010" =>  cmillar <= "0010010"; -- 2
            when "0011" =>  cmillar <= "0000110"; -- 3
            when "0100" =>  cmillar <= "1001100"; -- 4
            when "0101" =>  cmillar <= "0100100"; -- 5
            when "0110" =>  cmillar <= "0100000"; -- 6
            when "0111" =>  cmillar <= "0001111"; -- 7
            when "1000" =>  cmillar <= "0000000"; -- 8
            when "1001" =>  cmillar <= "0000100"; -- 9            
            when others =>  cmillar <= "1111111"; --nada
        end case;
		  case billon is
            when "0000" =>  ubillon <= "0000001"; -- 0
            when "0001" =>  ubillon <= "1001111"; -- 1
            when "0010" =>  ubillon <= "0010010"; -- 2
            when "0011" =>  ubillon <= "0000110"; -- 3
            when "0100" =>  ubillon <= "1001100"; -- 4
            when "0101" =>  ubillon <= "0100100"; -- 5
            when "0110" =>  ubillon <= "0100000"; -- 6
            when "0111" =>  ubillon <= "0001111"; -- 7
            when "1000" =>  ubillon <= "0000000"; -- 8
            when "1001" =>  ubillon <= "0000100"; -- 9            
            when others =>  ubillon <= "1111111"; --nada
        end case;
            if signo = '1' then
            signalmenos <= "1111110"; -- signo
					else
            signalmenos <= "1111111"; --nada
			end if;
        end case;
		  end if;
		  if LED3 = '0' then
				case unidades is
            when "0000" =>  unid <= "0000001"; -- 0
            when "0001" =>  unid <= "1001111"; -- 1
            when "0010" =>  unid <= "0010010"; -- 2
            when "0011" =>  unid <= "0000110"; -- 3
            when "0100" =>  unid <= "1001100"; -- 4
            when "0101" =>  unid <= "0100100"; -- 5
            when "0110" =>  unid <= "0100000"; -- 6
            when "0111" =>  unid <= "0001111"; -- 7
            when "1000" =>  unid <= "0000000"; -- 8
            when "1001" =>  unid <= "0000100"; -- 9            
            when others => unid <= "1111111"; --nada
        end case;
		  case decenas is
            when "0000" =>  dece <= "0000001"; -- 0
            when "0001" =>  dece <= "1001111"; -- 1
            when "0010" =>  dece <= "0010010"; -- 2
            when "0011" =>  dece <= "0000110"; -- 3
            when "0100" =>  dece <= "1001100"; -- 4
            when "0101" =>  dece <= "0100100"; -- 5
            when "0110" =>  dece <= "0100000"; -- 6
            when "0111" =>  dece <= "0001111"; -- 7
            when "1000" =>  dece <= "0000000"; -- 8
            when "1001" =>  dece <= "0000100"; -- 9            
            when others =>  dece <= "1111111"; --nada
        end case;
		  case centenas is
            when "0000" =>  cente <= "0000001"; -- 0
            when "0001" =>  cente <= "1001111"; -- 1
            when "0010" =>  cente <= "0010010"; -- 2
            when "0011" =>  cente <= "0000110"; -- 3
            when "0100" =>  cente <= "1001100"; -- 4
            when "0101" =>  cente <= "0100100"; -- 5
            when "0110" =>  cente <= "0100000"; -- 6
            when "0111" =>  cente <= "0001111"; -- 7
            when "1000" =>  cente <= "0000000"; -- 8
            when "1001" =>  cente <= "0000100"; -- 9            
            when others => cente <= "1111111"; --nada
        end case;
		  case mil is
            when "0000" =>  umillar <= "0000001"; -- 0
            when "0001" =>  umillar <= "1001111"; -- 1
            when "0010" =>  umillar <= "0010010"; -- 2
            when "0011" =>  umillar <= "0000110"; -- 3
            when "0100" =>  umillar <= "1001100"; -- 4
            when "0101" =>  umillar <= "0100100"; -- 5
            when "0110" =>  umillar <= "0100000"; -- 6
            when "0111" =>  umillar <= "0001111"; -- 7
            when "1000" =>  umillar <= "0000000"; -- 8
            when "1001" =>  umillar <= "0000100"; -- 9            
            when others =>  umillar <= "1111111"; --nada
        end case;
		  case dec_mil is
            when "0000" =>  dmillar <= "0000001"; -- 0
            when "0001" =>  dmillar <= "1001111"; -- 1
            when "0010" =>  dmillar <= "0010010"; -- 2
            when "0011" =>  dmillar <= "0000110"; -- 3
            when "0100" =>  dmillar <= "1001100"; -- 4
            when "0101" =>  dmillar <= "0100100"; -- 5
            when "0110" =>  dmillar <= "0100000"; -- 6
            when "0111" =>  dmillar <= "0001111"; -- 7
            when "1000" =>  dmillar <= "0000000"; -- 8
            when "1001" =>  dmillar <= "0000100"; -- 9            
            when others =>  dmillar <= "1111111"; --nada
        end case;
		  case cen_mil is
            when "0000" =>  cmillar <= "0000001"; -- 0
            when "0001" =>  cmillar <= "1001111"; -- 1
            when "0010" =>  cmillar <= "0010010"; -- 2
            when "0011" =>  cmillar <= "0000110"; -- 3
            when "0100" =>  cmillar <= "1001100"; -- 4
            when "0101" =>  cmillar <= "0100100"; -- 5
            when "0110" =>  cmillar <= "0100000"; -- 6
            when "0111" =>  cmillar <= "0001111"; -- 7
            when "1000" =>  cmillar <= "0000000"; -- 8
            when "1001" =>  cmillar <= "0000100"; -- 9            
            when others =>  cmillar <= "1111111"; --nada
        end case;
		  case billon is
            when "0000" =>  ubillon <= "0000001"; -- 0
            when "0001" =>  ubillon <= "1001111"; -- 1
            when "0010" =>  ubillon <= "0010010"; -- 2
            when "0011" =>  ubillon <= "0000110"; -- 3
            when "0100" =>  ubillon <= "1001100"; -- 4
            when "0101" =>  ubillon <= "0100100"; -- 5
            when "0110" =>  ubillon <= "0100000"; -- 6
            when "0111" =>  ubillon <= "0001111"; -- 7
            when "1000" =>  ubillon <= "0000000"; -- 8
            when "1001" =>  ubillon <= "0000100"; -- 9            
            when others =>  ubillon <= "1111111"; --nada
        end case;
            if signo = '1' then
            signalmenos <= "1111110"; -- signo
					else
            signalmenos <= "1111111"; --nada
			end if;
			end if;
	   end process;
end;