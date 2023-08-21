--  4 bitlik iki adet giriş sinyalini  8 bitlik ve 4 bitlik iki ayrı çıkışta birleştiren tasarım.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity example is
port (
        clk : in std_logic;
        rst : in std_logic;
        in1 : in std_logic_vector(3 downto 0);
        in2: in std_logic_vector(3 downto 0);
        out1_8b : out std_logic_vector(7 downto 0);
        out2_4b : out std_logic_vector(3 downto 0)
);
end example;

architecture Behavioral of example is
 
begin
   process(clk,rst)
        
   begin
        if(rst = '1')then
           out1_8b <= (others =>'0');
            out2_4b <= (others => '0');       
        elsif rising_edge(clk) then
            out1_8b <= in1 & in2;
            out2_4b <=in1(3) & in2(2 downto 0);
        end if;
    end process; 
end Behavioral;
