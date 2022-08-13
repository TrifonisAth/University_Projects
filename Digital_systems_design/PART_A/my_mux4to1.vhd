--4to1 multiplexer package.
library ieee;
use ieee.std_logic_1164.all;
--Package declaration.
package my_mux4to1 is
	component my_mux4to1_component
	port (w0, w1, w2, w3: in std_logic; s: in std_logic_vector(1 downto 0); f: out std_logic);
	end component;
end my_mux4to1;

--Package definition.
library ieee;
use ieee.std_logic_1164.all;

entity my_mux4to1_component is
	port (w0, w1, w2, w3 : in std_logic; s: in std_logic_vector(1 downto 0); f: out std_logic);
end my_mux4to1_component;
architecture behavior of my_mux4to1_component is
begin
	with s select
	f <= w0 when "00", w1 when "01", w2 when "10", w3 when others;	--select operation.
end behavior;