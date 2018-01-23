with Ada.Task_Identification; 
use Ada.Task_Identification;
with Ada.Text_IO;
use  Ada.Text_IO;

with ListaPralek;

package body Pralki is


  task body Pralka is 
	c_programu : duration;
	id_p : integer;
	begin
		loop
		accept pierz(id_pralki : in integer ; czas_programu : in duration) 
			do

					c_programu := czas_programu;
					id_p :=id_pralki;
					Put_Line("Rozpoczynam pranie w pralce numer :" & id_pralki'Img & " czas wybranego programu to programu :" & czas_programu'Img);
					
			end pierz;
			delay(c_programu);
			ListaPralek.set(id_p,False);
		end loop;
	end Pralka;

end Pralki;
