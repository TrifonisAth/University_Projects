-- ALU 1bit.
library ieee;
use ieee.std_logic_1164.all;
library work;
use work.basic_components.all;
use work.inverter_mux2to1.all;
use work.my_mux4to1.all;
use work.fullAdd_component.all;

entity alu is
	port( a, b, CarryIn, AInvert, BInvert: in std_logic; Operation: in std_logic_vector(1 downto 0); CarryOut, Result: out std_logic);
end alu;
architecture structural of alu is
	signal andResult, orResult, addResult, xorResult, x, y: std_logic;
begin
	INVERTING_A: invert_mux2to1 port map( a, not a, Ainvert, x);	--if Ainvert=1 inverts a.
	INVERTING_B: invert_mux2to1 port map( b, not b, Binvert, y);	--if Binvert=1 inverts b.
	AND2: myand2 port map( x, y, andResult);
	OR2: myor2 port map( x, y, orResult);
	ADDING: fullAdd port map( CarryIn, x, y, addResult, CarryOut);
	XOR2: myxor2 port map( x, y, xorResult);
	OPER: my_mux4to1_component port map( andResult, orResult, addResult, xorResult, Operation(1 downto 0), Result);	--select operation to be returned.
end structural;