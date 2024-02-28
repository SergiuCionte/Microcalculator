----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:35:40 05/08/2022 
-- Design Name: 
-- Module Name:    sumatorcomple_8bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder8bit_1 is
    Port ( X : in  std_logic_vector(7 downto 0);
           Y : in  std_logic_vector (7 downto 0);
           CARRYIN : in  std_logic;
           S : out  std_logic_vector(7 downto 0);
           CARRYOUT : out  std_logic);
end full_adder8bit_1;

 architecture fulladder8bit of full_adder8bit_1 is


component full_adder1bit is
    Port ( A : in std_logic;
           B : in  std_logic;
           SUM : out  std_logic;
           CIN : in  std_logic;
           COUT : out  std_logic);
end component;


Signal C: std_logic_vector(8 downto 0);



begin

C(0) <=CARRYIN;
conditie:FOR i IN 0 TO 7

GENERATE
generare:full_adder1bit port map (A =>X(i), B =>Y(i), CIN =>C(i), SUM=>S(i), COUT =>C(i+1));
end GENERATE;

CARRYOUT <= C(8);
end fulladder8bit;