-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
component conectare1 is
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
                  -- rst:in std_logic);
                   
                   --Sqrtres:out std_logic_vector(3 downto 0));
  --              topselDispA : out  STD_LOGIC;
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
  end component;

       signal    clk :   STD_LOGIC :='0';
			--signal    clr: std_logic :='0';
			signal    carryin: std_logic;
			signal    A: std_logic_vector(7 downto 0)	:=(others =>'0');  
			signal    B: std_logic_vector(7 downto 0)  :=(others =>'0'); 
			--signal    Rez: std_logic_vector(7 downto 0); 
			  signal Rest: std_logic_vector(7 downto 0);
			signal 	produs: std_logic_vector(15 downto 0);
			signal	suma: std_logic_vector(7 downto 0);
			signal	 Dif: std_logic_vector(7 downto 0);
			signal	 Div: std_logic_vector(7 downto 0);
			signal done:std_logic;
			--signal rst:std_logic:='0';
			signal sq_root:unsigned(3 downto 0);
--			signal    selectie: std_logic_vector(1 downto 0);
--			signal    topselDispA : STD_LOGIC:='1';
--        signal     topselDispB :   STD_LOGIC:='1';
--         signal    topselDispC :   STD_LOGIC:='1';
--        signal     topselDispD :  STD_LOGIC:='1';
--        signal     topsegA :  STD_LOGIC:='0';
--        signal     topsegB :   STD_LOGIC:='0';
--        signal     topsegC :   STD_LOGIC:='0';
--        signal     topsegD :   STD_LOGIC:='0';
--        signal     topsegE :  STD_LOGIC:='0';
--        signal     topsegF :   STD_LOGIC:='0';
--        signal     topsegG :  STD_LOGIC:='0';
--          
constant clk_period:time :=100 ns;
  BEGIN

  -- Component Instantiation
          uut: conectare1 PORT MAP(
             clk,carryin,A,B,Rest,produs,suma,Dif,Div,done,sq_root--,selectie,topselDispA,topselDispB,topselDispC,topselDispD,topsegA,topsegB,topsegC,topsegD,topsegE,topsegF,topsegG  
          );


  --  Test Bench Statements
     clk_process : PROCESS
     BEGIN
	clk<='0';
        wait for clk_period/2; -- wait until global set/reset completes
			clk<='1';
			wait for clk_period/2;
			end process;
        -- Add user defined stimulus here
--clr<='1','0' after 50 ns;
   
	stim_proc:process
	begin
	A<="11111111";
		B<="10000110";
		carryin<='0';
	
		wait;
     END PROCESS ;
  --  End Test Bench 

  END;