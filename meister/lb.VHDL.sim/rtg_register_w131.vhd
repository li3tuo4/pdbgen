----------------------------------------------------------------------
-- Copyright (C) 2008 ASIP Solutions, Inc. All rights reserved. 
-- Generated by ASIP Meister 2.3 on 2014/09/19 15:20:44 
----------------------------------------------------------------------

-----------------------------------------------------------
-- Entity Name: rtg_register_w131
-----------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity rtg_register_w131 is
  port (
    CLK : in std_logic;
    RST : in std_logic;
    ENB : in std_logic;
    DIN : in std_logic_vector(130 downto 0);
    DOUT : out std_logic_vector(130 downto 0)
  );
end entity rtg_register_w131;

architecture RTL of rtg_register_w131 is


begin
  process (RST, CLK)
  begin
    if RST = '1' then
  DOUT <=
  
  
  
  
  
  
  
  
  
  
  
  
  
  	"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    elsif CLK'event and CLK = '1' then
      if ENB = '1' then
        DOUT <= DIN;
      end if;
    end if;
  end process;
end RTL;

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------
