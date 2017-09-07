----------------------------------------------------------------------
-- Copyright (C) 2008 ASIP Solutions, Inc. All rights reserved. 
-- Generated by ASIP Meister 2.3 on 2014/09/16 14:10:53 
----------------------------------------------------------------------

-----------------------------------------------------------
-- Entity Name: rtg_proc_fsm
-----------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity rtg_proc_fsm is
  port (
    CLK : in std_logic;
    RST : in std_logic;
    INTR_REQ : in std_logic;
    INTR_DETECT : in std_logic;
    INTR_CANCEL : in std_logic;
    INTR_HANDLING : out std_logic;
    INTR_PENDING : out std_logic;
    FETCH_ENB : out std_logic
  );
end entity rtg_proc_fsm;

architecture RTL of rtg_proc_fsm is
  constant ST_RESET : std_logic_vector(1 downto 0) := "00";
  constant ST_INTRHANDLE : std_logic_vector(1 downto 0) := "01";
  constant ST_NORMALEXEC : std_logic_vector(1 downto 0) := "11";
  constant ST_INTRPENDING : std_logic_vector(1 downto 0) := "10";

  signal cur_state : std_logic_vector(1 downto 0);
  signal nxt_state : std_logic_vector(1 downto 0);

begin
  process (RST, CLK)
  begin
    if RST = '1' then
      cur_state <= ST_RESET;
    elsif CLK'event and CLK = '1' then
      cur_state <= nxt_state;
    end if;
  end process;

  process (RST, INTR_REQ, INTR_DETECT, INTR_CANCEL, cur_state)
  begin
    case cur_state is
      when ST_RESET =>
        INTR_HANDLING <= '0';
        INTR_PENDING <= '0';
        FETCH_ENB <= '0';
        if RST = '1' then
          nxt_state <= ST_RESET;
        elsif RST = '0' then
          nxt_state <= ST_INTRHANDLE;
        else
          nxt_state <= "XX";
        end if;
      when ST_INTRHANDLE =>
        INTR_HANDLING <= '1';
        INTR_PENDING <= '0';
        FETCH_ENB <= '0';
        nxt_state <= ST_NORMALEXEC;
      when ST_NORMALEXEC =>
        INTR_HANDLING <= '0';
        INTR_PENDING <= '0';
        FETCH_ENB <= '1';
        if INTR_REQ = '1' then
          nxt_state <= ST_INTRHANDLE;
        elsif INTR_REQ = '0' and INTR_DETECT = '1' then
          nxt_state <= ST_INTRPENDING;
        elsif INTR_REQ = '0' and INTR_DETECT = '0' then
          nxt_state <= ST_NORMALEXEC;
        else
          nxt_state <= "XX";
        end if;
      when ST_INTRPENDING =>
        INTR_HANDLING <= '0';
        INTR_PENDING <= '1';
        FETCH_ENB <= '0';
        if INTR_REQ = '1' then
          nxt_state <= ST_INTRHANDLE;
        elsif INTR_REQ = '0' and INTR_CANCEL = '0' then
          nxt_state <= ST_INTRPENDING;
        elsif INTR_REQ = '0' and INTR_CANCEL = '1' then
          nxt_state <= ST_NORMALEXEC;
        else
          nxt_state <= "XX";
        end if;
      when others =>
        INTR_HANDLING <= 'X';
        INTR_PENDING <= 'X';
        FETCH_ENB <= 'X';
        nxt_state <= "XX";
    end case;
  end process;
end RTL;

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------
