-- Bir sisteme giren iki farklı 8-bitlik sayıdan herhangi birini seçici bitin durumuna göre 8-bitlik çıkışa yönlendiren çoklayıcı tasarımı
-- Seçici bit "1" ise "s1" sayısını, seçici bit "0" ise "s2" sayısını çıkışa yönlendiren aksi halde çıkış değerini
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ders is 
    Port (
        clk : in std_logic;
        rst : in std_logic;
        say1 : in std_logic_vector (7 downto 0);
        say2 : in std_logic_vector (7 downto 0);
        secim : in std_logic;
        output : out std_logic_vector (7 downto 0)        
 );
end ders;

architecture Behavioral of ders is
begin
    process(clk, rst)
    begin 
    if (rst = '1') then
        output <= (others => '0');
    elsif (rising_edge(clk)) then
        if(secim = '1') then
            output <= say1;
        elsif(secim = '0') then
            output <= say2;
        else 
            output <= (others => '0');
        end if;
    end if;
    end process;
end Behavioral;
