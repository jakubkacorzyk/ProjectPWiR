with Ada.Text_IO;
use  Ada.Text_IO;
with Ada.Task_Identification; 
use Ada.Task_Identification;

procedure pralnia is

	type ListaPralek is array (Positive range <>) of Boolean;
	lista_pralek : ListaPralek(1..10);
	numer : Integer;
	task Program is 
		entry pierz(id_pralki : in integer ; czas_programu : duration);
	end Program;
			
    task body Program is 
	begin
		accept pierz(id_pralki : in integer ; czas_programu : duration) 
			do
				if lista_pralek(id_pralki) = False then 
					lista_pralek(id_pralki) := True;
					Put_Line("Rozpoczynam pranie w pralce numer :" & id_pralki'Img & " czas wybranego programu to programu :" & czas_programu'Img);
					delay(czas_programu);
					Abort_Task(Current_Task);
				else 
					Put_Line("Pralka zajęta. Spróbuj wybrać inną pralkę");
					Abort_Task(Current_Task);
				end if;
			end pierz;
	end Program;
	
     
begin
	for i in lista_pralek'Range loop
		lista_pralek(i) := False;
	end loop;
	loop
		New_Line(24);
		Put_Line("Witaj w naszej pralni");
		Put_Line("Dostępne numery pralek to :");
		for i in lista_pralek'Range loop
			if(lista_pralek(i) = false) then
			Put(" "&i'Img);
			end if;
		end loop;
		New_Line(2);
		Put_Line("Wybierz dostępną pralkę : ");
		numer := Integer'Value(Get_Line);
		Program.pierz(numer,0.1);	
	end loop;
	
end Pralnia;
