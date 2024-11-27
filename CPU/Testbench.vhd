LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity Testbench is
end entity Testbench;

architecture bhv of Testbench is
   component data_path is
      port (
        t1_E : in std_logic;
        pc_select : in std_logic;
		  pc_E : in std_logic := '0';
		  
        alu_op_select : in std_logic_vector(1 downto 0);
        alu_a_select : in std_logic;
        alu_b_select : in std_logic_vector(1 downto 0);
        mem_add_select : in std_logic;
      mem_data_select : in std_logic;
      mem_write : in std_logic;
      mem_read : in std_logic;
      rf_write : in std_logic;
      rf_read : in std_logic := '0';
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
    
      clk : in std_logic := '1';
    
      rst : in std_logic := '1';
    
      op_code: out std_logic_vector(3 downto 0)
      
      ) ;
    end component data_path;

    component controlpath is 
	port (

  	t1_E : out std_logic;

  	pc_select : out std_logic;
	pc_E : out std_logic;

  	alu_op_select : out std_logic_vector(1 downto 0);
  	
  	alu_a_select : out std_logic_vector(1 downto 0);
  	
  	alu_b_select : out std_logic_vector(2 downto 0);

  	
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
end component controlpath;

signal rst : std_logic := '1';
signal clk: std_logic := '1';
signal continue_flag: std_logic;
signal iszero: std_logic;
signal zero_flag: std_logic ;
signal carry_flag: std_logic ;
signal op_code:  std_logic_vector(3 downto 0);
   signal t1_E :  std_logic;
   signal  pc_select :  std_logic;
	signal pc_E : std_logic ;
   signal   alu_op_select :  std_logic_vector(1 downto 0) ;
   signal   alu_a_select :  std_logic ;
   signal    alu_b_select :  std_logic_vector(1 downto 0) ;
   signal    mem_add_select :  std_logic ;
   signal  mem_data_select :  std_logic ;
   signal   mem_write :  std_logic ;
   signal   mem_read :  std_logic ;
   signal   rf_write :  std_logic ;
   signal  rf_read :  std_logic  ;
   signal  rf_a2_select :  std_logic ;
   signal  rf_a3_select :  std_logic_vector(1 downto 0) ;
   signal  rf_d3_select :  std_logic_vector(1 downto 0) ;
    
   signal  t2_select :  std_logic_vector(1 downto 0) ;
   signal  t2_E :  std_logic ;
      
   signal  t3_select :  std_logic ;
   signal  t3_E :  std_logic ;
      
   signal t4_E :  std_logic ;
  
   signal t5_select :  std_logic ;
   signal t5_E :  std_logic ;

constant clk_period : time := 2 ns;
begin
	
	dut_instance:  data_path port map(clk, rst, op_code => op_code,carry_flag => carry_flag,zero_flag => zero_flag,iszero => iszero,continue_flag => continue_flag,
	pc_E => pc_E,
        alu_op_select => alu_op_select ,
        alu_a_select => alu_a_select ,
        alu_b_select => alu_b_select,
        mem_add_select => mem_add_select ,
      mem_data_select => mem_data_select ,
      mem_write => mem_write ,
      mem_read => mem_read ,
      rf_write => rf_write,
		rf_read => rf_read,
      rf_a2_select => rf_a2_select ,
      rf_a3_select => rf_a3_select ,
      rf_d3_select => rf_d3_select ,
    
      t2_select => t2_select ,
      t2_E => t2_E ,
      
      t3_select => t3_select ,
      t3_E => t3_E ,
      
      t4_E => t4_E,
  
      t5_select => t5_select,
      t5_E => t5_E);
	clk <= not clk after clk_period/2 ;
	rst <= '1', '0' after 4 ns;
	
end bhv;