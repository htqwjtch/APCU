library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity encoder_tb_2 is
end encoder_tb_2;

architecture Behavioral of encoder_tb_2 is
    component encoder
        Port (
            E1 : in std_logic;
            X0 : in std_logic;
            X1 : in std_logic;
            X2 : in std_logic;
            X3 : in std_logic;
            X4 : in std_logic;
            X5 : in std_logic;
            X6 : in std_logic;
            X7 : in std_logic;
            EO : out std_logic;
            GS : out std_logic;
            Y0 : out std_logic;
            Y1 : out std_logic;
            Y2 : out std_logic
        );
    end component;

    -- Signals for connecting to the component
    signal E1, X0, X1, X2, X3, X4, X5, X6, X7 : std_logic;
    signal EO, GS, Y0, Y1, Y2 : std_logic;

begin
    -- Connect the device
    uut: entity work.encoder(Behavioral)
        port map (
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
    
    -- Process for reading from file and checking results
    process
       file test_vectors : text;
       variable line_buffer : line;
       variable input_vector : std_logic_vector(0 to 13); -- 9 inputs + 5 outputs
    begin
        wait for 10 ps;  -- Wait for output stabilization

        file_open(test_vectors, "C:\Users\htqwj\APCU\work_1\project_1\test_vectors.txt", read_mode);
        
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
        
            -- Setting input values
            E1 <= input_vector(0);
            X0 <= input_vector(1);
            X1 <= input_vector(2);
            X2 <= input_vector(3);
            X3 <= input_vector(4);
            X4 <= input_vector(5);
            X5 <= input_vector(6);
            X6 <= input_vector(7);
            X7 <= input_vector(8);
            wait for 10 ps;  -- Wait for output stabilization
            
            -- Checking results
            if EO /= input_vector(13) then
                report "Error: EO does not match!";
            end if;
            if GS /= input_vector(12) then
                report "Error: GS does not match!";
            end if;
            if Y0 /= input_vector(11) then
                report "Error: Y0 does not match!";
            end if;
            if Y1 /= input_vector(10) then
                report "Error: Y1 does not match!";
            end if;
            if Y2 /= input_vector(9) then
                report "Error: Y2 does not match!";
            end if;
        end loop;
        
        file_close(test_vectors);
        wait;  -- Wait for completion
    end process;
end Behavioral;
