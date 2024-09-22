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

entity jk_trigger is
    Port( 
        sb : in std_logic; 
        j : in std_logic;
        clk : in std_logic;
        k : in std_logic;
        rb : in std_logic;
        q : out std_logic;
        qb : out std_logic
        );
end jk_trigger;

architecture Behavioral of jk_trigger is
begin
    process(clk, sb, rb)
        variable tmp: std_logic;
    begin
        if clk='1' and clk'EVENT then
            if j='0' and k='0' then
                tmp:=tmp;
            elsif j='0' and k='1' then
                tmp:='0';
            elsif j='1' and k='0' then
                tmp:='1';
            elsif j='1' and k='1' then
                tmp:=not tmp;    
            end if;
        end if;
        if sb='0' then
            tmp:='1';
        elsif rb='0' then
            tmp:='0';
        end if;
        q<=tmp;
        qb<=not tmp;
    end process;    
end Behavioral;
