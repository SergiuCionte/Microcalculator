----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:25:13 05/29/2022 
-- Design Name: 
-- Module Name:    full_subtractor_1bit_1 - Behavioral 
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

entity full_sub is
    Port ( SAIN : in  STD_LOGIC;
           SBIN : in  STD_LOGIC;
           SCIN : in  STD_LOGIC;
           SSO : out  STD_LOGIC;
           SCO : out  STD_LOGIC);
end full_sub;

architecture Behavioral of full_sub is

begin
SSO<=SAIN XOR SBIN XOR SCIN;
SCO<=(NOT SAIN AND SBIN ) OR (SCIN AND(NOT SAIN XOR SBIN));

end Behavioral;
