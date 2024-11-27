library std;
library ieee;
use ieee.std_logic_1164.all;

entity controlpath is 
	port (

	
  	t1_E : out std_logic;

  
  	pc_select : out std_logic;
	pc_E : out std_logic;

  
  	alu_op_select : out std_logic_vector(1 downto 0);
  	
  	alu_a_select : out std_logic;
  	
  	alu_b_select : out std_logic_vector(1 downto 0);

  
  	mem_add_select : out std_logic;
	mem_data_select : out std_logic;
	
	mem_write : out std_logic;
	mem_read : out std_logic;


	rf_write : out std_logic;
	rf_read : out std_logic;
	
	rf_a2_select : out std_logic;

	rf_a3_select : out std_logic_vector(1 downto 0);
	
	rf_d3_select : out std_logic_vector(1 downto 0);
	
	
	t2_select : out std_logic_vector(1 downto 0);
	t2_E : out std_logic;
	
	t3_select : out std_logic;
	t3_E : out std_logic;
	
	t4_E : out std_logic;
	
	t5_select : out std_logic;
	t5_E : out std_logic;

	


	continue_flag : in std_logic;


	iszero : in std_logic;

	
	zero_flag : in std_logic;

	
	carry_flag : in std_logic;

	 
	clk : in std_logic;

	
	rst : in std_logic;


	op_code: in std_logic_vector(3 downto 0)
);
end entity;

architecture cntrl of controlpath is
	type state is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,S16,S17,S18,S19,S20);
	signal y_present,y_next: state:=s0;
	begin
		clock_proc:process(clk,rst)
			begin
			if(clk='1' and clk' event) then
				if(rst='1') then
				y_present<= s0;
				
				
				else
				y_present<= y_next;
				
				end if;
			end if;
		end process;

		state_transition_and_output_proc: process(y_present, zero_flag, carry_flag, op_code, iszero, continue_flag)
		begin
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_write <= '0';
			mem_read <= '0';
			   
			pc_select <= '0';
			pc_E <= '0';
			   
			alu_op_select <= "00";
			alu_a_select <= '0';
			alu_b_select <= "00";
			   
			rf_write <= '0';
			rf_read <= '0';
			rf_a2_select <= '0';
			rf_a3_select <= "00";
			rf_d3_select <= "00";
			   
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
		case y_present is
		when S0 =>  
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_write <= '0';
			mem_read <= '0';
			
			pc_select <= '0';
			pc_E <= '0';
			
			alu_op_select <= "00";
			alu_a_select <= '0';
			alu_b_select <= "00";
			
			rf_write <= '0';
			rf_read <= '0';
			rf_a2_select <= '0';
			rf_a3_select <= "00";
			rf_d3_select <= "00";
			
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
        	y_next <= S1;   
		
		when S1 =>

			t1_E <= '1';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '1';
			mem_write <= '0';
			
			pc_select <= '0';
			pc_E <= '1';
		
			alu_op_select <= "00";
			alu_a_select <= '0';
			alu_b_select <= "00";
		
			rf_read <= '0';
			rf_write <= '0';
			rf_a2_select <= '0';
			rf_a3_select <= "00";
			rf_d3_select <= "00";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			
		
        	if op_code = "0000" or op_code = "0010" then
				if continue_flag = '1' then
         		y_next <= S2;
				else
				   y_next <= S1;
				end if;
			
			elsif op_code = "0111" or op_code = "0110" then
				y_next <= S16;
		
			elsif op_code = "0100" or op_code = "0101" then
				y_next <= S8;
			
        	elsif op_code = "1001" or op_code = "1000" then
        		y_next <= S13;
			
			elsif op_code = "0001" then 
				y_next <= S5;
			
			elsif op_code = "0011" then
				y_next <= S7;
			elsif op_code = "1100" then
				y_next <= S2;
			else
				y_next <= S0;
			end if;
			
		when S2 =>  
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '0';
			
			pc_select <= '0';
			pc_E <= '0';
		
			alu_op_select <= "00";
			alu_a_select <= '0';
			alu_b_select <= "00";
		
			rf_read <= '1';
			rf_write <= '0';
			rf_a2_select <= '0';
			rf_a3_select <= "00";
			rf_d3_select <= "00";
		
			t2_select <= "00";
			t2_E <= '1';
			t3_select <= '0';
			t3_E <= '1';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			
			y_next <= S3;

		when S3 =>
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '0';
			
			pc_select <= '0';
			pc_E <= '0';
		
			
			if op_code="0000" or op_code="0001" or op_code="0100" or op_code="0101" then
			alu_op_select <= "00";
			elsif op_code="0010" then
			alu_op_select <= "10";
			else
			alu_op_select <= "01";
			end if;
			
			
			alu_a_select <= '1';
			alu_b_select <= "01";
		
			rf_read <= '0';
			rf_write <= '0';
			rf_a2_select <= '0';
			rf_a3_select <= "00";
			rf_d3_select <= "00";
		
			t2_select <= "10";
			t2_E <= '1';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			
			if op_code = "0000" or op_code = "0010" then
				y_next <= S4;
			end if;
			
			if op_code = "0001" then 
				y_next <= S6;
			end if;
			
			if op_code = "0100" then 
				y_next <= S9;
			end if;
			
			if op_code = "0101" then 
				y_next <= S10;
			end if;
			
			if op_code = "1100" then
				if zero_flag = '1' then
				y_next <= S11;
				else
				y_next <= S1;
				end if;
			end if;
				
		
		when S4 => 
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '0';
			
			pc_select <= '0';
			pc_E <= '0';
		
			alu_op_select <= "00";
			alu_a_select <= '0';
			alu_b_select <= "00";
		
			rf_read <= '0';
			rf_write <= '1';
			rf_a2_select <= '0';
			rf_a3_select <= "00";
			rf_d3_select <= "00";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			y_next <= S1;
		when S5 =>
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '0';
			
			pc_select <= '0';
			pc_E <= '0';
		
			alu_op_select <= "00";
			alu_a_select <= '0';
			alu_b_select <= "00";
		
			rf_read <= '1';
			rf_write <= '0';
			rf_a2_select <= '0';
			rf_a3_select <= "00";
			rf_d3_select <= "00";
		
			t2_select <= "00";
			t2_E <= '1';
			t3_select <= '1';
			t3_E <= '1';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			y_next <= S3;

		when S6 => 
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '0';
			
			pc_select <= '0';
			pc_E <= '0';
		
			alu_op_select <= "00";
			alu_a_select <= '0';
			alu_b_select <= "00";
		
			rf_read <= '0';
			rf_write <= '1';
			rf_a2_select <= '0';
			rf_a3_select <= "01";
			rf_d3_select <= "00";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			
			y_next <= S1;

		when S7 =>
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '0';
			
			pc_select <= '0';
			pc_E <= '0';
		
			alu_op_select <= "00";
			alu_a_select <= '0';
			alu_b_select <= "00";
		
			rf_read <= '0';
			rf_write <= '1';
			rf_a2_select <= '0';
			rf_a3_select <= "10";
			rf_d3_select <= "11";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			y_next <= S1;
		when S8 =>
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '0';
			
			pc_select <= '0';
			pc_E <= '0';
		
			alu_op_select <= "00";
			alu_a_select <= '0';
			alu_b_select <= "00";
		
			rf_read <= '1';
			rf_write <= '0';
			rf_a2_select <= '0';
			rf_a3_select <= "00";
			rf_d3_select <= "00";
		
			t2_select <= "01";
			t2_E <= '1';
			t3_select <= '1';
			t3_E <= '1';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			y_next <= S3;
		when S9 =>
			t1_E <= '0';
			mem_add_select <= '1';
			mem_data_select <= '0';
			mem_read <= '1';
			mem_write <= '0';
			
			pc_select <= '0';
			pc_E <= '0';
		
			alu_op_select <= "00";
			alu_a_select <= '0';
			alu_b_select <= "00";
		
			rf_read <= '0';
			rf_write <= '1';
			rf_a2_select <= '0';
			rf_a3_select <= "10";
			rf_d3_select <= "10";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			y_next <= S1; 
		when S10 =>
			t1_E <= '0';
			mem_add_select <= '1';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '1';
			
			pc_select <= '0';
			pc_E <= '0';
		
			alu_op_select <= "00";
			alu_a_select <= '0';
			alu_b_select <= "00";
		
			rf_read <= '1';
			rf_write <= '0';
			rf_a2_select <= '0';
			rf_a3_select <= "00";
			rf_d3_select <= "00";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			y_next <= S1; 

		
		when S11 =>
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_write <= '0';
			mem_read <= '0';
		
			pc_select <= '0';
			pc_E <= '1';
		
			alu_op_select <= "00";
			alu_a_select <= '0';
			alu_b_select <= "01";
		
			rf_write <= '0';
			rf_read <= '0';
			rf_a2_select <= '0';
			rf_a3_select <= "00";
			rf_d3_select <= "00";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			y_next <= S12;
		when S12 =>
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_write <= '0';
			mem_read <= '0';
		
			pc_select <= '0';
			pc_E <= '1';
		
			alu_op_select <= "00";
			alu_a_select <= '0';
			alu_b_select <= "01";
		
			rf_write <= '0';
			rf_read <= '0';
			rf_a2_select <= '0';
			rf_a3_select <= "00";
			rf_d3_select <= "00";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			y_next <= S1;

		when S13 =>
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '0';
			
			pc_select <= '0';
			pc_E <= '1';
		
			alu_op_select <= "01";
			alu_a_select <= '0';
			alu_b_select <= "00";
		
			rf_read <= '0';
			rf_write <= '1';
			rf_a2_select <= '0';
			rf_a3_select <= "10";
			rf_d3_select <= "01";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';

			if op_code = "1000" then
				y_next <= S14;
			end if;
			
			if op_code = "1001" then 
				y_next <= S15;
			end if;
		
		when S14 =>
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '0';
			
			pc_select <= '0';
			pc_E <= '1';
		
			alu_op_select <= "01";
			alu_a_select <= '0';
			alu_b_select <= "10";
		
			rf_read <= '0';
			rf_write <= '0';
			rf_a2_select <= '0';
			rf_a3_select <= "10";
			rf_d3_select <= "01";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			y_next <= S1;
		when S15 =>
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '0';
			
			pc_select <= '1';
			pc_E <= '1';
		
			alu_op_select <= "01";
			alu_a_select <= '0';
			alu_b_select <= "00";
		
			rf_read <= '1';
			rf_write <= '0';
			rf_a2_select <= '0';
			rf_a3_select <= "00";
			rf_d3_select <= "00";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			y_next <= S1;
		
		
		when S16 =>
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '0';
			
			pc_select <= '1';
			pc_E <= '0';
		
			alu_op_select <= "01";
			alu_a_select <= '0';
			alu_b_select <= "10";
		
			rf_read <= '1';
			rf_write <= '0';
			rf_a2_select <= '0';
			rf_a3_select <= "10";
			rf_d3_select <= "01";
		
			t2_select <= "00";
			t2_E <= '1';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '1';
			if op_code = "0110" then
				y_next <= S17;
			end if;
			
			if op_code = "0111" then 
				y_next <= S18;
			end if;
			
		when S17 => 
			t1_E <= '0';
			mem_add_select <= '1';
			mem_data_select <= '0';
			mem_read <= '1';
			mem_write <= '0';
			
			pc_select <= '1';
			pc_E <= '0';
		
			alu_op_select <= "01";
			alu_a_select <= '0';
			alu_b_select <= "10";
		
			rf_read <= '0';
			rf_write <= '1';
			rf_a2_select <= '0';
			rf_a3_select <= "11";
			rf_d3_select <= "10";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '1';
			t5_select <= '0';
			t5_E <= '0';
			y_next <= S19;
		when S18 =>
			t1_E <= '0';
			mem_add_select <= '1';
			mem_data_select <= '1';
			mem_read <= '0';
			mem_write <= '1';
			
			pc_select <= '0';
			pc_E <= '0';
		
			alu_op_select <= "01";
			alu_a_select <= '0';
			alu_b_select <= "10";
		
			rf_read <= '1';
			rf_write <= '0';
			rf_a2_select <= '1';
			rf_a3_select <= "11";
			rf_d3_select <= "10";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '1';
			t5_select <= '0';
			t5_E <= '0';
			y_next <= S19;
		when S19 =>
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '0';
			
			pc_select <= '1';
			pc_E <= '0';
		
			alu_op_select <= "01";
			alu_a_select <= '0';
			alu_b_select <= "10";
		
			rf_read <= '0';
			rf_write <= '1';
			rf_a2_select <= '0';
			rf_a3_select <= "11";
			rf_d3_select <= "10";
		
			t2_select <= "00";
			t2_E <= '0';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '1';
			t5_E <= '1';
			if iszero = '0' then
			y_next <= S20;
			else
			y_next <= S1;
			end if;
				
		when S20 =>
			t1_E <= '0';
			mem_add_select <= '0';
			mem_data_select <= '0';
			mem_read <= '0';
			mem_write <= '0';
			
			pc_select <= '1';
			pc_E <= '0';
		
			alu_op_select <= "00";
			alu_a_select <= '1';
			alu_b_select <= "00";
		
			rf_read <= '0';
			rf_write <= '1';
			rf_a2_select <= '0';
			rf_a3_select <= "11";
			rf_d3_select <= "10";
		
			t2_select <= "10";
			t2_E <= '1';
			t3_select <= '0';
			t3_E <= '0';
			t4_E <= '0';
			t5_select <= '0';
			t5_E <= '0';
			if op_code = "0110" then
				y_next <= S17;
			end if;
			if op_code = "0111" then 
				y_next <= S18;
			end if;
		end case;
		end process state_transition_and_output_proc;
end cntrl;
