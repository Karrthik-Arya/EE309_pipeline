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
	port(exe_out_alu: in std_logic_vector(15 downto 0);
	 opcode5: in std_logic_vector(3 downto 0);
	 clk : in std_logic;
	 ins_addr: in std_logic_vector(15 downto 0);
	 ir_data: out std_logic_vector(15 downto 0);
	 mem_data: out std_logic_vector(15 downto 0)	
	 );
	end component;
	
	component registers is 
	port (reg_a1: in std_logic_vector(2 downto 0);
			reg_a2: in std_logic_vector(2 downto 0);
			reg_a3: in std_logic_vector(2 downto 0);
			reg_rd: out std_logic_vector(34 downto 0);
			opcode3: in std_logic_vector(3 downto 0);
			--reg_rd_reg3: out std_logic_vector(15 downto 0);
			clk: in std_logic
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
	 ex_reg: out std_logic_vector(15 downto 0)
	 );
	 end component;
	 
component ins_dec is
	port (
		ins_dec_reg: in std_logic_vector(15 downto 0);
	clk: in std_logic	
	op_code: in std_logic_vector(3 downto 0);
		id_reg: out std_logic_vector(15 downto 0)
			
	) ;
end component;


component if_reg is 
	port(
		ir : in std_logic_vector(15 downto 0);
		id : out std_logic_vector(15 downto 0);
		clk: in std_logic
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
		ex_reg : out std_logic_vector(2 downto 0);
		alu_a: out std_logic_vector(15 downto 0);
		alu_b: out std_logic_vector(15 downto 0);
		opcode3: in std_logic_vector(15 downto 0);
		opcode4: in std_logic_vector(15 downto  0);
		clk: in std_logic
	);
end component;

component execute_reg is 
	port(
		alu : in std_logic_vector(15 downto 0);
		rd_reg: in std_logic_vector(2 downto 0);
		opcode4: in std_logic_vector(15 downto 0);
		opcode5: in std_logic_vector(15 downto  0);
		mem_reg: out std_logic_vector(18 downto 0);
		clk: in std_logic
	);
end execute_reg;

component memory_reg is 
	port(
		exec_reg: in std_logic_vector(18 downto 0);
		opcode5: in std_logic_vector(3 downto 0);
		opcode6: in std_logic_vector(3 downto 0);
		clk: in std_logic;
		wb_in: out std_logic_vector(18 downto 0)
	);
end memory_reg;


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
					clk => input_vector(0)
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
			
		execute_reg_instance: execute_reg
			port map(
				mem_reg_a3: out std_logic_vector(2 downto 0);
		alu_result: out std_logic_vector(15 downto 0);
		alu_out: in std_logic_vector(15 downto 0);
		exe_reg_a3 => -- execute stage reg_a3 ki value
		opcode4 => opcode4,
		opcode5 => opcode5,
		clk => input_vector(0)
			);	
			
		
		alu_instance: alu
					port map(
						opcode4: opcode4,
	 alu_a: w_rd_alua,
	 alu_b: w_rd_alub;
	 reg_a3: ;
	 ex_reg: out std_logic_vector(15 downto 0);
	 alu_reg_a3:
					);
					
		
		
		mem_instance: mem
			port map(
				state => state,
				clk => input_vector(0),
				t1_addr => w_addr1,
				t3_addr => w_addr3,
				data_t1 => w_din_t1,
				data_t2=> w_din_t2,
				data_2 => w_dout,
				ir_data => curr_ins,
				ins_addr => w_ins_addr
			);
								
				
				pc_instance: pc
					port map (
					state=> state,
					clk => input_vector(0),
					alu_c => w_alu_pcout,
					reg=> w_pcout_reg,
					reg_out => w_pc_reg,
					alu_a=> w_pc_aluin,
					data_1=> w_ins_addr
					);
					
				shift1_instance: shifter_1
					port map (
						state=> state,
						t2=> w_t2_1s,
						alu_a=>w_1s
					);
					
				shift7_instance: shifter_7
					port map (
					 state=> state,
					 ir_8_0=> w4,
					 rf_d3=>w_shift7_reg
					);
					
				sign_ex10_instance: sign_extender_10_component
					port map (
						state=> state,
						ir_5_0=> w5,
						alu=> w_se10
					);
					
				sign_ex7_instance: sign_extender_7_component
					port map (
						state=> state,
						ir_8_0=> w4,
						alu=> w_se7
					);
				
					
end DutWrap;

