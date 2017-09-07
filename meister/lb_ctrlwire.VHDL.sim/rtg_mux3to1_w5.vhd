----------------------------------------------------------------------
-- Copyright (C) 2008 ASIP Solutions, Inc. All rights reserved. 
-- Generated by ASIP Meister 2.3 on 2014/09/16 14:10:53 
----------------------------------------------------------------------

-----------------------------------------------------------
-- Entity Name: rtg_mux3to1_w5
-----------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity rtg_mux3to1_w5 is
  port (
    SEL : in std_logic_vector(1 downto 0);
    DIN0 : in std_logic_vector(4 downto 0);
    DIN1 : in std_logic_vector(4 downto 0);
    DIN2 : in std_logic_vector(4 downto 0);
    DOUT : out std_logic_vector(4 downto 0)
  );
end entity rtg_mux3to1_w5;

architecture RTL of rtg_mux3to1_w5 is


begin
  DOUT <= 
	DIN0 when SEL = "00" else 
	DIN1 when SEL = "01" else 
	DIN2 when SEL = "10" else 
	"XXXXX";
end RTL;

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------
