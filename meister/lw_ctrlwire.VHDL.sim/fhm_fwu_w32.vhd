--
-- Copyright (C) 2008 ASIP Solutions, Inc. All rights reserved. 
-- Generated by ASIP Meister 2.3 on 2014/09/16 16:01:33 
--
-- Module    : 32-bit data 5-bit address forwarding unit
-- Reference : Start from scratch
-- Author    : Designed by M.Itoh (c) 2000
--             Modified by K.Ueda (c) 2005
-- Version   : 1.1:

-- Functionality : behavior
-- port
--  data0     : input data from storage unit
--  data1     : forwarding data from stage 1
--  data2     : forwarding data from stage 2
--  data3     : forwarding data from stage 3
--  data4     : forwarding data from stage 4
--  data5     : forwarding data from stage 5
--  data6     : forwarding data from stage 6
--  data7     : forwarding data from stage 7
--  data8     : forwarding data from stage 8
--  num0      :  address of data to be read
--  num1      : address of forwarding data from stage 1
--  num2      : address of forwarding data from stage 2
--  num3      : address of forwarding data from stage 3
--  num4      : address of forwarding data from stage 4
--  num5      : address of forwarding data from stage 5
--  num6      : address of forwarding data from stage 6
--  num7      : address of forwarding data from stage 7
--  num8      : address of forwarding data from stage 8
--  fw1       : valid flag from stage 1
--  fw2       : valid flag from stage 2
--  fw3       : valid flag from stage 3
--  fw4       : valid flag from stage 4
--  fw5       : valid flag from stage 5
--  fw6       : valid flag from stage 6
--  fw7       : valid flag from stage 7
--  fw8       : valid flag from stage 8
--  data_out  : output data

library IEEE;
use IEEE.std_logic_1164.all;

entity fhm_fwu_w32 is

  port (
    data0    : in  std_logic_vector(31 downto 0);
    data1    : in  std_logic_vector(31 downto 0);
    data2    : in  std_logic_vector(31 downto 0);
    data3    : in  std_logic_vector(31 downto 0);
    data4    : in  std_logic_vector(31 downto 0);
    data5    : in  std_logic_vector(31 downto 0);
    data6    : in  std_logic_vector(31 downto 0);
    data7    : in  std_logic_vector(31 downto 0);
    data8    : in  std_logic_vector(31 downto 0);
    num0     : in  std_logic_vector(4 downto 0);
    num1     : in  std_logic_vector(4 downto 0);
    num2     : in  std_logic_vector(4 downto 0);
    num3     : in  std_logic_vector(4 downto 0);
    num4     : in  std_logic_vector(4 downto 0);
    num5     : in  std_logic_vector(4 downto 0);
    num6     : in  std_logic_vector(4 downto 0);
    num7     : in  std_logic_vector(4 downto 0);
    num8     : in  std_logic_vector(4 downto 0);
    fw1      : in  std_logic;
    fw2      : in  std_logic;
    fw3      : in  std_logic;
    fw4      : in  std_logic;
    fw5      : in  std_logic;
    fw6      : in  std_logic;
    fw7      : in  std_logic;
    fw8      : in  std_logic;
    data_out : out std_logic_vector(31 downto 0));

end fhm_fwu_w32;

architecture behavior of fhm_fwu_w32 is
  
begin  -- behavior

  process (data0, data1, data2, data3, data4, data5, data6, data7,
  	data8,
           num0, num1, num2, num3, num4, num5, num6, num7, num8, 
           fw1, fw2, fw3, fw4, fw5, fw6, fw7, fw8)
    variable tmp : std_logic_vector(31 downto 0);
  begin
    if (fw1 = '1') and (num0 = num1) then
      tmp := data1;
    elsif (fw2 = '1') and (num0 = num2) then
      tmp := data2;
    elsif (fw3 = '1') and (num0 = num3) then
      tmp := data3;
    elsif (fw4 = '1') and (num0 = num4) then
      tmp := data4;
    elsif (fw5 = '1') and (num0 = num5) then
      tmp := data5;
    elsif (fw6 = '1') and (num0 = num6) then
      tmp := data6;
    elsif (fw7 = '1') and (num0 = num7) then
      tmp := data7;
    elsif (fw8 = '1') and (num0 = num8) then
      tmp := data8;
    else
      tmp := data0;
    end if;
    data_out <= tmp;
  end process;
end behavior;

-----------------------------------------
-- Generated by ASIP Meister ver.2.3.2 --
-----------------------------------------