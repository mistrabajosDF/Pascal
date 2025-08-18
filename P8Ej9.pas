Program mau;
type

peliculas=record
codigop:integer;
titulo:string;
codigog:1..8; //1: acción, 2: aventura, 3: drama,4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror
puntaje:real;
end;


lista = ^nodo;

nodo=record
dato:peliculas;
sig:lista;
end;

procedure NodoOrd(var l, ult : lista; p:peliculas);
var
aux : lista;
begin
new(aux);
aux^.dato:= p;
aux^.sig:=nil;
If (l=nil) then
L:=aux
else
ult^.sig:=aux;
ult:=aux;
end;

Procedure leerpeliculas (var p:peliculas);
begin
writeln('Ingrese codigo de pelicula: ');
readln(p.codigop);
if (p.codigop<>-1) then begin
writeln('Ingrese titulo: ');
readln(p.titulo);
writeln('Ingrese codigo de genero (1 a 8): ');
readln(p.codigog);
writeln('Ingrese puntaje: ');
readln(p.puntaje);
end;
end;

Procedure cargarlista (var l, ult:lista);
var
p: peliculas;
begin
leerpeliculas (p);
while (p.codigop<>-1) do begin
NodoOrd (l, ult, p);
leerpeliculas (p);
end;
end;

var
l, ult:lista;
begin
l:= nil;
cargarlista (l, ult);
end.

