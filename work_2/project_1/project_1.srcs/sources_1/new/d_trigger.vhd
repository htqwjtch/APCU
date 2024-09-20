----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2024 08:12:33 PM
-- Design Name: 
-- Module Name: d_trigger - Behavioral
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

entity d_trigger is
    Port ( d : in STD_LOGIC;
           clkb : in STD_LOGIC;
           qb : out STD_LOGIC);
end d_trigger;

architecture Behavioral of d_trigger is
begin
    process(clkb)
    begin
        if clkb='0' and clkb'EVENT then
            qb<=not d;
        end if;
    end process;
end Behavioral;
