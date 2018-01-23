with Ada.Task_Identification; 
use Ada.Task_Identification;
with Ada.Text_IO;
use  Ada.Text_IO;
with Ada.Calendar;
use Ada.Calendar;
with ListaPralek;

package body Pralki is


  task body Pralka is

   	Next_Time : Time := Clock ;
	id_p : integer;
	begin
		loop
		accept pierz(id_pralki : in integer ; czas_programu : in duration) 
			do

					id_p :=id_pralki;
					Put_Line("Rozpoczynam pranie w pralce numer :" & id_pralki'Img & " czas wybranego programu to programu :" & czas_programu'Img);
				Next_Time := Clock + czas_programu;	
			end pierz;
			delay until Next_Time;
			ListaPralek.set(id_p,False);
		end loop;
	end Pralka;

end Pralki;
