----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:34:37 05/08/2022 
-- Design Name: 
-- Module Name:    sumatorcomplet_1bit - Behavioral 
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

entity full_adder1bit is
    Port ( A : in std_logic ;
           B : in  std_logic;
           SUM : out  std_logic;
           CIN : in  std_logic;
           COUT : out  std_logic);
end full_adder1bit;

Architecture fulladd_logic of full_adder1bit is
begin

	SUM <= A xor B xor CIN;
	COUT <= (A and B) or (CIN and A) or (CIN and B);
end fulladd_logic;
