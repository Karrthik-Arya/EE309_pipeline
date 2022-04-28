library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity if_reg is 
	port(
		pc : in std_logic_vector(15 downto 0);
		id : out std_logic_vector(15 downto 0);
		clk: in std_logic;
	);
end if_reg;

architecture working of if_reg is
signal if_store: std_logic_vector(15 downto 0);
begin
	id <= if_store;
	write_proc: process(clk)
	begin 
		if(falling_edge(clk)) then
			if_store<= pc;
		end if;
	end process;
end working;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity id_reg is 
	port(
		id : in std_logic_vector(47 downto 0);
		reg_a1 : out std_logic_vector(15 downto 0);
		reg_a2 : out std_logic_vector(15 downto 0);
		reg_a3 : out std_logic_vector(15 downto 0);
		opcode: in std_logic_vector(3 downto 0);
		clk: in std_logic
	);
end id_reg;

architecture working of id_reg is
signal id_store: std_logic_vector(15 downto 0);
begin
	read_proc: process(opcode, id_store)
	begin 
		if(opcode="0001") then
			reg_a1<=id_store(11 downto 9);
			reg_a2<=id_store(8 downto 6);
			reg_a3<=id_store(5 downto 3);
		end if;
	end process;
	
	
	write_proc: process(clk)
	begin 
		if(falling_edge(clk)) then
			id_store<= id;
		end if;
	end process;
end working;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity rd_reg is 
	port(
		reg : in std_logic_vector(34 downto 0);
		ex_reg : out std_logic_vector(18 downto 0);
		alu_a: out std_logic_vector(15 downto 0);
		alu_b: out std_logic_vector(15 downto 0);
		opcode3: in std_logic_vector(15 downto 0);
		opcode4: in std_logic_vector(15 downto  0);
		clk: in std_logic;
	);
end rd_reg;

architecture working of rd_reg is
signal rd_store: std_logic_vector(34 downto 0);
begin
	read_proc: process(opcode4, rd_store )
	begin
		if(opcode4="0001") then
			alu_a<= rd_store(15 downto 0);
			alu_b<=rd_store(31 downto 16);
			ex_reg(18 downto 16)<=rd_store(34 downto 32)
		end if;
	end process;
	write_proc: process(clk)
	begin 
		if(falling_edge(clk)) then
			if (opcode3="0001") then
				rd_store<= reg;
			end if;
		end if;
	end process;
end working;