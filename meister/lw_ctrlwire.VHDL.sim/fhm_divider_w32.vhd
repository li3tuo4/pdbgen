--
-- Copyright (C) 2008 ASIP Solutions, Inc. All rights reserved. 
-- Generated by ASIP Meister 2.3 on 2014/09/16 16:01:33 
--
-- Module     : 32-bit Divider
-- Feature    : 
-- References :
-- Author     : Designed by T.Morifuji (c) 1996,1999
--              Modified by K.Ueda (c)2002
-- Version    : 2.0  : change functionality

-- Functionality : behavioral level
--  port
--   clock    : (ignore)
--   async_reset    : (ignore)
--   reset    : (ignore)
--   clear    : (ignore)
--   a        : dividend
--   b        : divisor
--   start    : (ignore)
--   mode     : '1' for signed multiplication
--              '0' for unsigned multiplication
--   q        : result of a / b
--   r        : reminder of a / b
--   flag     : '1' if b = 0
--   fin      : '1' when operation is over

library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.std_logic_signed.all;

entity fhm_divider_w32 is
  port (clock  : in  std_logic;
        async_reset  : in  std_logic;
        reset  : in  std_logic;
	clear  : in  std_logic;
        a, b   : in  std_logic_vector(31 downto 0);
        start  : in  std_logic;
        mode   : in  std_logic;
        q      : out std_logic_vector(31 downto 0);
        r      : out std_logic_vector(31 downto 0);
        flag   : out std_logic;
        fin    : out std_logic);
end fhm_divider_w32;

architecture behavior of fhm_divider_w32 is
begin
  process (a, b, mode)
    variable tmp_a, tmp_b : std_logic_vector(63 downto 0);
    variable tmp_result : std_logic_vector(31 downto 0);
    variable sign : boolean;
  begin
    if (mode='1' and ((a(31) xor b(31)) = '1')) then
      sign := true;
    else
      sign := false;
    end if;
    if (mode='1' and a(31)='1') then
      tmp_a(31 downto 0) := not a + 1;
    else
      tmp_a(31 downto 0) := a;
    end if;
    tmp_a(63 downto 32) := (others => '0');
    
    if (mode='1' and b(31) = '1') then
      tmp_b(63 downto 31) := '0' & (not b + 1);
    else
      tmp_b(63 downto 31) := '0' & b;
    end if;
    tmp_b(30 downto 0) := (others => '0');
    
    for i in 31 downto 0 loop
      if ((tmp_a /= 0) and (tmp_a - tmp_b >= 0)) then
        tmp_result(i) := '1';
        tmp_a := tmp_a - tmp_b;
      else
        tmp_result(i) := '0';
      end if;
      tmp_b := '0' & tmp_b(63 downto 1);
    end loop;  -- i

    if (sign) then
      tmp_result := not tmp_result + 1;
    end if;
    if (mode = '1' and a(31) = '1') then
      tmp_a := not tmp_a + 1;
    end if;

    if (b = 0) then
      flag <= '1';
      q <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
      r <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    else
      flag <= '0';
      -- divided
      q <= tmp_result;
      -- modulo
      r <= tmp_a(31 downto 0);
    end if;
  end process;

  fin <= '1' and not start;
end behavior;

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------
