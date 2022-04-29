
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity registers is 
	port (reg_a1: in std_logic_vector(2 downto 0);
			reg_a2: in std_logic_vector(2 downto 0);
			reg_a3: in std_logic_vector(2 downto 0);
			reg_rd: out std_logic_vector(34 downto 0);
			opcode3: in std_logic_vector(3 downto 0);
			opcode6: in std_logic_vector(3 downto 0);
			reg_wb: in std_logic_vector(18 downto 0);
			clk: in std_logic
	);
	end entity;
	
architecture working of registers is 
type mem_array is array (0 to 7 ) of std_logic_vector (15 downto 0);
signal regs: mem_array :=(
   x"0001",x"0002", x"0005", x"0001",
	x"0002",x"0000", x"0000", x"0000"
   ); 
begin

regs_read: process(reg_a1, reg_a2)
begin 
	if(opcode3="0001")then
		reg_rd(15 downto 0)<= regs(to_integer(unsigned(reg_a1)));
		reg_rd(31 downto 16)<= regs(to_integer(unsigned(reg_a2)));
		reg_rd(34 downto 32)<= reg_a3;
	end if;
 end process;
 
regs_write: process(clk)
variable temp : integer;
begin
	if (falling_edge(clk)) then
		if(opcode6="0001")then
			temp := to_integer(unsigned(reg_wb(18 downto 16)));
			regs(temp)<= reg_wb(15 downto 0);
		end if;
	end if;
end process;
end working;