----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2024 08:27:21 AM
-- Design Name: 
-- Module Name: dd_trigger_tb - Behavioral
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

entity jk_trigger_tb is
--  Port ( );
end jk_trigger_tb;

architecture Behavioral of jk_trigger_tb is
COMPONENT jk_trigger
    PORT(
        sb : in std_logic; 
        j : in std_logic;
        clk : in std_logic;
        k : in std_logic;
        rb : in std_logic;
        q : out std_logic;
        qb : out std_logic
        );
    END COMPONENT;
    
    --Inputs
    signal sb: std_logic;
    signal j: std_logic;
    signal clk: std_logic;
    signal k: std_logic;
    signal rb: std_logic;
    
    --Outputs
    signal q: std_logic;
    signal qb: std_logic;
    
begin
    --Instantiate the Unit Under Test (UUT)
    uut: jk_trigger PORT MAP(
        sb=>sb,
        j=>j,
        clk=>clk,
        k=>k,
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
                for i_j in 0 to 1 loop
                    if i_j = 0 then
                        j <= '0';
                    else 
                        j <= '1';
                    end if;
                    for i_k in 0 to 1 loop
                        if i_k = 0 then
                            k <= '0';
                        else 
                            k <= '1';
                        end if;
                        for i_clk in 0 to 1 loop
                            if i_clk = 0 then
                                clk <= '0';
                            else 
                                clk <= '1';
                            end if;
                            wait for 10 ps;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
        wait;
    end process;

end Behavioral;
