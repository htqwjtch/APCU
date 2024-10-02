----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/09/2024 05:20:14 PM
-- Design Name: 
-- Module Name: encoder_d - logic_operators
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity encoder is
    Port ( E1 : in STD_LOGIC;
           X0 : in STD_LOGIC;
           X1 : in STD_LOGIC;
           X2 : in STD_LOGIC;
           X3 : in STD_LOGIC;
           X4 : in STD_LOGIC;
           X5 : in STD_LOGIC;
           X6 : in STD_LOGIC;
           X7 : in STD_LOGIC;
           EO : out STD_LOGIC;
           GS : out STD_LOGIC;
           Y0 : out STD_LOGIC;
           Y1 : out STD_LOGIC;
           Y2 : out STD_LOGIC);
end encoder;

architecture Behavioral of encoder is
    signal and_not_0: std_logic;
    
    signal and_0: std_logic;
    
    signal and_1: std_logic;
    signal and_2: std_logic;
    signal and_3: std_logic;
    signal and_4: std_logic;
    
    signal and_5: std_logic;
    signal and_6: std_logic;
    signal and_7: std_logic;
    signal and_8: std_logic;
    
    signal and_9: std_logic;
    signal and_10: std_logic;
    signal and_11: std_logic;    
    signal and_12: std_logic;
    
begin
    and_not_0 <= not ((not E1) and X0 and X1 and X2 and X3 and X4 and X5 and X6 and X7);
    EO <= and_not_0;
    
    and_0 <= (not E1) and and_not_0;
    GS <= not and_0;
    
    and_1 <= (not X1) and X2 and X4 and X6 and and_0;
    and_2 <= (not X3) and X4 and X6 and and_0;
    and_3 <= (not X5) and X6 and and_0;
    and_4 <= (not X7) and and_0;
    
    Y0 <= 'Z' when and_0='0' else  not (and_1 or and_2 or and_3 or and_4);
    
    and_5 <= (not X2) and X4 and X5 and and_0;
    and_6 <= (not X3) and X4 and X5 and and_0;
    and_7 <= (not X6) and and_0;
    and_8 <= (not X7) and and_0;
    
    Y1 <= 'Z' when and_0='0' else not (and_5 or and_6 or and_7 or and_8);
    
    and_9 <= (not X4) and and_0;
    and_10 <= (not X5) and and_0;
    and_11 <= (not X6) and and_0;
    and_12 <= (not X7) and and_0;
    
    Y2 <= 'Z' when and_0='0' else not (and_9 or and_10 or and_11 or and_12);

end Behavioral;

architecture Standard of encoder is

begin
    process(E1, X0, X1, X2, X3, X4, X5, X6, X7)
    begin
        if E1 = '0' then
            if X7 = '1' then
                if X6 = '1' then
                    if X5 = '1' then
                        if X4 = '1' then
                            if X3 = '1' then
                                if X2 = '1' then
                                    if X1 = '1' then
                                        if X0 = '1' then
                                            EO <= '0';
                                            GS <= '1';
                                            Y0 <= 'Z';
                                            Y1 <= 'Z';
                                            Y2 <= 'Z';
                                        elsif X0 = '0' then
                                            EO <= '1';
                                            GS <= '0';
                                            Y0 <= '1';
                                            Y1 <= '1';
                                            Y2 <= '1';
                                        end if;
                                    elsif X1 = '0' then
                                        EO <= '1';
                                        GS <= '0';
                                        Y0 <= '0';
                                        Y1 <= '1';
                                        Y2 <= '1';
                                    end if;
                                elsif X2 = '0' then
                                    EO <= '1';
                                    GS <= '0';
                                    Y0 <= '1';
                                    Y1 <= '0';
                                    Y2 <= '1';
                                end if;
                            elsif X3 = '0' then
                                EO <= '1';
                                GS <= '0';
                                Y0 <= '0';
                                Y1 <= '0';
                                Y2 <= '1';
                            end if;
                        elsif X4 = '0' then
                            EO <= '1';
                            GS <= '0';
                            Y0 <= '1';
                            Y1 <= '1';
                            Y2 <= '0'; 
                        end if;
                    elsif X5 = '0' then
                        EO <= '1';
                        GS <= '0';
                        Y0 <= '0';
                        Y1 <= '1';
                        Y2 <= '0'; 
                    end if;
                elsif X6 = '0' then
                    EO <= '1';
                    GS <= '0';
                    Y0 <= '1';
                    Y1 <= '0';
                    Y2 <= '0'; 
                end if;
            elsif X7 = '0' then
                EO <= '1';
                GS <= '0';
                Y0 <= '0';
                Y1 <= '0';
                Y2 <= '0';  
            end if;
        elsif E1 = '1' then                            
            EO <= '1';
            GS <= '1';
            Y0 <= 'Z';
            Y1 <= 'Z';
            Y2 <= 'Z';
        end if;                 
    end process;

end Standard;
