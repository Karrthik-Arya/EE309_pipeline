
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity registers is 
	port (reg_a1: in std_logic_vector(2 downto 0);
			reg_a2: in std_logic_vector(2 downto 0);
			reg_a3: in std_logic_vector(2 downto 0);
			reg_rd: out std_logic_vector(34 downto 0);
			opcode3: in std_logic_vector(3 downto 0);
			--reg_rd_reg3: out std_logic_vector(15 downto 0);
			write_reg: in std_logic;
			clk: in std_logic;
	);
	end entity;
	
architecture working of registers is 
type mem_array is array (0 to 7 ) of std_logic_vector (15 downto 0);
signal regs: mem_array :=(
   x"0000",x"0000", x"0000", x"0000",
	x"0000",x"0000", x"0000", x"0000"
   ); 
begin

regs_read: process(reg_a1, reg_a2)
begin 
	if(opcodes3="0001")then
		reg_rd(15 downto 0)<= to_integer(unsigned(reg_a1));
		reg_rd(31 downto 16)<= to_integer(unsigned(reg_a2));
		reg_rd(34 downto 32)<= reg_a3;
	end if;
 end process;
 
regs_write: process(clk)
begin
	if (falling_edge(clk)) then
		if(opcodes6="0001")then
			reg_rd(to_integer(unsigned(reg_wb(18 downto 16))))<= reg_wb(15 downto 0);
		end if;
	end if;
end process;
end working;