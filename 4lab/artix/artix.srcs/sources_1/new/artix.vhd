----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.10.2024 09:16:14
-- Design Name: 
-- Module Name: artix - Behavioral
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

entity artix is
    Port(
        ledsmain: out std_logic_vector(3 downto 0);     --светодиоды
        ledsboard: out std_logic_vector(3 downto 0);    --светодиоды
        pushbuttons:in std_logic_vector(4 downto 0);    --кнопки
        dipswitch:in std_logic_vector(3 downto 0);      --переключатели
        sysclk_p:in std_logic;                          --принимают дифф тактовый сигнал???
        sysclk_n:in std_logic
    );
end artix;

architecture Behavioral of artix is
    Component shift is 
    Port ( 
        control_s: in std_logic_vector(1 downto 0);
        serial_left: in std_logic;
        serial_right: in std_logic;
        parallel_data: in std_logic_vector(3 downto 0);
        clk: in std_logic;
        clear: in std_logic;
        output: out std_logic_vector(3 downto 0)
    );
    end Component;
   
    component ibufds            
    port (
        I, IB : in std_logic;   --
        O     : out std_logic); --
    end Component;
        
    component clk_div is    --делитель частоты
    port (
        clk_in  : in std_logic;
        clk_out : out std_logic);
    end Component;

    signal control_s: std_logic_vector(1 downto 0) := "01";
--    signal serial_left: std_logic;
--    signal serial_right: std_logic;
--    signal parallel_data: std_logic_vector(3 downto 0);
--    signal clk: std_logic;
    signal clear: std_logic := '1';
    signal output: std_logic_vector(3 downto 0);
    
    signal clk_no_div: std_logic;
    signal clk_divided: std_logic;
begin

    shift_uut: shift
    Port Map (
        control_s => control_s,
        serial_left => pushbuttons(0),
        serial_right => pushbuttons(1),
        parallel_data => dipswitch(3 downto 0),
        clk => clk_divided,
        clear => clear,
        output => output
    );
    
    clear <= pushbuttons(4);
    control_s <= pushbuttons(3 downto 2);
    
    buff: ibufds
    Port Map (
        I => sysclk_p, 
        IB=> sysclk_n,
        O => clk_no_div
    );
    
    divider_uut: clk_div
    Port Map (
        clk_in => clk_no_div,
        clk_out => clk_divided
    );
    
    ledsmain <= output;
    
end Behavioral;
