library std;
library ieee;
use ieee.std_logic_1164.all;

entity PE is
  port (
	pe_in : in std_logic_vector(7 downto 0);
	pe_out : out std_logic_vector(2 downto 0)
  ) ;
end entity ; 
architecture priority_encoder of PE is 

begin

process(pe_in)
variable pe_var : std_logic_vector(2 downto 0);
begin
	if pe_in(7) = '1' then 
		pe_var := "000";
	elsif pe_in(6) = '1' then
		pe_var := "001";
	elsif pe_in(5) = '1' then
		pe_var := "010";
	elsif pe_in(4) = '1' then
		pe_var := "011";
	elsif pe_in(3) = '1' then
		pe_var := "100";
	elsif pe_in(2) = '1' then
		pe_var := "101";
	elsif pe_in(1) = '1' then
		pe_var := "110";
	elsif pe_in(0) = '1' then
		pe_var := "111";
	end if;
pe_out <= pe_var;
end process;
end architecture ; 