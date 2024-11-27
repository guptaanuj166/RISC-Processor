library std;
library ieee;
use ieee.std_logic_1164.all;

package components_package is

  component ALU is 
  port (
    in_a : in std_logic_vector(15 downto 0);
    in_b : in std_logic_vector(15 downto 0);
    alu_op : in std_logic_vector(1 downto 0);
    alu_c : out std_logic_vector(15 downto 0);
    carry : out std_logic;
    zero : out std_logic
  );
  end component ALU;

  component continue_flag_tracker is
    port(cz : in std_logic_vector(1 downto 0); carry_flag : in std_logic; zero_flag : in std_logic;
       continue_track : out std_logic);
  end component continue_flag_tracker;

  component AND_Gate is
    port (
    in_1 : in std_logic_vector(7 downto 0);
    in_2 : in std_logic_vector(7 downto 0);
    AND_out : out std_logic_vector(7 downto 0)
    ) ;
  end component AND_Gate ;

  component data_postfix is 
  port (data_in : in std_logic_vector(8 downto 0); 
  	  data_out : out std_logic_vector(15 downto 0));
  end component data_postfix;

  component decoder_for_Encoder is
    port(decoder_Encoder_in : in std_logic_vector(2 downto 0);
     decoder_Encoder_out : out std_logic_vector(7 downto 0));
  end component decoder_for_Encoder;

  component op_code_finder is
    port (
    t1 : in std_logic_vector(15 downto 0);
    op_code : out std_logic_vector(3 downto 0));
  end component op_code_finder;

  component PE is
    port (
    pe_in : in std_logic_vector(7 downto 0);
    pe_out : out std_logic_vector(2 downto 0)
    ) ;
  end component PE;

  component memory is
  port (

    clk : in std_logic; 
	 rst : in std_logic;
    memory_rd : in std_logic;
    memory_wr : in std_logic;
    address_in : in std_logic_vector(15 downto 0);
    data_in : in std_logic_vector(15 downto 0);
    data_out : out std_logic_vector(15 downto 0)
  
    ) ;

  end component memory; 

  component Register_File is
    port (
    clk : in std_logic;
    R : in std_logic; 
    W: in std_logic;

    A1 : in std_logic_vector(2 downto 0);
    A2 : in std_logic_vector(2 downto 0);
    A3 : in std_logic_vector(2 downto 0); 
    D3 : in std_logic_vector(15 downto 0);
    D1 : out std_logic_vector(15 downto 0);
    D2 : out std_logic_vector(15 downto 0)
  
    ) ;
  end component Register_File;

  component t1 is
    port(t1_in : in std_logic_vector(15 downto 0); t1_E : in std_logic; clk : in std_logic;
       t1_out : out std_logic_vector(15 downto 0));
  end component t1;

  component PC is
    port (

      PC_in : in std_logic_vector(15 downto 0);
      PC_E : in std_logic;
      PC_out : out std_logic_vector(15 downto 0);
      clk : in std_logic
    
      ) ;
  end component PC;
 
  component Temporary_Register is
    port (
  
    T_in : in std_logic_vector(15 downto 0);
    T_E : in std_logic;
    T_out : out std_logic_vector(15 downto 0);
    clk : in std_logic
  
    ) ;
    end component Temporary_Register;
    component Temporary_Register_3bit is
      port (
    
      T_in : in std_logic_vector(2 downto 0);
      T_E : in std_logic;
      T_out : out std_logic_vector(2 downto 0);
      clk : in std_logic
    
      ) ;
    end component Temporary_Register_3bit ;
    component Temporary_Register_8bit is
      port (
    
      T_in : in std_logic_vector(7 downto 0);
      T_E : in std_logic;
      T_out : out std_logic_vector(7 downto 0);
      clk : in std_logic
    
      ) ;
    end component Temporary_Register_8bit; 
    
    component SE6 is
      port (
      data_in : in std_logic_vector(5 downto 0);
      data_out : out std_logic_vector(15 downto 0)
      ) ;
    end component SE6;

    component SE9 is
      port (
      data_in : in std_logic_vector(8 downto 0);
      data_out : out std_logic_vector(15 downto 0)
      ) ;
    end component SE9;

    component Zero_checker is
      port (
      zero_check_in : in std_logic_vector(7 downto 0);
      zero_check_out : out std_logic
      ) ;
    end component Zero_checker;

    component data_path is
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
    end component data_path;

    component controlpath is 
	port (

  	t1_E : out std_logic;

  	pc_select : out std_logic;
	pc_E : out std_logic;

  	alu_op_select : out std_logic_vector(1 downto 0);
  	
  	alu_a_select : out std_logic;
  	
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


end package components_package;