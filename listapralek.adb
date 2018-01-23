with Ada.Synchronous_Task_Control;
use Ada.Synchronous_Task_Control;

package body ListaPralek is


 type ListaPralek is array (Positive range <>) of Boolean;


protected Lista is
	procedure setState(number : in Integer; bool : in Boolean);
	function getState(number : in Integer) return Boolean;
	private
	lista_pralek : ListaPralek(1..10) ;
end Lista;

protected body Lista is
	procedure setState(number : in Integer; bool : in Boolean) is
	begin
		lista_pralek(number) :=bool;
	end setState;
	function getState(number : in Integer) return Boolean is
  	tmp : Boolean;
	begin
		tmp :=lista_pralek(number);
		return tmp;
	end getState;
end Lista;



procedure set(number : in Integer; bool : in Boolean) is
begin
	
	Lista.setState(number,bool);

end set;

function get(number : in Integer) return Boolean is
  tmp : Boolean;
begin
	return Lista.getState(number);
end get;

end ListaPralek;
