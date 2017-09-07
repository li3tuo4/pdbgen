--
-- Copyright (C) 2008 ASIP Solutions, Inc. All rights reserved. 
-- Generated by ASIP Meister 2.3 on 2016/06/14 17:07:14 
--
-- Module	 : Data Memory Interface Unit
-- Author	 : M. Itoh (c) 2000.
--                 Modified by J.Sato (c) 2001
--                 Modified by Y.Kobayashi (c) 2004
--                 Modified by K.Ueda (c) 2005
-- Version	 : 1.0

-- Functionality : behavior level
--  port
--    addr_out         : address from cpu
--    data_in          : data input to cpu
--    aderr_in         : address error signal to cpu
--    addr2mem         : address to memory
--    data2cpu         : data from memory
--    aderr2cpu        : address error signal from memory
--    rw_out           : read/write mode from cpu
--                       0 => read
--                       1 => write
--    data_out         : data output from cpu
--    rw2mem           : read/write mode to memory
--    data2mem         : data to memory

library ieee;
use ieee.std_logic_1164.all;

entity fhm_mifu_w64 is
    port (
      rw_out     : in  std_logic;
      data_out   : in  std_logic_vector(63 downto 0);
      rw2mem     : out std_logic;
      data2mem   : out std_logic_vector(63 downto 0);
      addr_out   : in  std_logic_vector(31 downto 0);
      data_in    : out std_logic_vector(63 downto 0);
      aderr_in   : out std_logic;
      addr2mem   : out std_logic_vector(31 downto 0);
      data2cpu   : in  std_logic_vector(63 downto 0);
      aderr2cpu  : in  std_logic
    );
end fhm_mifu_w64;

architecture behavior of fhm_mifu_w64 is

begin
  process (
rw_out, data_out, addr_out, data2cpu, aderr2cpu)  begin  -- process
    addr2mem   <= addr_out;
    data_in    <= data2cpu;
    aderr_in   <= aderr2cpu;
    rw2mem     <= rw_out;
    data2mem   <= data_out;
  end process;
  
end behavior;

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------
