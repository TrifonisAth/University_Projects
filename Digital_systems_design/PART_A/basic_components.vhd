--AND2 and OR2 package.
library ieee;
use ieee.std_logic_1164.all;
--Package declaration
package basic_components is

	component myand2
	port( in1, in2: in std_logic; out1: out std_logic);
	end component;
	
	component myor2
	port( in1, in2: in std_logic; out1: out std_logic);
	end component;
	
	component myxor2
	port( in1, in2: in std_logic; out1: out std_logic);
	end component;

end package basic_components;

--Package definition.

--AND
library ieee;
use ieee.std_logic_1164.all;

entity myand2 is
	port( in1, in2: std_logic; out1: out std_logic);
end myand2;

architecture behavior_and2 of myand2 is
begin
	out1 <= in1 and in2;
end behavior_and2;

--OR
library ieee;
use ieee.std_logic_1164.all;

entity myor2 is
	port( in1, in2: std_logic; out1: out std_logic);
end myor2;

architecture behavior_or2 of myor2 is
begin
	out1 <= in1 or in2;
end behavior_or2;

--XOR
library ieee;
use ieee.std_logic_1164.all;

entity myxor2 is
	port( in1, in2: std_logic; out1: out std_logic);
end myxor2;

architecture behavior_xor2 of myxor2 is
begin
	out1 <= in1 xor in2;
end behavior_xor2;