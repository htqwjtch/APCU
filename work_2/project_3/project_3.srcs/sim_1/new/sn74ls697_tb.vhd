----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2024 12:02:10 PM
-- Design Name: 
-- Module Name: sn74ls697_tb - Behavioral
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

entity sn74ls697_tb is
--  Port ( );
end sn74ls697_tb;

architecture Behavioral of sn74ls697_tb is
COMPONENT sn74ls697
    Port ( gb : in STD_LOGIC;
       r_cb : in STD_LOGIC;
       rck : in STD_LOGIC;
       cclrb : in STD_LOGIC;
       u_db : in STD_LOGIC;
       loadb : in STD_LOGIC;
       enpb : in STD_LOGIC;
       entb : in STD_LOGIC;
       cck : in STD_LOGIC;
       xa : in std_logic;
       xb : in std_logic;
       xc : in std_logic;
       xd : in std_logic;
       ya : out std_logic;
       yb : out std_logic;
       yc : out std_logic;
       yd : out std_logic;
       rcob: out std_logic  
       );
    END COMPONENT;
    
    --Inputs
    signal gb: std_logic;
    signal r_cb: std_logic;
    signal rck: std_logic;
    signal cclrb: std_logic;
    signal u_db: std_logic;
    signal loadb: std_logic;
    signal enpb: std_logic;
    signal entb: std_logic;
    signal cck: std_logic;
    signal xa: std_logic;
    signal xb: std_logic;
    signal xc: std_logic;
    signal xd: std_logic;
    
    --Outputs
    signal ya: std_logic;
    signal yb: std_logic;
    signal yc: std_logic;
    signal yd: std_logic;
    signal rcob: std_logic;
    
begin
    --Instantiate the Unit Under Test (UUT)
    uut: sn74ls697 PORT MAP(
        gb=>gb,
        r_cb=>r_cb, 
        rck=>rck,
        cclrb=>cclrb,
        u_db=>u_db,
        loadb=>loadb,
        enpb=>enpb,
        entb=>entb,
        cck=>cck,
        xa=>xa,
        xb=>xb,
        xc=>xc,
        xd=>xd,
           
        ya=>ya,
        yb=>yb,
        yc=>yc,
        yd=>yd,
        rcob=>rcob  
    );
    
    --Stimmulis process
    stim_proc: process
    begin
        --hold reset state for 100 ns.
        wait for 10 ps;
        
        --insert stimulus here
        for i_gb in 0 to 1 loop
            if i_gb = 0 then
                gb <= '0';
            else 
                gb <= '1';
            end if;
            for i_r_cb in 0 to 1 loop
                if i_r_cb = 0 then
                    r_cb <= '0';
                else 
                    r_cb <= '1';
                end if;
                for i_rck in 0 to 1 loop
                    if i_rck = 0 then
                        rck <= '0';
                    else 
                        rck <= '1';
                    end if;
                    for i_cclrb in 0 to 1 loop
                        if i_cclrb = 0 then
                            cclrb <= '0';
                        else 
                            cclrb <= '1';
                        end if;
                        for i_u_db in 0 to 1 loop
                            if i_u_db = 0 then
                                u_db <= '0';
                            else 
                                u_db <= '1';
                            end if;
                            for i_loadb in 0 to 1 loop
                                if i_loadb = 0 then
                                    loadb <= '0';
                                else 
                                    loadb <= '1';
                                end if;
                                for i_enpb in 0 to 1 loop
                                    if i_enpb = 0 then
                                        enpb <= '0';
                                    else 
                                        enpb <= '1';
                                    end if;
                                    for i_entb in 0 to 1 loop
                                        if i_entb = 0 then
                                            entb <= '0';
                                        else 
                                            entb <= '1';
                                        end if;
                                        for i_xa in 0 to 1 loop
                                            if i_xa = 0 then
                                                xa <= '0';
                                            else 
                                                xa <= '1';
                                            end if;
                                            for i_xb in 0 to 1 loop
                                                if i_xb = 0 then
                                                    xb <= '0';
                                                else 
                                                    xb <= '1';
                                                end if;
                                                for i_xc in 0 to 1 loop
                                                    if i_xc = 0 then
                                                        xc <= '0';
                                                    else 
                                                        xc <= '1';
                                                    end if;
                                                    for i_xd in 0 to 1 loop
                                                        if i_xd = 0 then
                                                            xd <= '0';
                                                        else 
                                                            xd <= '1';
                                                        end if;
                                                        for i_cck in 0 to 1 loop
                                                            if i_cck = 0 then
                                                                cck <= '0';
                                                            else 
                                                                cck <= '1';
                                                            end if;
                                                            wait for 10 ps;
                                                        end loop;
                                                    end loop;
                                                end loop;
                                            end loop;
                                        end loop;
                                    end loop;
                                end loop;
                            end loop;
                        end loop;
                    end loop;
                end loop;
            end loop;
        end loop;
        wait;
    end process;


end Behavioral;
