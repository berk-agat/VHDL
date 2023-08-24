library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity example is
    Generic ( n: natural := 16);
port (
        clk : in std_logic;
        rst : in std_logic;
        gir : in std_logic_vector(n-1 downto 0);
        durum : out std_logic
        
);
end example;

architecture Behavioral of example is
       
begin
    process(clk,rst)
    variable tmp: std_logic;
    variable i : integer range 0 to 16 := 0;
begin 
    if rst = '1' then 
        tmp := 'U';
        i := 0;
    elsif rising_edge(clk) then
        tmp := '0';
        i := 0;
        while (i<16) loop
            tmp := tmp XOR gir(i);
            i:= i + 1;
        end loop;
    end if ;
    durum <= tmp; -- 0 ise çift, 1 ise tek       
   end process;
end Behavioral;
