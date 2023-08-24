library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all; 

entity example is
    generic (n : natural := 4 );
port (
        clk : in std_logic;
        rst : in std_logic;
        s1 : in std_logic_vector(n-1 downto 0);
        s2 : in std_logic_vector(n-1 downto 0);
        elde  : out std_logic;
        top : out std_logic_vector(n-1 downto 0)
);
end example;

architecture Behavioral of example is
         signal ara : std_logic_vector(n downto 0);
begin
    process(clk,rst)
    begin 
        if rst= '1' then
            elde <= 'X';
            top <= (others => '0');
        elsif rising_edge(clk) then
        ara <= ('0' & s1) + ('0' & s2);
        top <= ara(n-1 downto 0);
        elde <= ara(n);                              
        end if;
   end process;
end Behavioral;
