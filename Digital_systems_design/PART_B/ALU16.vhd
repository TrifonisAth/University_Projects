--ALU 16-bit.
library ieee;
use ieee.std_logic_1164.all;

library work;
use work.alu_1bit.all;
use work.control_circuit.all;
use work.basic_components.all;

entity ALU16 is
	port (a, b: in std_logic_vector (15 downto 0);	--2 numbers, 16 bits each
			opcode: in std_logic_vector (2 downto 0);	--opcode has 3 bits, we use it to decide which operation should we execute.
			result: out std_logic_vector (15 downto 0);
			overflow: out std_logic);	--1 if there is an overflow, 0 if there is not.
end entity;


architecture structural of ALU16 is	
	signal x, y: std_logic;
	signal operation: std_logic_vector(1 downto 0);
	signal Carry: std_logic_vector(16 downto 0);
begin
	--control circuit.
	Step0: cc port map (opcode, x, y, operation, Carry(0));
	-- Looping through the 16 bits.
	LOOPING:
		for i in 0 to 15 generate
		ALU1bit: alu port map (a(i), b(i), Carry(i), x, y, operation, Carry(i+1), result(i));
	end generate;
	--There is an overflow if the last two carry are different.
	overflow <= Carry(15) xor Carry(16) when operation = "10" else '0'; 
end architecture;