----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2024 08:25:33 PM
-- Design Name: 
-- Module Name: d_trigger_tb - Behavioral
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

entity d_trigger_tb is
--  Port ( );
end d_trigger_tb;

architecture Behavioral of d_trigger_tb is
COMPONENT d_trigger
    PORT(
        d: IN std_logic;
        clkb: IN std_logic;
        qb: OUT std_logic
        );
    END COMPONENT;
    
    --Inputs
    signal d: std_logic;
    signal clkb: std_logic;
    
    --Outputs
    signal qb: std_logic;
    
begin
    --Instantiate the Unit Under Test (UUT)
    uut: d_trigger PORT MAP(
        d=>d,
        clkb=>clkb,
        
        qb=>qb
    );
    
    --Stimmulis process
    stim_proc: process
    begin
        --hold reset state for 100 ns.
        wait for 10 ps;
        
        --insert stimulus here
        for i_d in 0 to 2 loop
            if i_d = 0 then
                d <= '0';
            else 
                d <= '1';
            end if;
            for i_clkb in 0 to 1 loop
                if i_clkb = 0 then
                    clkb <= '0';
                else 
                    clkb <= '1';
                end if;
                wait for 10 ps;
            end loop;
        end loop;
        wait;
    end process;
end Behavioral;
