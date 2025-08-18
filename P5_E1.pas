program sumador;
{
a)Qué valores toma la variable ​numeros​ al finalizar el primer bloque ​for​? 
1 2 3 4 5 6 7 8 9 10
b) Al terminar el programa, con qué valores finaliza la variable números? 
1 3 6 10 15 21 28 36 45 55
}
	type
		vnums=array[1..10] of integer;

	var
		numeros:vnums; i:integer;

	begin
		for i:=1 to 10 do
			numeros[i]:=i;

		for i:=1 to 10 do
			writeln ('num: ', numeros[i]);

		for i:=2 to 10 do
			numeros[i]:= numeros[i] + numeros[i-1];

		for i:=1 to 10 do
			writeln ('Num: ', numeros[i]);

	end.


