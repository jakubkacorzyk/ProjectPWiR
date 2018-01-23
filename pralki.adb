with Ada.Task_Identification; 
use Ada.Task_Identification;
with Ada.Text_IO;
use  Ada.Text_IO;

with ListaPralek;

package body Pralki is


  task body Pralka is 
	typ : integer := 0;
	c_programu : duration;
	id_p : integer;
	begin
		loop
		accept pierz(id_pralki : in integer ; czas_programu : duration) 
			do
					typ:=1;
					c_programu := czas_programu;
					id_p :=id_pralki;
					Put_Line("Rozpoczynam pranie w pralce numer :" & id_pralki'Img & " czas wybranego programu to programu :" & czas_programu'Img);
					
			end pierz;
			if(typ = 1) then
			delay(c_programu);
			ListaPralek.set(id_p,False);
			typ :=0;
			end if;
		end loop;
	end Pralka;

end Pralki;
