library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL;  

entity restador_con_entradas is     
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

        -- Salida de la resta         
        resultado : out SIGNED(33 downto 0)     
    ); 
end restador_con_entradas;  

architecture Behavioral of restador_con_entradas is      
    -- Señales internas para capturar los números binarios     
    signal A : SIGNED(16 downto 0);     
    signal B : SIGNED(16 downto 0);     
    signal a_vector : STD_LOGIC_VECTOR(16 downto 0); -- Vector temporal para A     
    signal b_vector : STD_LOGIC_VECTOR(16 downto 0); -- Vector temporal para B      
begin      
    -- Capturar las entradas y convertirlas en vectores     
    a_vector <= a16 & a15 & a14 & a13 & a12 & a11 & a10 & a9 & a8 & a7 & a6 & a5 & a4 & a3 & a2 & a1 & a0; -- Número A (STD_LOGIC_VECTOR)     
    b_vector <= b16 & b15 & b14 & b13 & b12 & b11 & b10 & b9 & b8 & b7 & b6 & b5 & b4 & b3 & b2 & b1 & b0; -- Número B (STD_LOGIC_VECTOR)      
    -- Convierte los vectores de STD_LOGIC_VECTOR a SIGNED     
    A <= signed(a_vector);     
    B <= signed(b_vector);      
    -- Proceso que realiza la resta entre A y B     
    process(A, B)     
    begin         
        -- Realiza la resta y extiende a 34 bits         
        resultado <= resize(A, 34) - resize(B, 34);       
    end process;  
end Behavioral; 