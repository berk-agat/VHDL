 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity example is
port (
        clk : in std_logic;
        rst : in std_logic;
        say1 : in std_logic_vector(5 downto 0);
        say2 : in std_logic_vector(5 downto 0);
        top : out std_logic_vector(7 downto 0);
        fark : out std_logic_vector(7 downto 0);
        carp : out std_logic_vector(11 downto 0);
        bol : out std_logic_vector(7 downto 0) 
);
end example;

architecture Behavioral of example is
 
begin
   process(clk,rst)
        variable s1,s2: integer;
   begin
        if(rst = '1')then
            top <= (others =>'0');
            fark <= (others => '0');
            carp <= (others => '0');
            bol <= (others => '0');
        elsif rising_edge(clk) then
            s1 := conv_integer(signed(say1));
            s2 := conv_integer(signed(say2));
            top <= conv_std_logic_vector((s1+s2), top'length);
            fark <= conv_std_logic_vector((s1-s2), fark'length);
            carp <= conv_std_logic_vector((s1*s2), carp'length);
            bol <= conv_std_logic_vector((s1/s2), bol'length);
        end if;
    end process; 
end Behavioral;
