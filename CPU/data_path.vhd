library std;
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.components_package.all;

entity data_path is
  port (

  	
  	t1_E : in std_logic;

  
  	pc_select : in std_logic;
	pc_E : in std_logic;

  
  	alu_op_select : in std_logic_vector(1 downto 0);
  	
  	alu_a_select : in std_logic;
  	
  	alu_b_select : in std_logic_vector(1 downto 0);

  	mem_add_select : in std_logic;
	mem_data_select : in std_logic;
	
	mem_write : in std_logic;
	mem_read : in std_logic;

	
	rf_write : in std_logic;
	rf_read : in std_logic;
	
	rf_a2_select : in std_logic;
	
	rf_a3_select : in std_logic_vector(1 downto 0);
	
	rf_d3_select : in std_logic_vector(1 downto 0);

	
	
	t2_select : in std_logic_vector(1 downto 0);
	t2_E : in std_logic;
	
	t3_select : in std_logic;
	t3_E : in std_logic;
	
	t4_E : in std_logic;
	
	t5_select : in std_logic;
	t5_E : in std_logic;

	


   continue_flag : out std_logic;


	iszero : out std_logic;

	
	zero_flag : out std_logic;


	carry_flag : out std_logic;

	clk : in std_logic;

	
	rst : in std_logic;

	
	op_code: out std_logic_vector(3 downto 0)

	
	
  ) ;
end entity ; 
architecture dpth of data_path is

	signal alu_op : std_logic_vector(1 downto 0); 
	signal alu_in_a : std_logic_vector(15 downto 0);
	signal alu_in_b : std_logic_vector(15 downto 0);
	signal alu_c : std_logic_vector(15 downto 0);
	signal alu_carry_out : std_logic;
	signal alu_zero_out : std_logic;

	
	signal T2_data_in : std_logic_vector(15 downto 0);
	signal T2_data_out : std_logic_vector(15 downto 0);
	
	signal T3_data_in : std_logic_vector(15 downto 0);
	signal T3_data_out : std_logic_vector(15 downto 0);

	signal T4_data_in : std_logic_vector(2 downto 0);
	signal T4_data_out : std_logic_vector(2 downto 0);
	
	signal T5_data_in : std_logic_vector(7 downto 0);
	signal T5_data_out : std_logic_vector(7 downto 0);


	signal add1_read : std_logic_vector(2 downto 0);
	signal add2_read : std_logic_vector(2 downto 0);
	signal data1_outr : std_logic_vector(15 downto 0);
	signal data2_outr : std_logic_vector(15 downto 0);
	signal add3_read : std_logic_vector(2 downto 0);
	signal data3_writer : std_logic_vector(15 downto 0);


	signal PC_in : std_logic_vector(15 downto 0);
	signal PC_out : std_logic_vector(15 downto 0) := "0000000000000000";

	
	signal mem_add_in : std_logic_vector(15 downto 0);
	signal mem_data_in : std_logic_vector(15 downto 0);
	signal mem_data_out : std_logic_vector(15 downto 0);

	 
	signal Priority_E_in : std_logic_vector(7 downto 0);
	signal Priority_E_out : std_logic_vector(2 downto 0);
	
	signal AND_inp1 : std_logic_vector(7 downto 0);
	signal AND_inp2 : std_logic_vector(7 downto 0);
	signal AND_out : std_logic_vector(7 downto 0);
	
	signal decoder_in : std_logic_vector(2 downto 0);
	signal decoder_out : std_logic_vector(7 downto 0);

	signal zero_checker_in : std_logic_vector(7 downto 0);
	signal zero_checker_out : std_logic;

	
	signal SE6_out : std_logic_vector(15 downto 0);
	signal SE9_out : std_logic_vector(15 downto 0);
	signal data_postfix_out : std_logic_vector(15 downto 0);

	
	
	signal t1s : std_logic_vector(15 downto 0);


	
	

begin
	
	alu_in_a <= PC_out when alu_a_select = '0' else
		T2_data_out when alu_a_select = '1'; 

	alu_in_b <= "0000000000000001" when alu_b_select = "00" else
		SE6_out when alu_b_select = "01" else
		SE9_out when alu_b_select = "10" else
		T3_data_out when alu_b_select = "11"; 

	alu_op <= alu_op_select;

	carry_flag <= alu_carry_out;

	zero_flag <= alu_zero_out;

	T2_data_in <= data1_outr when t2_select = "00" and t2_E = '1' else
		data2_outr when t2_select = "01" and t2_E = '1' else
		alu_c when t2_select = "10" and t2_E = '1' ;


	T3_data_in <= data2_outr when t3_select = '0' and t3_E = '1' else
		SE6_out when t3_select = '1' and t3_E = '1';
	
	
	T4_data_in <= Priority_E_out when t4_E = '1';

	
	
	T5_data_in <= t1s(7 downto 0) when t5_select = '0' and t5_E = '1' else
		AND_out when t5_select = '1' and t5_E = '1';
		

	add1_read <= t1s(11 downto 9);
	
	add2_read <= t1s(8 downto 6) when rf_a2_select = '0' else
			T4_data_out when rf_a2_select = '1';
	
	add3_read <= t1s(5 downto 3) when rf_a3_select = "00" else
		t1s(8 downto 6) when rf_a3_select = "01" else
		t1s(11 downto 9) when rf_a3_select = "10" else
		T4_data_out when rf_a3_select = "11";
	
	data3_writer <= T2_data_out when rf_d3_select = "00" else
		alu_c when rf_d3_select = "01" else
		mem_data_out when rf_d3_select = "10" else
		data_postfix_out when rf_d3_select = "11";

	
	
	mem_data_in <= data1_outr when mem_add_select = '0' else
	data2_outr when mem_add_select = '1';
	mem_add_in <= PC_out when mem_add_select = '0' else
		T3_data_out when mem_add_select = '1';

	
	Priority_E_in <= T5_data_out;

	AND_inp1 <= t1s(7 downto 0);
	AND_inp2 <= decoder_out;
	decoder_in <= T4_data_out;
	zero_checker_in <= T5_data_out;

	iszero <= zero_checker_out;

	 
	PC_in <= alu_c when pc_select = '0' else
		data2_outr when pc_select = '1';

	

	Mem : memory
		port map(
			address_in => mem_add_in,
			data_in => mem_data_in,
			data_out => mem_data_out,
			clk => clk,
			rst => rst,
			memory_rd => mem_read,
			memory_wr => mem_write


		);
	CFT : continue_flag_tracker
		port map (
			cz => t1s(1 downto 0),
			carry_flag => alu_carry_out,
			zero_flag => alu_zero_out,
			continue_track => continue_flag 
		);
	
	DP : data_postfix
		port map (
			data_in => t1s(8 downto 0),
			data_out => data_postfix_out
		);

	SE9c : SE9
		port map (
			data_in => t1s(8 downto 0),
			data_out => SE9_out
			);
	
	SE6c : SE6
		port map (
			data_in => t1s(5 downto 0),
			data_out => SE6_out
			);

	Priority_Encoder : PE 
		port map (
			pe_in => Priority_E_in,
			pe_out => Priority_E_out
			);
	
	DFE : decoder_for_Encoder 
		port map (
			decoder_Encoder_in => decoder_in,
			decoder_Encoder_out => decoder_out
			);
	
	ANDG : AND_Gate 
		port map (
			in_1 => AND_inp1,
			in_2 => AND_inp2,
			AND_out => AND_out
		);

	Zero_check : Zero_checker
		port map (
			zero_check_in => zero_checker_in,
			zero_check_out => zero_checker_out
		);
	 
	T1R : t1
		port map(
			t1_in => mem_data_out,
			t1_out => t1s,
			t1_E => t1_E,
			clk => clk
			);
	OPF : op_code_finder
		port map(
			t1 => t1s,
			op_code => op_code
			);

	RF : Register_File 
		port map (
			clk => clk,
			R => rf_read,
			W => rf_write,

			A1 => add1_read,
			A2 => add2_read,
			A3 => add3_read,
			D3 => data3_writer,
			D1 => data1_outr,
			D2 => data2_outr
			);


	Arithmetic_Logical_Unit : ALU
		port map(
			in_a => alu_in_a,
			in_b => alu_in_b,
			alu_op => alu_op,
			alu_c => alu_c,
			carry => alu_carry_out,
			zero => alu_zero_out
			);
	Program_counter : PC 
	port map (
		PC_in => PC_in,
	PC_E => pc_E,
	PC_out => PC_out,
	clk => clk




	);
	T2 : Temporary_Register 
		port map (
			T_in => T2_data_in,
			T_E => t2_E,
			T_out => T2_data_out,
			clk => clk
		);

	T3 : Temporary_Register 
		port map (
			T_in => T3_data_in,
			T_E => t3_E,
			T_out => T3_data_out,
			clk => clk
		);

	T4 : Temporary_Register_3bit 
		port map (
			T_in => T4_data_in,
			T_E => t4_E,
			T_out => T4_data_out,
			clk => clk
		);

	T5 : Temporary_Register_8bit 
		port map (
			T_in => T5_data_in,
			T_E => t5_E,
			T_out => T5_data_out,
			clk => clk
		);

end dpth; 




