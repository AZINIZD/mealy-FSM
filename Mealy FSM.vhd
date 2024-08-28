library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seq3_detect_mealy is
    Port (
        x    : in  STD_LOGIC;      -- Input signal
        clk  : in  STD_LOGIC;      -- Clock signal
        y    : out STD_LOGIC       -- Output signal
    );
end seq3_detect_mealy;

architecture Behavioral of seq3_detect_mealy is
    type state_type is (S0, S1, S2, S3); -- State definitions
    signal pstate, nstate : state_type;   -- Present and next state signals
begin

    -- Next state and output logic
    process(x, pstate)
    begin
        -- Default assignments
        nstate <= pstate; -- Default to current state
        y <= '0';         -- Default output

        case pstate is
            when S0 =>
                if x = '1' then
                    nstate <= S1;
                else
                    nstate <= S0;
                end if;

            when S1 =>
                if x = '1' then
                    nstate <= S2;
                else
                    nstate <= S0;
                end if;

            when S2 =>
                if x = '1' then
                    nstate <= S3;
                else
                    nstate <= S0;
                end if;

            when S3 =>
                if x = '1' then
                    nstate <= S3;
                    y <= '1';  -- Output high when in state S3 with input 1
                else
                    nstate <= S0;
                end if;

            when others =>
                nstate <= S0; -- Default case
        end case;
    end process;

    -- Sequential logic for state transitions
    process(clk)
    begin
        if rising_edge(clk) then
            pstate <= nstate; -- Update present state
        end if;
    end process;

end Behavioral;
            
