--  Mantıksal yarım toplayıcı devresinin tasarlayın. Giriş bitlerinin toplamı XOR mantıksal operatörğ ile 
--giriş bitlerinin toplanması halinde eldenin meydana gelmesi ise yine giriş bitlerinin AND operatörü ile işlemden geçmesi ile elde edilir.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity example is
port (
        clk : in std_logic;
        rst : in std_logic;
        a : in std_logic;
        b: in std_logic;
        sum : out std_logic;
        carry : out std_logic
);
end example;

architecture Behavioral of example is
 
begin
   process(clk,rst)
        
   begin
        if(rst = '1')then
           sum <= '0';
            carry <= '0';       
        elsif rising_edge(clk) then
            sum <= a XOR b;
            carry <= a and b;
        end if;
    end process; 
end Behavioral;
