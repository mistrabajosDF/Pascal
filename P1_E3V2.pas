Program Prac1Ejer3;
	//Dados 3 numeros ingresados por teclado busca el menor, mayor y medio
	//Si dos son el mismo, el valor medio queda en 0
	var
		numuno, numdos, numtres, max, min, medio:integer;
	begin
		write ('Escriba primer numero: ');
		read (numuno);
		min:=numuno;
		max:=numuno;
		write ('Escriba segundo numero: ');
		read (numdos);
		If (numdos<min) then
			min:=numdos
		else
			max:=numdos;
		write ('Escriba tercer numero: ');
		read (numtres);
		If (numtres<min) then
			min:=numtres
		else 
			If (numtres>max) then
				max:=numtres;
		If (numuno<>max) and (numuno<>min) then
			medio:=numuno
		else
			If (numdos<>max) and (numdos<>min) then
				medio:=numdos
			else
				If(numtres<>max) and (numtres<>min) then
					medio:=numtres;
		write ('Num mayor: ', max, '. Num medio: ', medio, '. Num menor: ', min);
	end.
