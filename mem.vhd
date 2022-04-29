library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem is
	port(
	 --exe_out_alu: in std_logic_vector(15 downto 0);
	 opcode5: in std_logic_vector(3 downto 0);
	 clk : in std_logic;
	 ins_addr: in std_logic_vector(15 downto 0);
	 ir_data: out std_logic_vector(15 downto 0);
	 mem_data: out std_logic_vector(15 downto 0)	 
	 );
	 end entity;
	 
architecture working of mem is
	type mem_array is array (0 to 31 ) of std_logic_vector (15 downto 0);
	signal mem_store: mem_array :=(
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
	b"0001000001010000", b"0001001010011000",  b"0001010011100000", x"FFFF",
	x"FFFF", X"FFFF", x"FFFF", x"0000",
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
		
	end if;	
	end process;
	mem_read: process( opcode5)
	begin
		
	end process;
	ir_data <= mem_ins(to_integer(unsigned(ins_addr)));
end working;
	
	
	
	