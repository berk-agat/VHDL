 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;

entity example is
port (
        clk : in std_logic;
        rst : in std_logic;
        say1 : in std_logic_vector(5 downto 0);
        say2 : in std_logic_vector(5 downto 0);
        s_Mod : out std_logic_vector(3 downto 0);
        s_Rem : out std_logic_vector(3 downto 0)
);
end example;

architecture Behavioral of example is
 
begin
   process(clk,rst)
        variable s1,s2: integer;
   begin
        if(rst = '1')then
            s_Mod <= (others =>'0');
            s_Rem <= (others => '0');
        elsif rising_edge(clk) then
            s1 := conv_integer(signed(say1));
            s2 := conv_integer(signed(say2));
            s_Mod <= conv_std_logic_vector((s1 MOD s2), s_Mod'Length);
            s_Rem <= conv_std_logic_vector((s1 REM s2), s_Rem'Length);
        end if;
    end process; 
end Behavioral;
