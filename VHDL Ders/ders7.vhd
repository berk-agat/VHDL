-- Gİriş portundan gelen 2 adet 32 bitlik bilgiyi LSB(edn değersiz bit) başlayarak
-- aynı diziye 3 farklı sütun halinde ve 4 bitlik dilimler halinde taşıyan sayısal devere tasarımı 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity example is
port (
        clk : in std_logic;
        rst : in std_logic;
        say1 : in std_logic_vector(31 downto 0);
        say2 : in std_logic_vector(31 downto 0);
        sonuc : out std_logic
);
end example;

architecture Behavioral of example is
   type bRAM is Array (0 to 7, 0 to 1) of std_logic_vector(3 downto 0);
-- Bu 8x2 boyutunda 4 bitlik bellek dizisi tipini ifade eder. (8 sütun x 2 satır)  
   signal xRAM : bRAM;
-- Bu sinyal, bRAM türünden ve dolayısıyla 8x2 boyutunda bir bellek dizisi olacak şekilde ayarlanıyor.
begin
    process(clk, rst)
        variable sayac, indis : natural := 0;
    begin
        if(rst = '1') then
            xRAM <= (others => (others=>"0000")); 
            sayac := 0;
            indis := 0;
            sonuc <= '0';
--Eğer rst yüksek ise, xRAM sinyali temizlenir, sayıcılar sıfırlanır ve sonuc çıkışı '0' yapılır. 
        elsif rising_edge(clk) then
          while sayac < 32 loop 
            xRAM(indis,0) <= say1(sayac+3 downto sayac);
            xRAM(indis,1) <= say2(sayac+3 downto sayac);
            sayac := sayac + 4;
            indis := indis + 1; 
--Eğer clk yükselen kenarına ulaşılırsa, bir döngü içerisinde 32 bitlik input verileri 
--say1 ve say2'den alınarak xRAM belleğine 4 bitlik parçalar halinde yerleştirilir. Sayıcılar ve indis güncellenir.           
          end loop;
          sonuc <= '1';
        end if;
     end process;
end Behavioral;
