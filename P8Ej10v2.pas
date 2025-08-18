Program mau;
type
siembra=array [1..20] of string;

empresa=record
codigo:integer;
nombre:string;
propiedad:string; //estatal o privada
ciudad: string;
cultivos:siembra;
hectareas:integer;
meses:integer;
end;

lista = ^nodo;

nodo=record
dato:empresa;
sig:lista;
end;

procedure NodoOrd(var l, ult : lista; e:empresa);
var
aux : lista;
begin
new(aux);
aux^.dato:= e;
aux^.sig:=nil;
If (l=nil) then
L:=aux
else
ult^.sig:=aux;
ult:=aux;
end;

Procedure leerempresa (var e:empresa);
begin
writeln('Ingrese codigo: ');
readln(e.codigo);
if (e.codigo<>-1) then begin
writeln('Ingrese nombre: ');
readln(e.nombre);
writeln('Ingrese propiedad (estatal o privada): ');
readln(e.propiedad);
writeln('Ingrese ciudad: ');
readln(e.ciudad);
cargarcultivos (e.cultivos);
writeln('Ingrese cant de hectareas: ');
readln(e.hectareas);
writeln('Ingrese meses: ');
readln(e.meses);
end;
end;

Procedure cargarlista (var l, ult:lista);
var
e: empresa;
begin
leerempresa (e);
while (e.codigo<>-1) do begin
NodoOrd (l, ult, e);
leerempresa (e);
end;
end;

var
l, ult:lista;
begin
l:= nil;
cargarlista (l, ult);
end.
