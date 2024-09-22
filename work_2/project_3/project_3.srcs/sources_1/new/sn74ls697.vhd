----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2024 08:58:57 AM
-- Design Name: 
-- Module Name: sn74ls697 - Behavioral
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

entity sn74ls697 is
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
end sn74ls697;
    
architecture Behavioral of sn74ls697 is
    Component d_trigger 
    Port(
        sb: in std_logic; 
        d: in std_logic;
        clkb: in std_logic;
        rb: in std_logic;
        q: out std_logic;
        qb: out std_logic
      );
    end Component;
    
    signal not_gb: std_logic;
    signal not_and: std_logic;
    
    signal and1: std_logic;
    signal and2: std_logic;
    signal and3: std_logic;
    signal and4: std_logic;
    signal and5: std_logic;
    signal and6: std_logic;
    signal and7: std_logic;
    signal and8: std_logic;
    signal and9: std_logic;
    signal and10: std_logic;
    signal and11: std_logic;
    signal and12: std_logic;
    signal and13: std_logic;
    signal and14: std_logic;
    signal and15: std_logic;
    signal and16: std_logic;
    signal and17: std_logic;
    signal and18: std_logic;
    signal and19: std_logic;
    signal and20: std_logic;
    signal and21: std_logic;
    signal and22: std_logic;
    signal and23: std_logic;
    signal and24: std_logic;
    
    signal or_not1: std_logic;
    signal or_not2: std_logic;
    signal or_not3: std_logic;
    signal or_not4: std_logic;
    signal or_not5: std_logic;
    signal or_not6: std_logic;
    signal or_not7: std_logic;
    signal or_not8: std_logic;
    signal or_not9: std_logic;
    signal or_not10: std_logic;
    signal or_not11: std_logic;
    signal or_not12: std_logic;
    signal or_not13: std_logic;
    signal or_not14: std_logic;
    signal or_not15: std_logic;
    signal or_not16: std_logic;
    
    signal not_or1: std_logic;
    signal not_or2: std_logic;
    signal not_or3: std_logic;
    
    signal and_not: std_logic;
    
    signal zero: std_logic:='0';
    signal rb: std_logic;
    signal clkb1: std_logic;
    signal clkb2: std_logic;
    
    signal qdd1: std_logic;
    signal qdd2: std_logic;
    signal qdd3: std_logic;
    signal qdd4: std_logic;
    signal qbdd1: std_logic;
    signal qbdd2: std_logic;
    signal qbdd3: std_logic;
    signal qbdd4: std_logic;
    
    signal qbd1: std_logic;
    signal qbd2: std_logic;
    signal qbd3: std_logic;
    signal qbd4: std_logic;
    
    signal zor_not1: std_logic;
    signal zor_not2: std_logic;
    signal zor_not3: std_logic;
    signal zor_not4: std_logic;
        
begin
    not_gb<= not gb;

    rb <= cclrb;
    clkb1 <=not cck;
    clkb2 <=not rck;
    
    not_and<= loadb and (not enpb) and (not entb);
    
    or_not1<= not (loadb or xa);
    or_not2<=not (loadb or xb);
    or_not3<=not (loadb or xc);
    or_not4<=not (loadb or xd);
    
    and1<= (not u_db) and qdd1;
    and2<= u_db and qbdd1;
    and3<= (not u_db) and qdd2;
    and4<= u_db and qbdd2;
    and5<= (not u_db) and qdd3;
    and6<= u_db and qbdd3;
    and7<= (not u_db) and qdd4;
    and8<= u_db and qbdd4;
    
    or_not5<=not (and1 or and2);
    or_not6<=not (and3 or and4);
    or_not7<=not (and5 or and6);
    or_not8<=not (and7 or and8);
    
    not_or1<=(not not_and) or (not or_not5);
    not_or2<=(not not_and) or (not or_not5) or (not or_not6);
    not_or3<=(not not_and) or (not or_not5) or (not or_not6) or (not or_not7);
    
    and9<= not_and and qdd1;
    and10<= (not not_and) and loadb and qbdd1;
    and11<= not_and and or_not5 and qdd2;
    and12<= not_or1 and loadb and qbdd2;
    and13<= not_and and or_not5 and or_not6 and qdd3;
    and14<= not_or2 and loadb and qbdd3;
    and15<= not_and and or_not5 and or_not6 and or_not7 and qdd4;
    and16<= not_or3 and loadb and qbdd4;
    
    and_not<= not (or_not5 and or_not6 and or_not7 and or_not8 and (not entb));
    
    or_not9<=not (or_not1 or and9 or and10);
    or_not10<=not (or_not2 or and11 or and12);
    or_not11<=not (or_not3 or and13 or and14);
    or_not12<=not (or_not4 or and15 or and16);
    
    c1: d_trigger Port Map (
        sb=>zero,
        d=>or_not9,
        clkb=>clkb1,
        rb=>rb,
        q=>qdd1,
        qb=>qbdd1 
    );         
    c2: d_trigger Port Map (
        sb=>zero,
        d =>or_not10,
        clkb=>clkb1,
        rb =>rb,
        q =>qdd2,
        qb =>qbdd2 
    );         
    c3: d_trigger Port Map (
        sb=>zero,
        d=>or_not11,
        clkb =>clkb1,
        rb =>rb,
        q =>qdd3,
        qb =>qbdd3 
    );          
    c4: d_trigger Port Map (
        sb=>zero,
        d =>or_not12,
        clkb =>clkb1,
        rb =>rb,
        q =>qdd4,
        qb =>qbdd4 
    );       
    r1: d_trigger Port Map (
        sb=>zero,
        d=>qdd1,
        clkb=>clkb2,
        rb=>zero,
        qb=>qbd1
    );       
    r2: d_trigger Port Map (
        sb=>zero,
        d=>qdd2,
        clkb =>clkb2,
        rb=>zero,
        qb=>qbd2 
    );       
    r3: d_trigger Port Map (
        sb=>zero,
        d=>qdd3,
        clkb =>clkb2,
        rb=>zero,
        qb => qbd3
    );        
    r4: d_trigger Port Map (
        sb=>zero,
        d => qdd4,
        clkb =>clkb2,
        rb=>zero,
        qb=>qbd4
    );  
    
     and17<=r_cb and qbd1;
     and18<=(not r_cb) and qbdd1;
     and19<=r_cb and qbd2;
     and20<=(not r_cb) and qbdd2;
     and21<=r_cb and qbd3;
     and22<=(not r_cb) and qbdd3;
     and23<=r_cb and qbd4;
     and24<=(not r_cb) and qbdd4;  
    
    zor_not1<='Z' when not_gb = '0' else not(and17 or and18);
    zor_not2<='Z' when not_gb = '0' else not(and19 or and20);
    zor_not3<='Z' when not_gb = '0' else not(and21 or and22);
    zor_not4<='Z' when not_gb = '0' else not(and23 or and24);     
     
    ya<=zor_not1;
    yb<=zor_not2;
    yc<=zor_not3;
    yd<=zor_not4;
    
    rcob<=and_not;
      
end Behavioral;
