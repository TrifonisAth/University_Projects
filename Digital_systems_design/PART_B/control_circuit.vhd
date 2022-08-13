-- The control circuit is selecting which operation will get executed.

--Package declaration.
library ieee;
use ieee.std_logic_1164.all;
package control_circuit is
	component cc
	port ( opcode: in std_logic_vector(2 downto 0); Ainvert, Binvert: out std_logic; Operation: out std_logic_vector(1 downto 0); CarryIn: out std_logic);
	end component;
end package control_circuit;

--Package definition.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cc is
	port ( opcode: in std_logic_vector(2 downto 0); Ainvert, Binvert: out std_logic; Operation: out std_logic_vector(1 downto 0); CarryIn: out std_logic);
end cc;

architecture behavior of cc is
begin
	process (opcode)
	begin
		case opcode is
			--AND
			when "000" => 
				Operation <= "00";
				Ainvert <= '0';
				Binvert <= '0';
				CarryIn <= '0';
			--OR	
			when "001" =>
				Operation <= "01";
				Ainvert <= '0';
				Binvert <= '0';
				CarryIn <= '0';
			--ADD	
			when "010" => 
				Operation <= "10";
				Ainvert <= '0';
				Binvert <= '0';
				CarryIn <= '0';
			--SUB	
			when "011" =>
				Operation <= "10";
				Ainvert <= '0';
				Binvert <= '1';
				CarryIn <= '1';
			--NOR	
			when "100" =>
				Operation <= "00";
				Ainvert <= '1';
				Binvert <= '1';
				CarryIn <= '0';
			--NAND	
			when "101" =>
				Operation <= "01";
				Ainvert <= '1';
				Binvert <= '1';
				CarryIn <= '0';
			--XOR	
			when "110" =>
				Operation <= "11";
				Ainvert <= '0';
				Binvert <= '0';
				CarryIn <= '0';
				
			when others =>
				Operation <= "00";
				Ainvert <= '0';
				Binvert <= '0';
				CarryIn <= '0';
				
		end case;
	end process;
end behavior;