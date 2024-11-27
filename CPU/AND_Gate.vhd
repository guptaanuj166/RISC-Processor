library std;
library ieee;
use ieee.std_logic_1164.all;

entity AND_Gate is
  port (
	in_1 : in std_logic_vector(7 downto 0);
	in_2 : in std_logic_vector(7 downto 0);
	AND_out : out std_logic_vector(7 downto 0)
  ) ;
end entity ; 

architecture AND_ar of AND_Gate is
begin
	AND_out <= in_1 and in_2;

end architecture ; 