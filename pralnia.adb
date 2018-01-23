with Ada.Text_IO;
use  Ada.Text_IO;

with ListaPralek;
with Pralki;
use Pralki;

procedure pralnia is

	numer : Integer;
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
		
		if (ListaPralek.get(numer) = False and numer <= 10 and numer >= 1) then
			ListaPralek.set(numer,True);
			Arr(numer).pierz(numer,2.0);
		else 
			Put_Line("Pralka zajęta lub wybrano zly numer. Spróbuj wybrać inną pralkę");
			delay(1.0);
		end if;
	end loop;
	
end Pralnia;
