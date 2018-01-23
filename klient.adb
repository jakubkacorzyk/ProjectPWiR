
with Ada.Numerics.Discrete_Random;
package body Klient is
	program:Integer;
	subtype ProgramRange is Integer range 1 .. 7;
	package Random_Program is new Ada.Numerics.Discrete_Random (ProgramRange);
   	use Random_Program;
   	G : Generator;	

	function getProgram return Integer is
	begin
	 return program;
	end getProgram;
begin
	program := Random(G);
end Klient;
