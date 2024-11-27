library std;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
  port (in_a : in std_logic_vector(15 downto 0); in_b : in std_logic_vector(15 downto 0);

	alu_op : in std_logic_vector(1 downto 0);
	alu_c : out std_logic_vector(15 downto 0);
	carry : out std_logic;
	zero : out std_logic
	);
end entity ALU;

architecture alu of ALU is

	signal a_2s_compliment : std_logic_vector(15 downto 0);
	signal b_2s_compliment : std_logic_vector(15 downto 0);
	signal alu_c_temp : std_logic_vector(15 downto 0);
	signal carry_dueto_positive : std_logic;
	signal carry_dueto_2s_compliment : std_logic;
	signal alu_c_dueto_2s_compliment : std_logic_vector(15 downto 0);

begin

	a_2s_compliment <= std_logic_vector(unsigned(not (in_a)) + 1);
	b_2s_compliment <= std_logic_vector(unsigned(not (in_b)) + 1);

	process(in_a, in_b, alu_op)
	begin 

		if alu_op = "00" then 
			alu_c_temp <= std_logic_vector(unsigned(in_a) + unsigned(in_b));
			alu_c_dueto_2s_compliment <= std_logic_vector(unsigned(a_2s_compliment) + unsigned(b_2s_compliment));
		end if;
		if alu_op = "01" then 
		alu_c_temp <= std_logic_vector(unsigned(in_a) + unsigned(b_2s_compliment));
		alu_c_dueto_2s_compliment <= std_logic_vector(unsigned(a_2s_compliment) + unsigned(in_b));
		end if;
		if alu_op = "10" then 
		alu_c_temp <= in_a nand in_b;
		alu_c_dueto_2s_compliment <= "0000000000000000";
		end if;

	end process;

	alu_c <= alu_c_temp;
	zero <= '1' when alu_c_temp = "0000000000000000" else '0';

	carry_dueto_positive <= '1' when in_a(15) = '0' and in_b(15) = '0' and in_a(14 downto 0) > alu_c_temp(14 downto 0)
	else '0';
	carry_dueto_2s_compliment <= '1' when in_a(15) = '1' and in_b(15) = '1' and a_2s_compliment(14 downto 0) > alu_c_dueto_2s_compliment(14 downto 0)
	 and alu_c_dueto_2s_compliment(15 downto 0) /= "1000000000000000"
	else '0';
	carry <= carry_dueto_2s_compliment or carry_dueto_positive;

end architecture alu;