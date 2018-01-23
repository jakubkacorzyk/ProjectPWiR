package Pralki is

  task type Pralka (Param : Integer) is 
		entry pierz(id_pralki : in integer ; czas_programu : duration);
	end Pralka;

end Pralki;
