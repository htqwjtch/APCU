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
    Port( 
        sb: in STD_LOGIC;
        d: in std_logic;
        clkb: in STD_LOGIC;
        rb: in std_logic;
        q : out std_logic;
        qb : out STD_LOGIC
        );
end d_trigger;

architecture Behavioral of d_trigger is
   Component jk_trigger 
   Port( 
        sb: in std_logic;
        j: in std_logic;
        clk: in std_logic;
        k: in std_logic;
        rb: in std_logic;
        q: out std_logic;
        qb: out std_logic
      );
    end Component;
    
    signal not_d: std_logic;
    signal not_clkb: std_logic;
    
begin
    not_d<=not d;
    not_clkb<=not clkb;
    d_tr: jk_trigger Port Map (
        sb=>sb,
        j=>d,
        k=>not_d,
        clk=>not_clkb,
        rb=>rb,
        q=>q,
        qb=>qb 
    );
    process(clkb, sb, rb)
        variable tmp: std_logic;
    begin 
        if clkb='0' and clkb'EVENT then
            tmp:=d;
        end if;
        if rb='0' then
            tmp:='0';
        elsif sb='0' then
            tmp:='1';  
        end if;
        q<=tmp;
        qb<=not tmp;
    end process;       
end Behavioral;
