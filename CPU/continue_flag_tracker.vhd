library std;
library ieee;
use ieee.std_logic_1164.all;

entity continue_flag_tracker is
  port(cz : in std_logic_vector(1 downto 0); carry_flag : in std_logic; zero_flag : in std_logic;
		 continue_track : out std_logic);
end entity;

architecture CFT of continue_flag_tracker is
	signal con_var: std_logic := '0';

begin
	process(cz, carry_flag, zero_flag)
	begin
		if cz = "00" then 
			con_var <= '1';
		end if;
		if cz = "10" then 
			con_var <= carry_flag;
		end if;
		if cz = "01" then 
			con_var <= zero_flag;
		end if;
		continue_track <= con_var;
	end process;

end architecture CFT;