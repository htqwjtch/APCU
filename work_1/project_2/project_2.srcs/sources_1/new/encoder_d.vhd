----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/10/2024 11:46:28 AM
-- Design Name: 
-- Module Name: encoder_d - sequential_operators
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

entity encoder_d is
    Port (E1 : in STD_LOGIC;
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
end encoder_d;

architecture sequential_operators of encoder_d is

begin
    process(E1, X0, X1, X2, X3, X4, X5, X6, X7)
    begin
        if E1 = '0' then
            if (X0 = '1' AND X1 = '1' AND X2 = '1' AND X3 = '1' AND X4 = '1'AND X5 = '1' AND X6 = '1' AND X7 = '1') then
                EO <= '0';
                GS <= '1';
                Y0 <= 'Z';
                Y1 <= 'Z';
                Y2 <= 'Z';
            end if;
            if (X7 = '0') then
                EO <= '1';
                GS <= '0';
                Y0 <= '0';
                Y1 <= '0';
                Y2 <= '0';
            end if;
            if (X7 = '0' AND X6 = '0') then
                EO <= '1';
                GS <= '0';
                Y0 <= '1';
                Y1 <= '0';
                Y2 <= '0';   
            end if;
            if (X7 = '1' AND X6 = '1' AND X5 = '0') then
                EO <= '1';
                GS <= '0';
                Y0 <= '0';
                Y1 <= '1';
                Y2 <= '0';   
            end if; 
            if (X7 = '1' AND X6 = '1' AND X5 = '1' AND X4 = '0') then
                EO <= '1';
                GS <= '0';
                Y0 <= '1';
                Y1 <= '1';
                Y2 <= '0'; 
            end if; 
            if (X7 = '1' AND X6 = '1' AND X5 = '1' AND X4 = '1' AND X3 = '0') then
                EO <= '1';
                GS <= '0';
                Y0 <= '0';
                Y1 <= '0';
                Y2 <= '1';
            end if;                     
            if (X7 = '1' AND X6 = '1' AND X5 = '1' AND X4 = '1' AND X3 = '1' AND X2 = '0') then
                EO <= '1';
                GS <= '0';
                Y0 <= '1';
                Y1 <= '0';
                Y2 <= '1';
            end if;
            if (X7 = '1' AND X6 = '1' AND X5 = '1' AND X4 = '1' AND X3 = '1' AND X2 = '1' AND X1 = '0') then
                EO <= '1';
                GS <= '0';
                Y0 <= '0';
                Y1 <= '1';
                Y2 <= '1';
            end if;
            if (X7 = '1' AND X6 = '1' AND X5 = '1' AND X4 = '1' AND X3 = '1' AND X2 = '1' AND X1 = '1' AND X0 = '0') then
                EO <= '1';
                GS <= '0';
                Y0 <= '1';
                Y1 <= '1';
                Y2 <= '1';
            end if;
        elsif E1 = '1' then
            EO <= '1';
            GS <= '1';
            Y0 <= 'Z';
            Y1 <= 'Z';
            Y2 <= 'Z';
        end if;
    end process;

end sequential_operators;
