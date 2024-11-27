library std;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity memory is
  port (

  	
	clk : in std_logic;
	rst : in std_logic;
	
	memory_rd : in std_logic;
	memory_wr : in std_logic;

	
	address_in : in std_logic_vector(15 downto 0);

	
	data_in : in std_logic_vector(15 downto 0);
 
	data_out : out std_logic_vector(15 downto 0)

  ) ;
end entity ;

architecture mem of memory is
type Memory is array(0 to 14) of std_logic_vector(15 downto 0);
signal memory_element : Memory :=
(	 "0000001010011000",
 "0000001010011010",
 "0000001010011001",
 "0001001010000010",
 "0010001010011000",
 "0010001010011010",
 "0010001010011001",
 "0011001000000001",
 "0100010001000001",
 "0101010001000001",
 "0110001001101000",
 "0111001001101000",
 "1100001010000010",
 "1000001000000001",
 "1001001010000000"
)


;

begin


	process(clk)
	begin 
	if (clk'event and clk = '1') then 
		if (memory_wr = '1') then
			memory_element(to_integer(unsigned(address_in(15 downto 0)))) <= data_in;
		end if;
	end if;
	if memory_rd = '1' then
	data_out <= memory_element(to_integer(unsigned(address_in(15 downto 0)))); -- default 
	end if;
	end process;

	end architecture mem;

			
			
			
