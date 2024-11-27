library std;
library ieee;
use ieee.std_logic_1164.all;

entity Register_File is
  port (

	clk : in std_logic;

	
	R : in std_logic; 
	W: in std_logic;

	

	
	A1 : in std_logic_vector(2 downto 0);
	 
	A2 : in std_logic_vector(2 downto 0);
	
	A3 : in std_logic_vector(2 downto 0);

	
	D3 : in std_logic_vector(15 downto 0);
	D1 : out std_logic_vector(15 downto 0);
	D2 : out std_logic_vector(15 downto 0)

  ) ;
end entity ;

architecture rf of Register_File is

	signal R0 : std_logic_vector(15 downto 0) := "0000000000000000";
	signal R1 : std_logic_vector(15 downto 0) := "0000000000000001";
	signal R2 : std_logic_vector(15 downto 0) := "0000000000000010";
	signal R3 : std_logic_vector(15 downto 0) := "0000000000000011";
	signal R4 : std_logic_vector(15 downto 0) := "0000000000000100";
	signal R5 : std_logic_vector(15 downto 0) := "0000000000000101";
	signal R6 : std_logic_vector(15 downto 0) := "0000000000000110";
	signal R7 : std_logic_vector(15 downto 0) := "0000000000000000";
	signal D1_Temp : std_logic_vector(15 downto 0);
	signal D2_Temp : std_logic_vector(15 downto 0);

begin
	
	process(clk) is 
	begin
		
		if (clk'event and clk = '1') then 
			if (W = '1')  then 
				if A3 = "000" then 
					R0 <= D3;
				end if;
				if A3 = "001" then 
					R1 <= D3;
				end if;
				if A3 = "010" then 
					R2 <= D3;
				end if;
				if A3 = "011" then 
					R3 <=D3;
				end if;
				if A3 = "100" then 
					R4 <= D3;
				end if;
				if A3 = "101" then 
					R5 <= D3;
				end if;
				if A3 = "110" then 
					R6 <= D3;
				end if;
			  if A3 = "111" then 
					R7 <= D3;
				end if;
			end if;
		end if;
	end process;

	process(R, A1,A2)

	begin
	if R = '1' then
		if A1 = "000" then
			D1_Temp <= R0;
		elsif A1 = "001" then
			D1_Temp <= R1;
		elsif A1 = "010" then
			D1_Temp <= R2;
		elsif A1 = "011" then
			D1_Temp <= R3;
		elsif A1 = "100" then
			D1_Temp <= R4;
		elsif A1 = "101" then
			D1_Temp <= R5;
		elsif A1 = "110" then
			D1_Temp <= R6;
		elsif A1 = "111" then
			D1_Temp <= R7;
		end if;
	
		if A2 = "000" then
			D2_Temp <= R0;
		elsif A2 = "001" then
			D2_Temp <= R1;
		elsif A2 = "010" then
			D2_Temp <= R2;
		elsif A2 = "011" then
			D2_Temp <= R3;
		elsif A2 = "100" then
			D2_Temp <= R4;
		elsif A2 = "101" then
			D2_Temp <= R5;
		elsif A2 = "110" then
			D2_Temp <= R6;
		elsif A2 = "111" then
			D2_Temp <= R7;
		end if;
	end if;
	D1 <= D1_Temp;
	D2 <= D2_Temp;
	end process;

end architecture;