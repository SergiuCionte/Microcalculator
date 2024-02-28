----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:10:58 05/30/2022 
-- Design Name: 
-- Module Name:    conectare1 - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity conectare1 is
    Port ( 
      
           clk : in  STD_LOGIC;
			 -- clr:in std_logic;
			  carryin:in std_logic;
			  A:in std_logic_vector(7 downto 0);	  
			  B:in std_logic_vector(7 downto 0);  
			--  Rez:out std_logic_vector(7 downto 0); 
			  --selectie:in std_logic_vector(1 downto 0);
			   Rest:out std_logic_vector(7 downto 0);
				produs:out std_logic_vector(15 downto 0);
				suma:out std_logic_vector(7 downto 0);
				 Dif:out std_logic_vector(7 downto 0);
				 Div:out std_logic_vector(7 downto 0);
				 done:out std_logic;
				 sq_root:out unsigned(3 downto 0));
				 --rst:in std_logic);
				 
				 --Sqrtres:out std_logic_vector(3 downto 0));
--			  topselDispA : out  STD_LOGIC;
--           topselDispB : out  STD_LOGIC;
--           topselDispC : out  STD_LOGIC;
--           topselDispD : out  STD_LOGIC;
--           topsegA : out  STD_LOGIC;
--           topsegB : out  STD_LOGIC;
--           topsegC : out  STD_LOGIC;
--           topsegD : out  STD_LOGIC;
--           topsegE : out  STD_LOGIC;
--           topsegF : out  STD_LOGIC;
--           topsegG : out  STD_LOGIC);
end conectare1;

architecture Behavioral of conectare1 is
--component segmentdriver is
--    Port ( display_A : in  STD_LOGIC_VECTOR(3 downto 0);
--           display_B : in  STD_LOGIC_VECTOR(3 downto 0);
--           display_C : in  STD_LOGIC_VECTOR(3 downto 0);
--           display_D : in  STD_LOGIC_VECTOR(3 downto 0);
--           segA : out  STD_LOGIC;
--           segB : out  STD_LOGIC;
--           segC : out  STD_LOGIC;
--           segD : out  STD_LOGIC;
--           segE : out  STD_LOGIC;
--           segF : out  STD_LOGIC;
--           segG : out  STD_LOGIC;
--           select_Display_A : out  STD_LOGIC;
--           select_Display_B : out  STD_LOGIC;
--           select_Display_C : out  STD_LOGIC;
--           select_Display_D : out  STD_LOGIC;
--           clk : in  STD_LOGIC);
--end component;

component divider8 is
    Port ( --clr : in  STD_LOGIC;
           clk : in  STD_LOGIC;
       
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

component MUX4_1 is
    Port ( A :in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           B :in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           C :in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           D : in  STD_LOGIC_VECTOR(7 DOWNTO 0);
           Y : out  STD_LOGIC_VECTOR(7 DOWNTO 0);
           Sel : in  STD_LOGIC_VECTOR(1 downto 0));
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
--component sqrt is
    --Port ( input : in  std_logic_vector(7 downto 0);
      -- output :out    std_logic_vector (3 downto 0));

--end component;



signal Ai:std_logic_vector(3 downto 0);
signal Bi:std_logic_vector(3 downto 0);
signal Ci:std_logic_vector(3 downto 0);
signal Di:std_logic_vector(3 downto 0);
--signal Dif:std_logic_vector(7 downto 0);
--signal Rest:std_logic_vector(7 downto 0);
--signal produs:std_logic_vector(15 downto 0);
--signal suma:std_logic_vector(7 downto 0);
signal cout:std_logic;
signal borrow:std_logic;
--signal Div:std_logic_vector(7 downto 0);
begin

--eticheta_conectare:segmentdriver port map(
--    display_A =>Ai,
--    display_B =>Bi,
--    display_C =>Ci,
--    display_D =>Di,
--			  segA =>topsegA,
--           segB =>topsegB,
--           segC =>topsegC,
--           segD =>topsegD,
--           segE =>topsegE,
--           segF =>topsegF,
--           segG =>topsegG,
--           select_Display_A =>topselDispA,
--           select_Display_B =>topselDispB,
--           select_Display_C =>topselDispC,
--           select_Display_D =>topselDispD,
--           clk =>clk
--			  );
--			  
--			  Ai(0) <=A(0);
--			  Ai(1) <=A(1);
--			  Ai(2) <=A(2);
--			  Ai(3) <=A(3);
--			  Bi(0) <=A(4);
--			  Bi(1) <=A(5);
--			  Bi(2) <=A(6);
--			  Bi(3) <=A(7);
--		
--		Ci<="0000";  --nu stim cate switch uri avem pe placa iar daca nu mai avem le initializam cu 0
--		Di<="0000";
impartire:divider8 port map(clk,A,B,Div,Rest);
inmultire:multiplier_8bit port map(A,B,produs);
adunare:full_adder8bit_1 port map(A,B,carryin,suma,cout);
scadere:full_sub_8bit port map(A,B,Dif,Borrow);
radical:square_root generic map (N => 8)
port map (clk,unsigned(A),done,sq_root);

--selectare_operatie:MUX4_1 port map(Dif,produs,suma,Div,Rez,selectie);




end Behavioral;
