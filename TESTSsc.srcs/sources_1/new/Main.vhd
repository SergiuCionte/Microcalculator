----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2023 04:05:15 PM
-- Design Name: 
-- Module Name: Main - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main is
    Port ( --sw : in STD_LOGIC_VECTOR (16 downto 0);
           A:in std_logic_vector(7 downto 0);
           B:in std_logic_vector(7 downto 0);
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           --anA:out STD_LOGIC_VECTOR(1 downto 0);
          -- catA:out STD_LOGIC_VECTOR(6 downto 0);
           --anB:out STD_LOGIC_VECTOR(1 downto 0);
          -- catB:out STD_LOGIC_VECTOR(6 downto 0);
          -- output:out STD_LOGIC_VECTOR(16 downto 0);
           Clk : in STD_LOGIC);
end Main;

architecture Behavioral of Main is

signal dif:std_logic_vector(7 downto 0);
signal Rest:std_logic_vector(7 downto 0);
signal produs:std_logic_vector(15 downto 0);
signal suma:std_logic_vector(7 downto 0);
signal carryin:std_logic:='0';
signal cout:std_logic;
signal borrow:std_logic;
signal Div:std_logic_vector(7 downto 0);
signal sq_root:unsigned(3 downto 0);
signal done:std_logic;
signal operation:std_logic_vector(4 downto 0);
signal Div16:std_logic_vector(15 downto 0);
signal adunare16:std_logic_vector(15 downto 0);
signal scadere16:std_logic_vector(15 downto 0);
signal sq_root16:std_logic_vector(15 downto 0);
signal output: STD_LOGIC_VECTOR(15 downto 0);
signal outputAfis:STD_LOGIC_VECTOR(31 downto 0);

component divider8 is
    Port ( --clr : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
       
           A : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           B : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           Q : out  STD_LOGIC_VECTOR(7 DOWNTO 0);
           R : out  STD_LOGIC_VECTOR(7 DOWNTO 0));
end component;

component multiplier_8bit is
    Port ( X : in  std_logic_vector(7 downto 0);
           Y : in  std_logic_vector(7 downto 0);
           P : out  std_logic_vector(15 downto 0));
end component;


component full_adder8bit_1 is
    Port ( X : in  std_logic_vector(7 downto 0);
           Y : in  std_logic_vector (7 downto 0);
           CARRYIN : in  std_logic;
           S : out  std_logic_vector(7 downto 0);
           CARRYOUT : out  std_logic);
end component;

component full_sub_8bit is
    Port ( A : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           B : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           R : out  STD_LOGIC_VECTOR(7 DOWNTO 0);
           Z : out  STD_LOGIC);
end component;


component square_root is
    generic(N : integer := 8);
    port (
        Clk : in std_logic;     --Clock
       -- rst : in std_logic;     --Asynchronous active high reset.
        input : in unsigned(N-1 downto 0);  --this is the number for which we want to find square root.
        done : out std_logic;   --This signal goes high when output is ready
        sq_root : out unsigned(N/2-1 downto 0)  --square root of 'input'
    );
end component;

component debouncer is
    Port ( Clk : in STD_LOGIC;
         --  Rst : in STD_LOGIC;
           D_in : in STD_LOGIC;
           Q_out : out STD_LOGIC);
end component;

component SSD is
    Port ( clk: in STD_LOGIC;
           digits: in STD_LOGIC_VECTOR(31 downto 0);
           an: out STD_LOGIC_VECTOR(7 downto 0);
           cat: out STD_LOGIC_VECTOR(6 downto 0));
end component;



begin

impartire:divider8 port map(clk,A,B,Div,Rest);
inmultire:multiplier_8bit port map(A,B,produs);
adunare:full_adder8bit_1 port map(A,B,carryin,suma,cout);
scadere:full_sub_8bit port map(A,B,Dif,Borrow);
radical:square_root generic map (N => 8)
port map (clk,unsigned(A),done,sq_root);

impartireButon:debouncer port map(clk,btn(4),operation(4));
inmultireButon:debouncer port map(clk,btn(3),operation(3));
adunareButon:debouncer port map(clk,btn(2),operation(2));
scadereButon:debouncer port map(clk,btn(1),operation(1));
radicalButon:debouncer port map(clk,btn(0),operation(0));


Div16 <= "00000000" & Div;
adunare16 <= "00000000" & suma;
scadere16 <= "00000000" & Dif;
sq_root16 <= "000000000000" & std_logic_vector(sq_root);

with btn(4 downto 0) select
    output <= adunare16 when "10000",
              produs when "01000",
              Div16 when "00100",
              scadere16 when "00010",
              sq_root16 when "00001",
    (others => 'X') when others;
    
outputAfis <= A & B & output;
    
display:SSD port map(Clk,outputAfis,an,cat);




end Behavioral;
