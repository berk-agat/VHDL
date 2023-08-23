--Kombinasyone
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
 signal out_1, out_2 : std_logic;
begin
   out_1 <= (motor and kapi) and not (emniyet);
   out_2 <= motor and not (kapi);
   ikaz <= '0' WHEN rst = '1' 
   ELSE --koşullu sinyal atama
   out_1 or out_2; 
end Behavioral;
