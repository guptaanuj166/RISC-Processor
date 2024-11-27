library std;
library ieee;
use ieee.std_logic_1164.all;

entity data_postfix is
  port (data_in : in std_logic_vector(8 downto 0); 
  	  data_out : out std_logic_vector(15 downto 0));
end entity;

architecture DP of data_postfix is

begin
data_out(15 downto 7) <= data_in(8 downto 0);
data_out(6) <= '0';
data_out(5) <= '0';
data_out(4) <= '0';
data_out(3) <= '0';
data_out(2) <= '0';
data_out(1) <= '0';
data_out(0) <= '0';


end architecture DP;

