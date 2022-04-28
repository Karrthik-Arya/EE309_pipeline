library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ir is
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
end ir;

architecture working of ir is
type ins_array is array (0 to 5 ) of std_logic_vector (15 downto 0);
signal ir_store: ins_array ;= [x"0000", x"0000", x"0000", x"0000", x"0000", x"0000"];
begin
	write_proc: process(clk)
	begin
	if(falling_edge(clk)) then
			for i in 4 downto 0 loop
				ir_store(i+1) = ir_store(i);
			end loop;
			ir_store(i) <= mem;
	end if;
	end process;
	
	opcode1<= ir_store(0);
	opcode2<= ir_store(1);
	opcode3<= ir_store(2);
	opcode4<= ir_store(3);
	opcode5<= ir_store(4);
	opcode6<= ir_store(5);

end working;