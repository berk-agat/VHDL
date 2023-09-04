--8 adet 8 bitlik veri girilebilecek RAM dizisi oluşturarak bu ram dizisine yazma ve okuma işlemi
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity example is 
Generic(
    bits: integer := 8; --8bit veri
    adr_bits: integer := 3 --veri sayısı 
);
    port (
        clk: in std_logic;
        rst: in std_logic;
        aktif: in std_logic;
        yaz_oku: in std_logic;
        adres: in std_logic_vector(adr_bits-1 downto 0); --16 adet veri
        gir: in std_logic_vector(bits-1 downto 0); --8 bit veri
        cik: out std_logic_vector(bits-1 downto 0) --8 bit veri
    );
end example;

architecture Behavioral of example is
    type memory is ARRAY(0 to 2**adr_bits-1) of std_logic_vector(7 downto 0);
    --rom bellek verileri dolduruluyor
    signal blokRAM: memory;
    begin
        process(clk, rst)
        begin 
        if rst='1' then
           blokRAM <= (others => (others => '0'));
        elsif rising_edge(clk) then
            if aktif = '0' then
                cik <= (others => 'Z');
            elsif aktif = '1' then
                if yaz_oku = '0' then --okuma işlemi
                    cik <= blokRAM(conv_integer(adres));
                elsif yaz_oku = '1' then
                    blokRAM(conv_integer(adres)) <= gir;
                end if;
            end if; 
        end if;
        end process;
end Behavioral;                    