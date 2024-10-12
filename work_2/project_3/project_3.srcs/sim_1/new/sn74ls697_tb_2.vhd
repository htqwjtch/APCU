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


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sn74ls697_tb_2 is
--  Port ( );
end sn74ls697_tb_2;

architecture Behavioral of sn74ls697_tb_2 is
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
    signal ya_b: std_logic;
    signal yb_b: std_logic;
    signal yc_b: std_logic;
    signal yd_b: std_logic;
    signal rcob_b: std_logic;
    
    signal success_tests: std_logic:='1';
        
begin
    --Instantiate the Unit Under Test (UUT)
    behav: entity work.sn74ls697(Behavioral) PORT MAP(
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
           
        ya=>ya_b,
        yb=>yb_b,
        yc=>yc_b,
        yd=>yd_b,
        rcob=>rcob_b  
    );
    
     -- Process for reading from file and checking results
       process
          file test_vectors : text;
          variable line_buffer : line;
          variable input_vector : std_logic_vector(0 to 17); -- 13 inputs + 5 outputs
       begin
           file_open(test_vectors, "C:\Users\htqwj\APCU\work_2\project_3\test_vectors.txt", read_mode);
           
           -- Reading lines from the file
           while not endfile(test_vectors) loop
               readline(test_vectors, line_buffer);
           
               read(line_buffer, input_vector(0));
               read(line_buffer, input_vector(1));
               read(line_buffer, input_vector(2));
               read(line_buffer, input_vector(3));
               read(line_buffer, input_vector(4));
               read(line_buffer, input_vector(5));
               read(line_buffer, input_vector(6));
               read(line_buffer, input_vector(7));
               read(line_buffer, input_vector(8));
               read(line_buffer, input_vector(9));
               read(line_buffer, input_vector(10));
               read(line_buffer, input_vector(11));
               read(line_buffer, input_vector(12));
               read(line_buffer, input_vector(13));
               read(line_buffer, input_vector(14));
               read(line_buffer, input_vector(15));
               read(line_buffer, input_vector(16));
               read(line_buffer, input_vector(17));
           
               xa<=input_vector(0);
               xb<=input_vector(1);
               xc<=input_vector(2);
               xd<=input_vector(3);
               gb<=input_vector(4);
               cclrb<=input_vector(5);
               loadb<=input_vector(6);
               enpb<=input_vector(7);
               entb<=input_vector(8);
               r_cb<=input_vector(9); 
               u_db<=input_vector(10);
               rck<=input_vector(11);
               cck<=input_vector(12);
                      
               wait for 10 ps;  -- Wait for output stabilization

               -- Checking results
               if ya_b /= input_vector(13) then
                   success_tests<='0';
                   report "Error: ya does not match!";
               end if;
               if yb_b /= input_vector(14) then
                   success_tests<='0';
                   report "Error: yb does not match!";
               end if;
               if yc_b /= input_vector(15) then
                   success_tests<='0';
                   report "Error: yc does not match!";
               end if;
               if yd_b /= input_vector(16) then
                   success_tests<='0';
                   report "Error: yd does not match!";
               end if;
               if rcob_b /= input_vector(17) then
                   success_tests<='0';
                   report "Error: rcob does not match!";
               end if;
           end loop;

           if success_tests = '1' then
              report "All tests have been SUCCESSFULLY completed!!!";  
           end if;

           file_close(test_vectors);
           wait;  -- Wait for completion
       end process;
       
end Behavioral;
