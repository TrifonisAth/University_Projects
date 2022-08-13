--fullAdder package.

--Package declaration.
library ieee;
use ieee.std_logic_1164.all;
package fullAdd_component is
	component fullAdd
	port( Cin,in1, in2: in std_logic; s, Cout: out std_logic);
	end component;
end package fullAdd_component;

--Package definition.
library ieee;
use ieee.std_logic_1164.all;
	entity fullAdd is
		port(Cin, in1, in2: in std_logic; s, Cout: out std_logic);
	end fullAdd;
architecture LogicFunc of fullAdd is
begin
				s <= in1 xor in2 xor Cin;	--sum.
				Cout <= (in1 and in2) or (Cin and in1) or (Cin and in2); --Carry.
end LogicFunc;