library std;
library ieee;
use ieee.std_logic_1164.all;

entity op_code_finder is
  port (
	t1 : in std_logic_vector(15 downto 0);
	op_code : out std_logic_vector(3 downto 0));
end entity;

architecture OPF of op_code_finder is

begin
	
	op_code <= t1(15 downto 12);
			
end architecture ;

