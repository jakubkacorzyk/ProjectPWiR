package body ListaPralek is

type ListaPralek is array (Positive range <>) of Boolean;
	lista_pralek : ListaPralek(1..10);

procedure set(number : in Integer; bool : in Boolean) is
begin
lista_pralek(number) :=bool;
end set;

function get(number : in Integer) return Boolean is
begin
return lista_pralek(number);
end get;

end ListaPralek;
