--2to1 multiplexer for inverting a, b.
library ieee;
use ieee.std_logic_1164.all;
--Package declaration.
package inverter_mux2to1 is
	component invert_mux2to1
		port( in1, in2, s: in std_logic; inverted: out std_logic);
	end component;
end package inverter_mux2to1;

--Package definition.
library ieee;
use ieee.std_logic_1164.all;

entity invert_mux2to1 is
	port( in1, in2, s: std_logic; inverted: out std_logic);
end invert_mux2to1;
architecture behavior_inverter of invert_mux2to1 is
begin
	with s select inverted <= in1 when '0', in2 when others;	--if s=0, return in1, else return in2.
end behavior_inverter;