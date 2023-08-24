library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity example is
    
port (
        clk : in std_logic;
        rst : in std_logic;
        in1 : in std_logic_vector(3 downto 0);
        out1 : out std_logic_vector(7 downto 0)
        
);
end example;

architecture Behavioral of example is
       
begin
    process(clk,rst)
    variable i: integer range 0 to 9;
    variable x: std_logic_vector(7 downto 0);
    variable y: std_logic_vector(7 downto 0) := "10101010";
begin 
    if rst = '1' then 
        out1  <= (others => 'U');
    elsif rising_edge(clk) then
        i := 4;
        x := in1 & "0000";
        tekrar: loop
            i := i - 1;
            if in1(i) = '1' then
                x(i) := '0';
            else
                x(i) := '1';
            end if;
            exit tekrar when i = 0;
        end loop tekrar;
        x := x XNOR y;
        end if;     
    out1 <= x; -- 0 ise çift, 1 ise tek       
   end process;
end Behavioral;
