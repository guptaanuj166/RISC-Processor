library std;
library ieee;
use ieee.std_logic_1164.all;

entity Zero_checker is
  port (
	zero_check_in : in std_logic_vector(7 downto 0);
	zero_check_out : out std_logic
  ) ;
end entity ; 

architecture zero_ext of Zero_checker is

begin
	zero_check_out <= '1' when zero_check_in = "00000000" else '0';

end architecture ; 