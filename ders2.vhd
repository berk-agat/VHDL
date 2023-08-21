-- Girişine gelen 16bitlik sayıyı ikiye bölerek çıkışa aktaran VHDL tasarımı

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity example is
port (
    clk : in std_logic;
    rst : in std_logic;
    say_16b : in std_logic_vector(15 downto 0);
    say1_8b : out std_logic_vector(7 downto 0);
    say2_8b : out std_logic_vector (7 downto 0) 
);
end example;

architecture Behavioral of example is
begin
    process(clk, rst)
    begin 
        if (rst = '1') then
            say1_8b <= ( others => '0');
            say2_8b <= ( others => '0');
        elsif (rising_edge(clk)) then
            say1_8b <= say_16b(7 downto 0);
            say2_8b <= say_16b(15 downto 8);
    end if;    
    end process;
end Behavioral;
