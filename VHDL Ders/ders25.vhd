-- Çamaşır Makinesi çalışma aşmalarını simüle edenen sonlu durum makine tasarımı 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity example is 
    port (
        clk: in std_logic;
        rst: in std_logic;
        durula_biti: in std_logic
    );
end example;

architecture Behavioral of example is
    --Sonlu durum makinesi tanımlaması
    type FSM_Durumlar is (BOSTA, BASLA, YIKA, DURULA, SIKMA, BITIR);
    signal simdi: FSM_Durumlar := BOSTA;
    signal sonraki: FSM_Durumlar;
    signal sayici: natural  := 0;
    signal durum_biti: std_logic := '0';
begin
--Durumlar Saklayıcısı
    process(clk,rst)
    begin
        if (rst='1') then
        simdi <= BOSTA;
        elsif(rising_edge(clk)) then
            if durum_biti = '1' then 
            simdi <= sonraki;
            end if;
        end if;
    end process;    
    
    --Kombinasyonel Devre
    process(clk)
    begin
        case simdi is 
            when BOSTA => --3 cycle
                sonraki <= BASLA;
                if sayici > 2 then
                    durum_biti <= '1';
                else 
                    durum_biti <= '0';
                end if;
            
            when BASLA => --3 cycle
                if  durula_biti = '1' then
                    sonraki <= DURULA;
                else 
                sonraki <= YIKA;
                end if;
                if sayici > 2 then
                    durum_biti <= '1';
                else
                    durum_biti <= '0';
                end if;
                
            when YIKA => --5 cycle
                sonraki <= DURULA;
                if sayici > 4 then
                    durum_biti <= '1';
                else 
                    durum_biti <= '0';
                end if;
                
            when DURULA => --5 cycle
                sonraki <= SIKMA;
                if sayici > 4 then
                    durum_biti <= '1';
                else 
                    durum_biti <= '0';
                end if;
                
            when SIKMA => -- 7 cycle
                sonraki <= BITIR;    
                if sayici > 6 then
                    durum_biti <= '1';
                else
                    durum_biti <= '0';
                end if;
                
            when BITIR => -- 3 cycle
                sonraki <= BOSTA;   
                if sayici > 2 then 
                    durum_biti <= '1';
                else 
                    durum_biti <= '0';
                end if;
         end case;
    end process;        
    
    process(clk,rst)
    begin 
        if rst='1' then
            sayici <= 0;
        elsif rising_edge(clk) then
            if durum_biti = '0' then
            sayici <= sayici + 1;
            else 
            --durum biti 1 ise 
            sayici <= 0;
            end if;
        end if;
    end process;                
end Behavioral;                    