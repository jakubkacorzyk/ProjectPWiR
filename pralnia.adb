with Ada.Text_IO;
use  Ada.Text_IO;


with ListaPralek;
with Programy;
with Pralki;
use Pralki;
with Klient;
use Klient;

procedure pralnia is

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
		New_Line(24);
		Put_Line("Witaj w naszej pralni");
		Put_Line("Dostępne numery pralek to :");
		for i in 1..10 loop
			if(ListaPralek.get(i) = false) then
			Put(" "&i'Img);
			end if;
		end loop;
		New_Line(2);
		Put_Line("Wybierz dostępną pralkę : ");
		numer := Integer'Value(Get_Line);
		
		
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
			Put_Line("Wybrano zly numer. Spróbuj wybrać inną pralkę");
			delay(1.0);
		end if;
	end loop;
	
end Pralnia;
