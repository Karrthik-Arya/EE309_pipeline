library ieee;
use ieee.std_logic_1164.all;
library work;
use ieee.numeric_std.all;

entity alu is
	port(opcode4: in std_logic_vector(3 downto 0);
	 alu_a: in std_logic_vector(15 downto 0);
	 alu_b: in std_logic_vector(15 downto 0);
	 ex_reg: out std_logic_vector(15 downto 0);
	 );
	 end entity;
	 
architecture working of alu is
signal carry: std_logic;
signal zero: std_logic;
begin
	compute : process(alu_a,alu_b,opcode4)
	variable temp: integer;
	begin
	 if (opcode4 = "0001") then
		 --add
		 temp := to_integer(unsigned(alu_a)) + to_integer(unsigned(alu_b));
		 if (temp>65535) then
			carry <= '1';
			ex_reg <= std_logic_vector(to_unsigned(temp-65535,16));
		
		elsif(temp=65535) then
				zero <='1';
				carry <= '0';
				ex_reg <= std_logic_vector(to_unsigned(temp,16));
			else
				zero <='0';
				carry <= '0';
				ex_reg <= std_logic_vector(to_unsigned(temp,16));
			end if;	
	
	end if;
	
	end process;
end working;