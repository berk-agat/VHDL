--  4 bitlik bir giriş sinyalini 2 bitlik diğer bir giriş sinyalinin üssü şeklinde ifade eden, eğer giriş taban sinyali negatif ise 
-- ABS operatörüyle sayıyı pozitife çeviren ve çıkışta ABS operatörünün kullanıulıp kullanılmadığını bir çıkış sinyalı ile ifade eden tasarım.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity example is
port (
        clk : in std_logic;
        rst : in std_logic;
        taban : in std_logic_vector(3 downto 0);
        us : in std_logic_vector(1 downto 0);
        sonuc : out std_logic_vector(15 downto 0);
        abs_mi : out std_logic
);
end example;

architecture Behavioral of example is
 
begin
   process(clk,rst)
        variable tbn, u: integer;
        variable abs_kullan : std_logic :='0';
   begin
        if(rst = '1')then
            sonuc <= (others =>'0');
            abs_mi <= '0';       
        elsif rising_edge(clk) then
            tbn := conv_integer(signed(taban));
            u := conv_integer(unsigned(us));
            if (tbn < 0)then
            tbn:= ABS(tbn);
            abs_kullan := '1';
            else 
            abs_kullan := '0';
            end if;
            abs_mi <= abs_kullan;
            sonuc <= conv_std_logic_vector((tbn**u), sonuc'length);
        end if;
    end process; 
end Behavioral;
