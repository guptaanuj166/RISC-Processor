library std;
library ieee;
use ieee.std_logic_1164.all;

entity t1 is
  port(t1_in : in std_logic_vector(15 downto 0); t1_E : in std_logic; clk : in std_logic;
		 t1_out : out std_logic_vector(15 downto 0));
end entity;

architecture t1ar of t1 is

begin
	process(clk) 
	begin 
		if (clk'event and clk = '1') then 
			if t1_E = '1' then 
				t1_out <= t1_in;
			end if;
		end if;
	end process;

end architecture t1ar;
