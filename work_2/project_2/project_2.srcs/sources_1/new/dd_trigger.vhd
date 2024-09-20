----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2024 09:07:48 PM
-- Design Name: 
-- Module Name: dd_trigger - Behavioral
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


library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dd_trigger is
    Port ( d : in STD_LOGIC;
           clkb : in STD_LOGIC;
           rb : in STD_LOGIC;
           q : out STD_LOGIC;
           qb : out STD_LOGIC);
end dd_trigger;

architecture Behavioral of dd_trigger is
begin
    process(clkb, rb)
    begin
        if clkb='0' and clkb'event then
            q<=d;
            qb<=not d;
        end if;
        if rb='0' then
            q<='0';
            qb<='1';
        end if;
    end process;    
end Behavioral;
