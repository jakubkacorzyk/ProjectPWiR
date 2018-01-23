package body Programy is


function get_Time(number : in Integer) return Duration is
begin
	case number is
		when 1 =>
		return 3.0;

		when 2 =>
		return 7.0;

		when 3 =>
		return 2.0;

		when 4 =>
		return 12.0;

		when 5 =>
		return 15.0;

		when 6 =>
		return 10.0;

		when 7 =>
		return 9.0;


		when others =>
		return 0.0;

	end case;

end get_Time;

function get_Desc(number : in Integer) return String is
begin
	case number is
		when 1 =>
		return "Szybki (3 s)";

		when 2 =>
		return "Codzienny (7 s)";

		when 3 =>
		return "Bawelna (20 s)";

		when 4 =>
		return "Outdoor (12 s)";

		when 5 =>
		return "Antyalergiczny (15 s)";

		when 6 =>
		return "Pranie reczne (10 s)";

		when 7 =>
		return "Sport (9 s)";


		when others =>
		return "Program nie obslugiwany";

	end case;
end get_Desc;

end Programy;
