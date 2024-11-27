library std;
library ieee;
use ieee.std_logic_1164.all;

entity PC is
  port (

	PC_in : in std_logic_vector(15 downto 0);
	PC_E : in std_logic;
	PC_out : out std_logic_vector(15 downto 0);
	clk : in std_logic

  ) ;
end entity ; 
architecture PC_R of PC is

begin
 	
	process (clk)
	begin 
		if (clk'event and clk = '1') then 
			if PC_E = '1' then
			PC_out <= PC_in;
			end if;
		end if;
	end process;

end architecture ; 