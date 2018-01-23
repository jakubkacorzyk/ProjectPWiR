with Ada.Text_IO;
use  Ada.Text_IO;
with Ada.Task_Identification; 
use Ada.Task_Identification;

procedure pralnia is

	type ListaPralek is array (Positive range <>) of Boolean;
	lista_pralek : ListaPralek(1..10);
	numer : Integer;
	X : Integer := 10;
	
	task type P (Param : Integer) is 
		entry pierz(id_pralki : in integer ; czas_programu : duration);
	end P;
	
	type Program is access P;
	
	type My_Arr is array (Integer range <>) of Program;
	
    task body P is 
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
			lista_pralek(id_p) := False;
			typ :=0;
			end if;
		end loop;
	end P;
	
	
	
	
	
	Arr : My_Arr(1..10);
	

begin
	for i in lista_pralek'Range loop
		lista_pralek(i) := False;
		Arr(i) := new P(i);
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
		
		if (lista_pralek(numer) = False and numer <= 10 and numer >= 1) then
			lista_pralek(numer) := True;
			Arr(numer).pierz(numer,2.0);
		else 
			Put_Line("Pralka zajęta lub wybrano zly numer. Spróbuj wybrać inną pralkę");
			delay(1.0);
		end if;
	end loop;
	
end Pralnia;
