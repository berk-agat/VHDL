 -- Liste türü niteliklerine örnek
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity example is
port (
        clk : in std_logic;
        rst : in std_logic
);
end example;

architecture Behavioral of example is
 type D is (BASLA, GORUNTU_AL, FILTRE, MORFOLOJI, TEMIZLE, BITIR);
   signal D_Pos : integer;
   signal D_Val, D_Leftof,D_Rightof,D_Succ,D_Pred : D;
begin
   process(clk,rst)
   begin
        if rising_edge(clk) then
        D_Pos <= D'Pos(FILTRE);  --çıktı 2 
        D_Val <= D'Val(1); --çıktı GORUNTU_AL
        D_Leftof <= D'Leftof(TEMIZLE); --çıktı MORFOLOJI
        D_Rightof <= D'Rightof(TEMIZLE); --çıktı BITIR
        D_Succ    <= D'Succ(FILTRE); --çıktı MORFOLOJI
        D_Pred    <= D'Pred(BITIR); -- çıktı TEMIZLE
        end if;
    end process; 
end Behavioral;
