----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2024 10:39:03 PM
-- Design Name: 
-- Module Name: AC701 - Behavioral
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

entity AC701 is
Port ( 
       ledsmain: out std_logic_vector(3 downto 0);     --светодиоды
       ledboard: out std_logic;    --светодиоды
       pushbuttons:in std_logic_vector(4 downto 0);    --кнопки
       dipswitch:in std_logic_vector(3 downto 0);      --переключатели
       sysclk_p:in std_logic;                          --принимают дифф тактовый сигнал???
       sysclk_n:in std_logic
       );
end AC701;

architecture Behavioral of AC701 is
    Component sn74ls697 is 
    Port ( 
           gb : in STD_LOGIC;
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
    end Component;
    
    component ibufds            
        port (
            I, IB : in std_logic;   --
            O     : out std_logic); --
    end Component;
        
    component clk_div is
    port (
                clk_in  : in std_logic;
                clk_out : out std_logic);
    end Component;
    
    signal zero: std_logic := '0';
    
    signal clk_no_div: std_logic;
    signal rck_no_div: std_logic;
--    signal clk_divided: std_logic;
--    signal rck_divided: std_logic;
    
    
    signal outputs: std_logic_vector(3 downto 0);
    
begin
    counter: sn74ls697
    Port Map (
        gb => dipswitch(0),
        r_cb => dipswitch(1),
        u_db => dipswitch(2),
        loadb => dipswitch(3),
        
        
--        cck => clk_divided,
--        rck => rck_divided,

        cck => clk_no_div,
        rck => rck_no_div,
        
        enpb => zero,
        entb => zero,
        
        cclrb => pushbuttons(0),
        
        xa => pushbuttons(1),
        xb => pushbuttons(2),
        xc => pushbuttons(3),
        xd => pushbuttons(4),
        
        ya => outputs(0),
        yb => outputs(1),
        yc => outputs(2),
        yd => outputs(3),
        rcob => ledboard
    );
    
    buff: ibufds
    Port Map (
        I => sysclk_p, 
        IB=> sysclk_n,
        O => clk_no_div
    );
    
--    divider_uut: clk_div
--    Port Map (
--        clk_in => clk_no_div,
--        clk_out => clk_divided
--    );
    
--    rck_divided <= not clk_divided; 
    
    rck_no_div <= not clk_no_div; 
    
    ledsmain <= outputs;


end Behavioral;

