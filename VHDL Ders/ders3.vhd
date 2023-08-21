-- 4bitlik sayıcı tasarımı 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;

entity example is
port (
        clk : in std_logic;
        rst : in std_logic;
        son : out std_logic_vector(3 downto 0)
);
end example;

architecture Behavioral of example is
    signal say : std_logic_vector(3 downto 0) := (others => '0');
begin
    process(clk,rst)
    begin
        if (rst='1') then
            say <=(others =>'0');
        elsif rising_edge(clk) then
            say <= say + 1;
        end if;
        end process;
        son <= say;
end Behavioral;
