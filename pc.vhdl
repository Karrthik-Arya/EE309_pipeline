
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity pc is 
	port ( if_reg: out std_logic_vector(15 downto 0);
			opcode: in std_logic(3 downto 0);
			ins_mem: out std_logic_vector(15 downto 0);
			clk: in std_logic
	);
	end entity;
	
architecture working of pc is 
signal pc: std_logic_vector(15 downto 0) := x"0000"; 
begin
if_reg <=pc; 
ins_mem <= pc;
regs_write: process(clk)
begin
 if (falling_edge(clk)) then
	if (not(opcode="1111")) then
		pc <= pc+x"0001";
	end if;
end if;	
end process;
end working;