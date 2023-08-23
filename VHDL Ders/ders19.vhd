--Kombinasyonel devre tasarımı (eş zamanalı ifadeler) bir önceki tasarımdan farkı çıkış portu olan "ikaz" pininin 
--atamasının process başında yapılması nedeniyle daha fazla saat darbesi ayısı ile işlemlerin gerçekleşmesi ise tek farktır.
--Giriş portlarında yapılan bir değişiklik çıkış portunda 3 clock darbesi sonrasında yansımaktadır. 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity example is
port (
        clk : in std_logic;
        rst : in std_logic;
        motor : in std_logic;
        kapi : in std_logic;
        emniyet : in std_logic;
        ikaz : out std_logic
);
end example;

architecture Behavioral of example is
 signal out_1, out_2, out_3, k1, e1 : std_logic;
begin
    process(clk, rst)
    begin 
        if rst = '1' then
        ikaz <= '0';
        elsif rising_edge(clk) then
   ikaz <= out_2 or out_3;
   out_1 <= motor and kapi;
   out_2 <= motor and k1;
   out_3 <= out_1 and e1;
   k1 <= not(kapi);
   e1 <= not(emniyet);
   end if;
   end process;
end Behavioral;
