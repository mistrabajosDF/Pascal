Program mau;

type

evento=record
nombre: string;
tipo:1..5; //1: música, 2: cine, 3: obra de teatro, 4: unipersonal y 5: monólogo
lugar:string;
capmax:integer;
centrada: real;
end;

vevento=array [1..100] of evento;//deberian ser 100

procedure cargar (var e:vevento);
var
i:integer;
begin
for i:=1 to 3 do begin
with e[i] do begin
writeln ('Ingrese nombre:');
readln (nombre);
writeln ('Ingrese tipo:');
readln (tipo);
writeln ('Ingrese lugar:');
readln (lugar);
writeln ('Ingrese capacidad maxima:');
readln (capmax);
writeln ('Ingrese costo de entrada:');
readln (centrada);
end;
end;
end;

var
e:vevento;
begin
cargar (e);
end.
