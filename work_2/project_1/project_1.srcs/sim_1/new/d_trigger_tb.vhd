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
        sb: in std_logic;
        d: IN std_logic;
        clkb: IN std_logic;
        rb: in std_logic;
        q: OUT std_logic;
        qb: OUT std_logic
        );
    END COMPONENT;
    
    --Inputs
    signal sb: std_logic;
    signal d: std_logic;
    signal clkb: std_logic;
    signal rb: std_logic;
    
    --Outputs
    signal q: std_logic;
    signal qb: std_logic;
    
begin
    --Instantiate the Unit Under Test (UUT)
    uut: d_trigger PORT MAP(
        sb=>sb,
        d=>d,
        clkb=>clkb,
        rb=>rb,
        
        q=>q,
        qb=>qb
    );
    
    --Stimmulis process
    stim_proc: process
    begin
        --hold reset state for 100 ns.
        wait for 10 ps;
        
        --insert stimulus here
        for i_sb in 0 to 1 loop
            if i_sb = 0 then
                sb <= '0';
            else 
                sb <= '1';
            end if;
            for i_rb in 0 to 1 loop
                if i_rb = 0 then
                    rb <= '0';
                else 
                    rb <= '1';
                end if;
                for i_d in 0 to 1 loop
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
            end loop;    
        end loop;
        wait;
    end process;
end Behavioral;
