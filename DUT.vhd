library ieee;
use ieee.std_logic_1164.all;
entity DUT is
port ( input_vector : in std_logic_vector(0 downto 0);
			output_vector: out std_logic_vector(3 downto 0));
end entity;

architecture DutWrap of DUT is
	signal carry, zero: std_logic;
	
	component ir is 
		port (
		id: out std_logic(3 downto 0);
		mem: in std_logic_vector(15 downto 0);
		clk: in std_logic;
		opcode1: out std_logic_vector(3 downto 0);
		opcode2: out std_logic_vector(3 downto 0);
		opcode3: out std_logic_vector(3 downto 0);
		opcode4: out std_logic_vector(3 downto 0);
		opcode5: out std_logic_vector(3 downto 0);
		opcode6: out std_logic_vector(3 downto 0)
	) ;
	end component;
	
	component mem is 
	port(  exe_out_reg_a3: in std_logic_vector(2 downto 0);
	 exe_out_alu: in std_logic_vector(15 downto 0);
	 opcode5: in std_logic_vector(3 downto 0);
	 clk : in std_logic;
	 ins_addr: in std_logic_vector(15 downto 0);
	 ir_data: out std_logic_vector(15 downto 0);
	 mem_data: out std_logic_vector(15 downto 0);
	 memreg_out_reg_a3: out std_logic_vector(2 downto 0);
	 );
	end component;
	
	component registers is 
	port (reg_a1: in std_logic_vector(2 downto 0);
			reg_a2: in std_logic_vector(2 downto 0);
			reg_a3: in std_logic_vector(2 downto 0);
			reg_rd: out std_logic_vector(34 downto 0);
			opcode3: in std_logic_vector(3 downto 0);
			--reg_rd_reg3: out std_logic_vector(15 downto 0);
			write_reg: in std_logic;
			clk: in std_logic;
	);
	end component;
	
	
	component sign_extender_7_component is
	port(ir_8_0: in std_logic_vector(8 downto 0);
	 alu: out std_logic_vector(15 downto 0);
	 state: in std_logic_vector(5 downto 0)
	 
	 );
	end component;
	
	
	component sign_extender_10_component is
	port(ir_5_0: in std_logic_vector(5 downto 0);
	 alu: out std_logic_vector(15 downto 0);
	 state: in std_logic_vector(5 downto 0)
	 );
	end component;
	
	component shifter_7 is 
	port (ir_8_0: in std_logic_vector(8 downto 0);
			rf_d3: out std_logic_vector(15 downto 0);
			state: in std_logic_vector(5 downto 0)
	);
	end component;
	
	
	component shifter_1 is 
	port (t2: in std_logic_vector(15 downto 0);
			alu_a: out std_logic_vector(15 downto 0);
			state: in std_logic_vector(5 downto 0)
	);
	end component;
	
	component pc is 
	port (if_reg: out std_logic_vector(15 downto 0);
			opcode: in std_logic(3 downto 0);
			ins_mem: out std_logic_vector(15 downto 0);
			clk: in std_logic
	);
	end component;

component alu is
	port(opcode4: in std_logic_vector(3 downto 0);
	 alu_a: in std_logic_vector(15 downto 0);
	 alu_b: in std_logic_vector(15 downto 0);
	 reg_a3: in std_logic_vector(2 downto 0);
	 ex_reg: out std_logic_vector(15 downto 0);
	 alu_reg_a3: out std_logic_vector(2 downto 0)
	 );
	 end component;
	 
component ins_dec is
	port (
	ins_dec_reg: in std_logic_vector(15 downto 0);
	clk: in std_logic	
	op_code: in std_logic_vector(3 downto 0);
		reg_1: out std_logic_vector(2 downto 0);
		reg_2: out std_logic_vector(2 downto 0);
		reg_3: out std_logic_vector(2 downto 0);
		cz: out std_logic_vector(1 downto 0);
		imm_6: out std_logic_vector(5 downto 0);
		imm_9: out std_logic_vector(8 downto 0);
		write_reg: out std_logic
			
	) ;
end component;


component if_reg is 
	port(
		ir : in std_logic_vector(15 downto 0);
		id : out std_logic_vector(15 downto 0);
		clk: in std_logic;
	);
end component;

component id_reg is 
	port(
		id : in std_logic_vector(47 downto 0);
		reg_a1 : out std_logic_vector(15 downto 0);
		reg_a2 : out std_logic_vector(15 downto 0);
		reg_a3 : out std_logic_vector(15 downto 0);
		opcode: in std_logic_vector(3 downto 0);
		clk: in std_logic
	);
end component;


component rd_reg is 
	port(
		reg : in std_logic_vector(34 downto 0);
		ex_reg : out std_logic_vector(18 downto 0);
		alu_a: out std_logic_vector(15 downto 0);
		alu_b: out std_logic_vector(15 downto 0);
		opcode3: in std_logic_vector(15 downto 0);
		opcode4: in std_logic_vector(15 downto  0);
		clk: in std_logic;
	);
end component;

component execute_reg is 
	port(
		mem_reg_a3: out std_logic_vector(2 downto 0);
		alu_result: out std_logic_vector(15 downto 0);
		alu_out: in std_logic_vector(15 downto 0);
		exe_reg_a3:  in std_logic_vector(2 downto 0);-- execute stage reg_a3 ki value
		opcode4: in std_logic_vector(15 downto 0);
		opcode5: in std_logic_vector(15 downto  0);
		clk: in std_logic;
	);
end execute_reg;

component memory_reg is 
	port(
		mem_out_dat: in std_logic_vector(15 downto 0);
	   mem_out_reg_a3: in std_logic_vector(2 downto 0);
		opcode5: in std_logic_vector(3 downto 0);
		opcode6: in std_logic_vector(3 downto 0);
		clk: in std_logic;
		wb_in: out std_logic_vector(18 downto 0);
	);
end memory_reg;

signal w_ir_if, w_if_id, w_id_reg, w_rd_alua, w_rd_alub, w_ex_alu, curr_ins, w_pc_mem: std_logic_vector(15 downto 0);
signal w_reg_a1, w_reg_a2, w_reg_a3, w_rd_ex: std_logic_vector(2 downto 0);
signal w_wb, w_exec_mem: std_logic_vector(18 downto 0);
signal w_rd_reg: std_logic_vector(34 downto 0);


begin
		
		ir_instance: ir
			port map(
			clk => input_vector(0),
			mem => curr_ins,
			id => w_ir_if,
			opcode1 => opcode1,
			opcode2 => opcode2,
			opcode3 => opcode3,
			opcode4 => opcode4,
			opcode5 => opcode5,
			opcode6 => opcode6
			);
			
		if_reg_instance: if_reg
		port map(
			ir  => w_ir_if,
			clk => input_vector(0),
			id => w_if_id
		);
		
		id_instance: ins_dec
		port map(
			clk => input_vector(0),
			ins_dec_reg => w_if_id,
			op_code => opcode2,
			id_reg => w_id_reg
		);
		
		id_reg_instance: id_reg
		port map(
			id => w_id_reg,
			opcode => opcode3,
			reg_a1 => w_reg_a1,
			reg_a2 => w_reg_a2,
			reg_a3 => w_reg_a3
		);
		
		reg_instance: registers
				port map(
					reg_a1 => w_reg_a1,
					reg_a2 => w_reg_a2,
					reg_a3 => w_reg_a3,
					reg_rd => w_rd_reg,
					opcode3 => opcode3,
					clk => input_vector(0),
					reg_wb => w_wb
				);	
				
				
		rd_reg_instance: rd_reg
			port map(
				clk => input_vector(0),
				reg => w_rd_reg,
				ex_reg=> w_rd_ex,
				alu_a => w_rd_alua,
				alu_b => w_rd_alub,
				opcode3 => opcode3,
				opcode4 => opcode4
				
			);
		
		alu_instance: alu
					port map(
						 opcode4=> opcode4,
						 alu_a=> w_rd_alua,
						 alu_b=> w_rd_alub,
						 ex_reg=> w_ex_alu
					);
					
		exec_reg_instance: exec_reg
			port map(
				alu =>w_ex_alu,
				rd_reg => w_rd_ex,
				opcode4 => opcode4,
				opcode5 => opcode5,
				mem_reg => w_exec_mem,
				clk => input_vector(0)
			);
			
		mem_instance: mem
			port map(
				clk => input_vector(0),
				opcode5=>opcode5,
				ins_addr=> w_pc_mem,
				ir_data=>curr_ins
				);
			
		mem_reg_instance: mem_reg
			port map (
			clk=> input_vector(0),
			opcode5 => opcode5,
			opcode6=> opcode6,
			exec_reg=>	w_exec_mem,
			wb_in => w_wb
			);	
				
			pc_instance: pc
					port map (
					opcode=> opcode1,
					clk=> input_vector(0),
					ins_mem=>w_pc_mem,
					);
				
					
end DutWrap;

