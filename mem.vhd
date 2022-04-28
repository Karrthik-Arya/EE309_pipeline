library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mem is
	port( 
	 ir_data: out std_logic_vector(15 downto 0);
	 ins_addr: in std_logic_vector(15 downto 0);
	 clk : in std_logic
	 );
	 end entity;
	 
architecture working of mem is
	type mem_array is array (0 to 31 ) of std_logic_vector (15 downto 0);
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
	x"0000",x"0000", x"0000", x"0000"
	);
	begin
	mem_action: process(clk)
	begin
	if (falling_edge(clk)) then
	end if;
	end process;
	ir_data <= mem_ins(to_integer(unsigned(ins_addr)));
end working;
	
	
	
	