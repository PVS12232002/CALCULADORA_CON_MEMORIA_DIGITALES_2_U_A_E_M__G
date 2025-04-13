library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;  

entity multiplexor_4_casos is
    Port (         
        -- Entradas A         
        a0 : in  STD_LOGIC;         
        a1 : in  STD_LOGIC;         
        a2 : in  STD_LOGIC;         
        a3 : in  STD_LOGIC;         
        a4 : in  STD_LOGIC;         
        a5 : in  STD_LOGIC;         
        a6 : in  STD_LOGIC;         
        a7 : in  STD_LOGIC;         
        a8 : in  STD_LOGIC;         
        a9 : in  STD_LOGIC;         
        a10 : in  STD_LOGIC;         
        a11 : in  STD_LOGIC;         
        a12 : in  STD_LOGIC;         
        a13 : in  STD_LOGIC;         
        a14 : in  STD_LOGIC;         
        a15 : in  STD_LOGIC;         
        a16 : in  STD_LOGIC;         

        -- Entradas B         
        b0 : in  STD_LOGIC;         
        b1 : in  STD_LOGIC;         
        b2 : in  STD_LOGIC;         
        b3 : in  STD_LOGIC;         
        b4 : in  STD_LOGIC;         
        b5 : in  STD_LOGIC;         
        b6 : in  STD_LOGIC;         
        b7 : in  STD_LOGIC;         
        b8 : in  STD_LOGIC;         
        b9 : in  STD_LOGIC;         
        b10 : in  STD_LOGIC;         
        b11 : in  STD_LOGIC;         
        b12 : in  STD_LOGIC;         
        b13 : in  STD_LOGIC;         
        b14 : in  STD_LOGIC;         
        b15 : in  STD_LOGIC;         
        b16 : in  STD_LOGIC;         

        -- Selección         
        sel : in  STD_LOGIC_VECTOR(1 downto 0); 

        -- Salidas individuales para A         
        salida_a001 : out STD_LOGIC;         
        salida_a002 : out STD_LOGIC;         
        salida_a003 : out STD_LOGIC;         
        salida_a004 : out STD_LOGIC;         
        salida_a005 : out STD_LOGIC;         
        salida_a006 : out STD_LOGIC;         
        salida_a007 : out STD_LOGIC;         
        salida_a008 : out STD_LOGIC;         
        salida_a009 : out STD_LOGIC;         
        salida_a010 : out STD_LOGIC;         
        salida_a011 : out STD_LOGIC;         
        salida_a012 : out STD_LOGIC;         
        salida_a013 : out STD_LOGIC;         
        salida_a014 : out STD_LOGIC;         
        salida_a015 : out STD_LOGIC;         
        salida_a016 : out STD_LOGIC;         
        salida_a017 : out STD_LOGIC;         

        salida_a018 : out STD_LOGIC;         
        salida_a019 : out STD_LOGIC;         
        salida_a020 : out STD_LOGIC;         
        salida_a021 : out STD_LOGIC;         
        salida_a022 : out STD_LOGIC;         
        salida_a023 : out STD_LOGIC;         
        salida_a024 : out STD_LOGIC;         
        salida_a025 : out STD_LOGIC;         
        salida_a026 : out STD_LOGIC;         
        salida_a027 : out STD_LOGIC;         
        salida_a028 : out STD_LOGIC;         
        salida_a029 : out STD_LOGIC;         
        salida_a030 : out STD_LOGIC;         
        salida_a031 : out STD_LOGIC;         
        salida_a032 : out STD_LOGIC;         
        salida_a033 : out STD_LOGIC;         
        salida_a034 : out STD_LOGIC;         

        salida_a035 : out STD_LOGIC;         
        salida_a036 : out STD_LOGIC;         
        salida_a037 : out STD_LOGIC;         
        salida_a038 : out STD_LOGIC;         
        salida_a039 : out STD_LOGIC;         
        salida_a040 : out STD_LOGIC;         
        salida_a041 : out STD_LOGIC;         
        salida_a042 : out STD_LOGIC;         
        salida_a043 : out STD_LOGIC;         
        salida_a044 : out STD_LOGIC;         
        salida_a045 : out STD_LOGIC;         
        salida_a046 : out STD_LOGIC;         
        salida_a047 : out STD_LOGIC;         
        salida_a048 : out STD_LOGIC;         
        salida_a049 : out STD_LOGIC;         
        salida_a050 : out STD_LOGIC;         
        salida_a051 : out STD_LOGIC;         

        salida_a052 : out STD_LOGIC;         
        salida_a053 : out STD_LOGIC;         
        salida_a054 : out STD_LOGIC;         
        salida_a055 : out STD_LOGIC;         
        salida_a056 : out STD_LOGIC;         
        salida_a057 : out STD_LOGIC;         
        salida_a058 : out STD_LOGIC;         
        salida_a059 : out STD_LOGIC;         
        salida_a060 : out STD_LOGIC;         
        salida_a061 : out STD_LOGIC;         
        salida_a062 : out STD_LOGIC;         
        salida_a063 : out STD_LOGIC;         
        salida_a064 : out STD_LOGIC;         
        salida_a065 : out STD_LOGIC;         
        salida_a066 : out STD_LOGIC;         
        salida_a067 : out STD_LOGIC;    
		  salida_a068 : out STD_LOGIC;  

        -- Salidas individuales para B         
        salida_b001 : out STD_LOGIC;         
        salida_b002 : out STD_LOGIC;         
        salida_b003 : out STD_LOGIC;         
        salida_b004 : out STD_LOGIC;         
        salida_b005 : out STD_LOGIC;         
        salida_b006 : out STD_LOGIC;         
        salida_b007 : out STD_LOGIC;         
        salida_b008 : out STD_LOGIC;         
        salida_b009 : out STD_LOGIC;         
        salida_b010 : out STD_LOGIC;         
        salida_b011 : out STD_LOGIC;         
        salida_b012 : out STD_LOGIC;         
        salida_b013 : out STD_LOGIC;         
        salida_b014 : out STD_LOGIC;         
        salida_b015 : out STD_LOGIC;         
        salida_b016 : out STD_LOGIC;         

        salida_b017 : out STD_LOGIC;         
        salida_b018 : out STD_LOGIC;         
        salida_b019 : out STD_LOGIC;         
        salida_b020 : out STD_LOGIC;         
        salida_b021 : out STD_LOGIC;         
        salida_b022 : out STD_LOGIC;         
        salida_b023 : out STD_LOGIC;         
        salida_b024 : out STD_LOGIC;         
        salida_b025 : out STD_LOGIC;         
        salida_b026 : out STD_LOGIC;         
        salida_b027 : out STD_LOGIC;         
        salida_b028 : out STD_LOGIC;         
        salida_b029 : out STD_LOGIC;         
        salida_b030 : out STD_LOGIC;         
        salida_b031 : out STD_LOGIC;         
        salida_b032 : out STD_LOGIC;         
        salida_b033 : out STD_LOGIC;         

        salida_b034 : out STD_LOGIC;         
        salida_b035 : out STD_LOGIC;         
        salida_b036 : out STD_LOGIC;         
        salida_b037 : out STD_LOGIC;         
        salida_b038 : out STD_LOGIC;         
        salida_b039 : out STD_LOGIC;         
        salida_b040 : out STD_LOGIC;         
        salida_b041 : out STD_LOGIC;         
        salida_b042 : out STD_LOGIC;         
        salida_b043 : out STD_LOGIC;         
        salida_b044 : out STD_LOGIC;         
        salida_b045 : out STD_LOGIC;         
        salida_b046 : out STD_LOGIC;         
        salida_b047 : out STD_LOGIC;         
        salida_b048 : out STD_LOGIC;         
        salida_b049 : out STD_LOGIC;         
        salida_b050 : out STD_LOGIC;         

        salida_b051 : out STD_LOGIC;         
        salida_b052 : out STD_LOGIC;         
        salida_b053 : out STD_LOGIC;         
        salida_b054 : out STD_LOGIC;         
        salida_b055 : out STD_LOGIC;         
        salida_b056 : out STD_LOGIC;         
        salida_b057 : out STD_LOGIC;         
        salida_b058 : out STD_LOGIC;         
        salida_b059 : out STD_LOGIC;         
        salida_b060 : out STD_LOGIC;         
        salida_b061 : out STD_LOGIC;         
        salida_b062 : out STD_LOGIC;         
        salida_b063 : out STD_LOGIC;         
        salida_b064 : out STD_LOGIC;         
        salida_b065 : out STD_LOGIC;         
        salida_b066 : out STD_LOGIC;         
        salida_b067 : out STD_LOGIC;     
		  salida_b068 : out STD_LOGIC 
    ); 
end multiplexor_4_casos;  

architecture Behavioral of multiplexor_4_casos is 
begin     
    process(a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, 
            a10, a11, a12, a13, a14, a15, a16, 
            b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, 
            b10, b11, b12, b13, b14, b15, b16, 
            sel)     
    begin         
        -- Inicializa salidas A y B         
        salida_a001 <= '0';         
        salida_a002 <= '0';         
        salida_a003 <= '0';         
        salida_a004 <= '0';         
        salida_a005 <= '0';         
        salida_a006 <= '0';         
        salida_a007 <= '0';         
        salida_a008 <= '0';         
        salida_a009 <= '0';         
        salida_a010 <= '0';         
        salida_a011 <= '0';         
        salida_a012 <= '0';         
        salida_a013 <= '0';         
        salida_a014 <= '0';         
        salida_a015 <= '0';         
        salida_a016 <= '0'; 
        
        salida_a017 <= '0';         
        salida_a018 <= '0';         
        salida_a019 <= '0';         
        salida_a020 <= '0';         
        salida_a021 <= '0';         
        salida_a022 <= '0';         
        salida_a023 <= '0';         
        salida_a024 <= '0';         
        salida_a025 <= '0';         
        salida_a026 <= '0';         
        salida_a027 <= '0';         
        salida_a028 <= '0';         
        salida_a029 <= '0';         
        salida_a030 <= '0';         
        salida_a031 <= '0';         
        salida_a032 <= '0';         
        salida_a033 <= '0';         
        salida_a034 <= '0';         

        salida_a035 <= '0';         
        salida_a036 <= '0';         
        salida_a037 <= '0';         
        salida_a038 <= '0';         
        salida_a039 <= '0';         
        salida_a040 <= '0';         
        salida_a041 <= '0';         
        salida_a042 <= '0';         
        salida_a043 <= '0';         
        salida_a044 <= '0';         
        salida_a045 <= '0';         
        salida_a046 <= '0';         
        salida_a047 <= '0';         
        salida_a048 <= '0';         
        salida_a049 <= '0';         
        salida_a050 <= '0';         
        salida_a051 <= '0';         

        salida_a052 <= '0';         
        salida_a053 <= '0';         
        salida_a054 <= '0';         
        salida_a055 <= '0';         
        salida_a056 <= '0';         
        salida_a057 <= '0';         
        salida_a058 <= '0';         
        salida_a059 <= '0';         
        salida_a060 <= '0';         
        salida_a061 <= '0';         
        salida_a062 <= '0';         
        salida_a063 <= '0';         
        salida_a064 <= '0';         
        salida_a065 <= '0';         
        salida_a066 <= '0';         
        salida_a067 <= '0'; 
		  salida_a068 <= '0';

        salida_b001 <= '0';         
        salida_b002 <= '0';         
        salida_b003 <= '0';         
        salida_b004 <= '0';         
        salida_b005 <= '0';         
        salida_b006 <= '0';         
        salida_b007 <= '0';         
        salida_b008 <= '0';         
        salida_b009 <= '0';         
        salida_b010 <= '0';         
        salida_b011 <= '0';         
        salida_b012 <= '0';         
        salida_b013 <= '0';         
        salida_b014 <= '0';         
        salida_b015 <= '0';         
        salida_b016 <= '0';         
        salida_b017 <= '0';         
		  
        salida_b018 <= '0';         
        salida_b019 <= '0';         
        salida_b020 <= '0';         
        salida_b021 <= '0';         
        salida_b022 <= '0';         
        salida_b023 <= '0';         
        salida_b024 <= '0';         
        salida_b025 <= '0';         
        salida_b026 <= '0';         
        salida_b027 <= '0';         
        salida_b028 <= '0';         
        salida_b029 <= '0';         
        salida_b030 <= '0';         
        salida_b031 <= '0';         
        salida_b032 <= '0';         
        salida_b033 <= '0';         

        salida_b034 <= '0';         
        salida_b035 <= '0';         
        salida_b036 <= '0';         
        salida_b037 <= '0';         
        salida_b038 <= '0';         
        salida_b039 <= '0';         
        salida_b040 <= '0';         
        salida_b041 <= '0';         
        salida_b042 <= '0';         
        salida_b043 <= '0';         
        salida_b044 <= '0';         
        salida_b045 <= '0';         
        salida_b046 <= '0';         
        salida_b047 <= '0';         
        salida_b048 <= '0';         
        salida_b049 <= '0';         

        salida_b050 <= '0';         
        salida_b051 <= '0';         
        salida_b052 <= '0';         
        salida_b053 <= '0';         
        salida_b054 <= '0';         
        salida_b055 <= '0';         
        salida_b056 <= '0';         
        salida_b057 <= '0';         
        salida_b058 <= '0';         
        salida_b059 <= '0';         
        salida_b060 <= '0';         
        salida_b061 <= '0';         
        salida_b062 <= '0';         
        salida_b063 <= '0';         
        salida_b064 <= '0';         
        salida_b065 <= '0';         
        salida_b066 <= '0';         
        salida_b067 <= '0';
		  salida_b068 <= '0'; 
		  
        case sel is             
            when "00" =>                 
                -- caso 1                 
                salida_a001 <= a0;                 
                salida_a002 <= a1;                 
                salida_a003 <= a2;                 
                salida_a004 <= a3;                 
                salida_a005 <= a4;                 
                salida_a006 <= a5;                 
                salida_a007 <= a6;                 
                salida_a008 <= a7;                 
                salida_a009 <= a8;                 
                salida_a010 <= a9;                 
                salida_a011 <= a10;                 
                salida_a012 <= a11;                 
                salida_a013 <= a12;                 
                salida_a014 <= a13;                 
                salida_a015 <= a14;                 
                salida_a016 <= a15;                 
                salida_a017 <= a16;                 
                salida_b001 <= b0;                 
                salida_b002 <= b1;                 
                salida_b003 <= b2;                 
                salida_b004 <= b3;                 
                salida_b005 <= b4;                 
                salida_b006 <= b5;                 
                salida_b007 <= b6;                 
                salida_b008 <= b7;                 
                salida_b009 <= b8;                 
                salida_b010 <= b9;                 
                salida_b011 <= b10;                 
                salida_b012 <= b11;                 
                salida_b013 <= b12;                 
                salida_b014 <= b13;                 
                salida_b015 <= b14;                 
                salida_b016 <= b15;                 
                salida_b017 <= b16;             

            when "01" =>                 
                -- caso 2                 
                salida_a018 <= a0;                 
                salida_a019 <= a1;                 
                salida_a020 <= a2;                 
                salida_a021 <= a3;                 
                salida_a022 <= a4;                 
                salida_a023 <= a5;                 
                salida_a024 <= a6;                 
                salida_a025 <= a7;                 
                salida_a026 <= a8;                 
                salida_a027 <= a9;                 
                salida_a028 <= a10;                 
                salida_a029 <= a11;                 
                salida_a030 <= a12;                 
                salida_a031 <= a13;                 
                salida_a032 <= a14;                 
                salida_a033 <= a15;                 
                salida_a034 <= a16;                 
                salida_b018 <= b0;                 
                salida_b019 <= b1;                 
                salida_b020 <= b2;                 
                salida_b021 <= b3;                 
                salida_b022 <= b4;                 
                salida_b023 <= b5;                 
                salida_b024 <= b6;                 
                salida_b025 <= b7;                 
                salida_b026 <= b8;                 
                salida_b027 <= b9;                 
                salida_b028 <= b10;                 
                salida_b029 <= b11;                 
                salida_b030 <= b12;                 
                salida_b031 <= b13;                 
                salida_b032 <= b14;                 
                salida_b033 <= b15;                 
                salida_b034 <= b16;             

            when "10" =>                 
                -- caso 3                 
                salida_a035 <= a0;                 
                salida_a036 <= a1;                 
                salida_a037 <= a2;                 
                salida_a038 <= a3;                 
                salida_a039 <= a4;                 
                salida_a040 <= a5;                 
                salida_a041 <= a6;                 
                salida_a042 <= a7;                 
                salida_a043 <= a8;                 
                salida_a044 <= a9;                 
                salida_a045 <= a10;                 
                salida_a046 <= a11;                 
                salida_a047 <= a12;                 
                salida_a048 <= a13;                 
                salida_a049 <= a14;                 
                salida_a050 <= a15;                 
                salida_a051 <= a16;                 
                salida_b035 <= b0;                 
                salida_b036 <= b1;                 
                salida_b037 <= b2;                 
                salida_b038 <= b3;                 
                salida_b039 <= b4;                 
                salida_b040 <= b5;                 
                salida_b041 <= b6;                 
                salida_b042 <= b7;                 
                salida_b043 <= b8;                 
                salida_b044 <= b9;                 
                salida_b045 <= b10;                 
                salida_b046 <= b11;                 
                salida_b047 <= b12;                 
                salida_b048 <= b13;                 
                salida_b049 <= b14;                 
                salida_b050 <= b15;                 
                salida_b051 <= b16;             

            when "11" =>                 
                -- caso 4                 
                salida_a052 <= a0;                 
                salida_a053 <= a1;                 
                salida_a054 <= a2;                 
                salida_a055 <= a3;                 
                salida_a056 <= a4;                 
                salida_a057 <= a5;                 
                salida_a058 <= a6;                 
                salida_a059 <= a7;                 
                salida_a060 <= a8;                 
                salida_a061 <= a9;                 
                salida_a062 <= a10;                 
                salida_a063 <= a11;                 
                salida_a064 <= a12;                 
                salida_a065 <= a13;                 
                salida_a066 <= a14;                 
                salida_a067 <= a15;
					 salida_a068 <= a16;
                salida_b052 <= b0;                 
                salida_b053 <= b1;                 
                salida_b054 <= b2;                 
                salida_b055 <= b3;                 
                salida_b056 <= b4;                 
                salida_b057 <= b5;                 
                salida_b058 <= b6;                 
                salida_b059 <= b7;                 
                salida_b060 <= b8;                 
                salida_b061 <= b9;                 
                salida_b062 <= b10;                 
                salida_b063 <= b11;                 
                salida_b064 <= b12;                 
                salida_b065 <= b13;                 
                salida_b066 <= b14;                 
                salida_b067 <= b15;
					 salida_b068 <= b16;

            when others =>NULL; 
        end case;         
    end process; 
end Behavioral; 
