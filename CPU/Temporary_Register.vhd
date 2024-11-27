library std;
library ieee;
use ieee.std_logic_1164.all;

entity Temporary_Register is
  port (

	T_in : in std_logic_vector(15 downto 0);
	T_E : in std_logic;
	T_out : out std_logic_vector(15 downto 0);
	clk : in std_logic

  ) ;
end entity ; 
architecture Temp_R of Temporary_Register is

begin
 	
	process (clk)
	begin 
		if (clk'event and clk = '1') then 
			if T_E = '1' then
			T_out <= T_in;
			end if;
		end if;
	end process;

end architecture ; 