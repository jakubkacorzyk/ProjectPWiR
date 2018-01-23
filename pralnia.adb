with Ada.Text_IO;
use  Ada.Text_IO;
with Ada.Task_Identification; 
use Ada.Task_Identification;

procedure pralnia is

	type ListaPralek is array (Positive range <>) of Boolean;
	lista_pralek : ListaPralek(1..10);
	numer : Integer;
	X : Integer := 1;
	
	task type P is 
		entry pierz(id_pralki : in integer ; czas_programu : duration);
	end P;
	
	type Program is access P;
	type My_Arr is array (Integer range <>) of Program;
	
    task body P is 
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
	end P;
	
	
	
	
	
	Arr : My_Arr (1 .. 10);
begin
	for i in lista_pralek'Range loop
		lista_pralek(i) := False;
		Arr(i) := new Program();
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
		Arr(numer).pierz(numer,0.1);
	end loop;
	
end Pralnia;
