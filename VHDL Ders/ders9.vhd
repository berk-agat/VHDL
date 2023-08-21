--Tip dönüşümleri için örnek bir çalışma 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity example is
port (
        clk : in std_logic;
        rst : in std_logic;
        sec : in std_logic_vector(1 downto 0);
        say1 : in std_logic_vector(3 downto 0);
        say2 : in std_logic_vector(3 downto 0);
        sonuc : out std_logic_vector(7 downto 0) 
);
end example;

architecture Behavioral of example is
 
begin
   process(clk,rst)
        variable s1,s2,son: integer;
   begin
        if(rst = '1')then
            son := 0;
        elsif rising_edge(clk) then
            s1 := conv_integer(signed(say1));
            s2 := conv_integer(signed(say2));
            case sec is   
                when "01" => son := s1 * s2;
                when "10" => son := s1 + s2; 
                when "11" => son := s1 - s2;
                when others => null;
            end case;
        end if;
        sonuc <= conv_std_logic_vector(son, sonuc'length);
    end process; 
end Behavioral;
