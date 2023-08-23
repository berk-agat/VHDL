--8 bitlik veri üzerinde tek veya çift eşlik(parity) koud üreten devreyi tasarlayınız. Eşlik kodu, seri iletişimde gönderilen bilginin
--doğru bir şekilde gönderilip gönderilmediğinin alıcı tarafından kontrolünün yapılması için kullanılır . Gönderilen 8bitlik verideki 1'select
-- sayısı tek ise'1', çift ise '0' değerini alır. Buradaki uygulamada 8bitlik verideki 1'lerin sayısının tek mi çift mi olduğu üretilecektir.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity example is
port (
        clk : in std_logic;
        rst : in std_logic;
        in_1 : in std_logic_vector(7 downto 0);
        cift : out std_logic;
        tek : out std_logic
);
end example;

architecture Behavioral of example is
         signal sonuc : std_logic_vector(8 downto 0) :=(others => '0') ; -- Eşlik biti sonuç sinyalinin 9. bitinde depolanmıştır
begin
        ESLIK_BITI: for i IN 0 to 7 generate
        sonuc(i+1) <= sonuc(i)XOR in_1(i);
        end generate;
    process(clk, sonuc(8))
    begin 
        if rising_edge(clk) then
            if sonuc(8) = '0' then
                cift <= '1';
                tek <= '0';
            elsif sonuc(8) = '1' then
                cift <= '0';
                tek <= '1';
            end if;                 
        end if;
   end process;
end Behavioral;
