-- 4bitlik sayıcı devre tasarımını devre girişine konulan bir anahtarla yukarı/aşağı şekilde sayma işlemi yapması için tasarım 
-- Eğer anahtar "0" konumda ise yukarı, "1" konumunda ise aşağı sayma işlemi yapılacak
-- Signal ve variable nesnelerini kullanarak aradaki farkı anlamak adına ayrı ayrı yapılacaktır
-- Devrenin çalışması etkileyecek en önemli unsur anahtar girişidir. Dolayısıyla bu verinin aktarıldığı nesne hem signal hem de variable olacaktır.

--Signal nesnesi kullanılarak yapılan tasarım
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;

entity example is
port (
        clk : in std_logic;
        rst : in std_logic;
        anahtar : in std_logic;
        son : out std_logic_vector(3 downto 0)
);
end example;

architecture Behavioral of example is
  --  signal anah : std_logic := '0'; -- signal kullanımı
begin
    process(clk, rst)
        variable say : std_logic_vector(3 downto 0) := (others=>'0');
        variable anah : std_logic := '0'; -- variable kullanılarak yapılırken eklenen
    begin
        if(rst = '1') then
            say := (others =>'0');
        elsif rising_edge(clk) then
            anah := anahtar; -- signal kullanırken <= olarak değişir
            if(anah ='0')then
                say := say + 1;
            else
                say := say - 1;
            end if;
        end if;
        son <= say;
     end process;
end Behavioral;
