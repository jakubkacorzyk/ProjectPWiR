with Ada.Text_IO;
use  Ada.Text_IO;
with Ada.Task_Identification;
use Ada.Task_Identification;

with ListaPralek;
with Programy;
with Pralki;
use Pralki;
with Klient;
use Klient;

procedure pralnia is
   
	licznik : Integer;
	tryb : Integer;
	numer : Integer;
	numer_programu : Integer;
	X : Integer := 10;
	type P is access Pralka;
	type My_Arr is array (Integer range <>) of P;


	Arr : My_Arr(1..10);



begin
	for i in 1..10 loop
		ListaPralek.set(i,False);
		Arr(i) := new Pralka(i);
	end loop;
	loop
	Ada.Text_IO.Put(ASCII.ESC & "[2J");
	Put_Line(" _____  _____            _      _   _ _____           ");    
	Put_Line("|  __ \|  __ \     /\   | |    | \ | |_   _|   /\     ");    
	Put_Line("| |__) | |__) |   /  \  | |    |  \| | | |    /  \    ");
	Put_Line("|  ___/|  _  /   / /\ \ | |    | . ` | | |   / /\ \   ");
	Put_Line("| |    | | \ \  / ____ \| |____| |\  |_| |_ / ____ \  ");
	Put_Line("|_|    |_|  \_\/_/    \_\______|_| \_|_____/_/    \_\ ");
	Put_Line("-------------------------------------------------------");
	Put_Line("Wybierz tryb :");
	Put_Line("1 - tryb reczny");
	Put_Line("2 - tryb automatyczny");
	Put_Line("0 - EXIT");
	tryb := Integer'Value(Get_Line);
	if tryb = 0 then  Abort_Task (Current_Task);
	elsif tryb = 1 then 
	loop
		Ada.Text_IO.Put(ASCII.ESC & "[2J");
		Put_Line("Witaj w naszej pralni");
		Put_Line("---------------------");
		Put_Line("Dostępne numery pralek to :");         
		for i in 1..10 loop
			if(ListaPralek.get(i) = false) then
			Put(" "&i'Img);
			end if;
		end loop;
		New_Line(2);
		Put_Line("Wybierz dostępną pralkę (lub wroc do menu = 0): ");
		numer := Integer'Value(Get_Line);
		if numer = 0 then exit;
		end if;
		if (numer <= 10 and numer >= 1) then
			if (ListaPralek.get(numer) = False) then
				Put_Line("Wybierz program : ");
				for i in 1..7 loop
					Put_Line(i'Img&". "&Programy.get_Desc(i));
				end loop;
				numer_programu := Integer'Value(Get_Line);
				ListaPralek.set(numer,True);
				Arr(numer).pierz(numer,Programy.get_Time(numer_programu));
			else
			Put_Line("Pralka zajęta");
			delay(1.0);
			end if;
		else 
			Put_Line("Wybrano zly numer. Spróbuj wybrać inną pralkę. menu = 0");
			delay(1.0);
		end if;
	end loop;
	elsif (tryb = 2) then
		licznik := 0;
		loop
			Ada.Text_IO.Put(ASCII.ESC & "[2J");
			Put_Line("Dostępne numery pralek to :");         
			for i in 1..10 loop
				if(ListaPralek.get(i) = false) then
				Put(" "&i'Img);
				end if;
			end loop;
			
			for i in 1..10 loop 
				if(listaPralek.get(i) = false) then
					Ada.Text_IO.Put(ASCII.ESC & "[2J");
					ListaPralek.set(i,True);
					Put_Line("Wybrano pralkę : " & i'IMG);
					Put_Line("--------------------------");
					Arr(i).pierz(i,Programy.get_Time(Klient.getProgram));
					Put_Line("Dostępne numery pralek to :");         
					for i in 1..10 loop
						if(ListaPralek.get(i) = false) then
						Put(" "&i'Img);
						end if;
					end loop;
					Put_Line("");
					delay(1.0);
				end if;
			end loop;		
					
		end loop;
	else Put_Line("Nie ma trybu o takim numerze !");
	end if;
end loop;

end Pralnia;
