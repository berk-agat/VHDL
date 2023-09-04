--8bitlik giriş verisini text dosyasına yazdıran VHDL tasarım
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use std.textio.all;

entity example is 
    port (
        clk: in std_logic;
        rst: in std_logic;
        giris: in std_logic_vector(7 downto 0);
        veri: out std_logic_vector(7 downto 0)
    );
end example;

architecture Behavioral of example is
    constant DOSYA_YOLU: string := "C:\Users\Aykut\Desktop\vhdl.txt";
begin
--Durumlar Saklayıcısı
    process(clk)
    file dosya: text open write_mode is DOSYA_YOLU;
    variable satir: line;
    variable data: integer;
    begin
        if rising_edge(clk) then
            data:= conv_integer(unsigned(giris));
            write(satir, data);
            writeline(dosya, satir);
            
        end if;
    end process;                      
end Behavioral;                    