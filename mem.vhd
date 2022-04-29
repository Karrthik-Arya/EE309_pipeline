library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem is
	port(
	 exe_out_reg_a3: in std_logic_vector(2 downto 0);
	 exe_out_alu: in std_logic_vector(15 downto 0);
	 opcode5: in std_logic_vector(3 downto 0);
	 clk : in std_logic;
	 ins_addr: in std_logic_vector(15 downto 0);
	 ir_data: out std_logic_vector(15 downto 0);
	 mem_data: out std_logic_vector(15 downto 0);
	 memreg_out_reg_a3: out std_logic_vector(2 downto 0);
	 	 
	 );
	 end entity;
	 
architecture working of mem is
	type mem_array is array (0 to 31 ) of std_logic_vector (15 downto 0);
	signal mem_extrastore std_logic_vector (18 downto 0);
	signal mem_data: mem_array :=(
   x"0000",x"0000", x"0000", x"0000",
	x"0000",x"0000", x"0000", x"0000",
	x"0000",x"0000", x"0000", x"0000",
	x"0000",x"0000", x"0000", x"0000",
	x"0000",x"0000", x"0000", x"0000",
   x"0000",x"0000", x"0000", x"0000",
	x"0000",x"0000", x"0000", x"0000",
	x"0000",x"0000", x"0000", x"0000"
   ); 
	
	
	signal mem_ins: mem_array := (
	x"0000", x"0000", x"0000", x"0000",
	x"0000",x"0000", x"0000", x"0000",
	x"0000",x"0000", x"0000", x"0000",
	x"0000",x"0000", x"0000", x"0000",
	x"0000",x"0000", x"0000", x"0000",
   x"0000",x"0000", x"0000", x"0000",
	x"0000",x"0000", x"0000", x"0000",
	x"0000",x"0000", x"0000", x"0000");
	begin
	mem_action: process(clk,opcode5)
	begin
	if (falling_edge(clk)) then
		if (opcode5 = "0001") then
		mem_extrastore(18 downto 16) <= exe_out_reg_a3(2 downto 0);
		mem_extrastore(15 downto 0) <= exe_out_alu(15 downto 0);
		end if;
	end if;	
	end process;
	mem_read: process(mem_extrastore, opcode5)
	begin
		if(opcode5 = "0001") then
		memreg_out_reg_a3(2 downto 0) <= mem_extrastore(18 downto 16);
		mem_data <= mem_extrastore(15 downto 0);
		end if;
	end process;
	ir_data <= mem_ins(to_integer(unsigned(ins_addr)));
end working;
	
	
	
	