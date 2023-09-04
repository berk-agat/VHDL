-- Bir metin dosyasındaki tamsayı türünde bulunan verilerin tamamını okuyan VHDL tasarım. 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use std.textio.all;

entity example is 
    port (
        clk: in std_logic;
        rst: in std_logic;
        veri: out std_logic_vector(7 downto 0)
    );
end example;

architecture Behavioral of example is
    constant DOSYA_YOLU: string := "C:\Users\Aykut\Desktop\vhdl.txt";
    signal data_oku: std_logic_vector(7 downto 0) := (others => '0');
begin
--Durumlar Saklayıcısı
    process(clk)
    file dosya: text open read_mode is DOSYA_YOLU;
    variable satir: line;
    variable data: integer;
    begin
        if rising_edge(clk) then
            if not endfile(dosya) then
            readline(dosya, satir);
            read(satir, data);
            data_oku <= conv_std_logic_vector(data, data_oku'length);
            veri <= data_oku;
            end if;
        end if;
    end process;                      
end Behavioral;                    