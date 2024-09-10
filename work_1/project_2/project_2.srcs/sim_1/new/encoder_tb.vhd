----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/09/2024 05:25:53 PM
-- Design Name: 
-- Module Name: encoder_tb - logic_operators
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

entity encoder_tb is
--  Port ( );
end encoder_tb;

architecture sequential_operators of encoder_tb is  
   -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT encoder_d
    PORT(
        E1: IN std_logic;
        X0: IN std_logic;
        X1: IN std_logic;
        X2: IN std_logic;
        X3: IN std_logic;
        X4: IN std_logic;
        X5: IN std_logic;
        X6: IN std_logic;
        X7: IN std_logic;
        EO: OUT std_logic;
        GS: OUT std_logic;
        Y0: OUT std_logic;
        Y1: OUT std_logic;
        Y2: OUT std_logic
        );
    END COMPONENT;
    
    --Inputs
    signal E1: std_logic;
    signal X0: std_logic;
    signal X1: std_logic;
    signal X2: std_logic;
    signal X3: std_logic;
    signal X4: std_logic;
    signal X5: std_logic;
    signal X6: std_logic;
    signal X7: std_logic;
    
    --Outputs
    signal EO: std_logic;
    signal GS: std_logic;
    signal Y0: std_logic;
    signal Y1: std_logic;
    signal Y2: std_logic;
    
begin
    --Instantiate the Unit Under Test (UUT)
    uut: encoder_d PORT MAP(
        E1 => E1,
        X0 => X0,
        X1 => X1,
        X2 => X2,
        X3 => X3,
        X4 => X4,
        X5 => X5,
        X6 => X6,
        X7 => X7,

        EO => EO,
        GS => GS,
        Y0 => Y0,
        Y1 => Y1,
        Y2 => Y2
    );
    
    --Stimmulis process
    stim_proc: process
    begin
        --hold reset state for 100 ns.
        wait for 10 ps;
        
        --insert stimulus here
        for i_e1 in 0 to 2 loop
            if i_e1 = 0 then
                E1 <= '0';
            else 
                E1 <= '1';
            end if;
            for i_x0 in 0 to 1 loop
                if i_x0 = 0 then
                    X0 <= '0';
                else 
                    X0 <= '1';
                end if;
                for i_x1 in 0 to 1 loop
                    if i_x1 = 0 then
                        X1 <= '0';
                    else 
                        X1 <= '1';
                    end if;
                    for i_x2 in 0 to 1 loop
                        if i_x2 = 0 then
                            X2 <= '0';
                        else 
                            X2 <= '1';
                        end if;
                        for i_x3 in 0 to 1 loop
                            if i_x3 = 0 then
                                X3 <= '0';
                            else 
                                X3 <= '1';
                            end if;
                            for i_x4 in 0 to 1 loop
                                if i_x4 = 0 then
                                    X4 <= '0';
                                else 
                                    X4 <= '1';
                                end if;
                                for i_x5 in 0 to 1 loop
                                    if i_x5 = 0 then
                                        X5 <= '0';
                                    else 
                                        X5 <= '1';
                                    end if;
                                    for i_x6 in 0 to 1 loop
                                        if i_x6 = 0 then
                                            X6 <= '0';
                                        else 
                                            X6 <= '1';
                                        end if;
                                        for i_x7 in 0 to 1 loop
                                            if i_x7 = 0 then
                                                X7 <= '0';
                                            else
                                                X7 <= '1';
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
        wait;
    end process;

end sequential_operators;
