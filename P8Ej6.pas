Program mau;
type

objetos=record
codigo:integer;
categoria:1..7; //1:estrellas, 2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
nombre:string;
dtierra:integer;
descubridor: string;
adescub:integer;
end;

lista = ^nodo;

nodo=record
dato:objetos;
sig:lista;
end;

procedure NodoOrd(var l, ult : lista; o:objetos);
var
aux : lista;
begin
new(aux);
aux^.dato:= o;
aux^.sig:=nil;
If (l=nil) then
L:=aux
else
ult^.sig:=aux;
ult:=aux;
end;

Procedure leerobjetos (var o:objetos);
begin
writeln('Ingrese codigo: ');
readln(o.codigo);
if (o.codigo<>-1) then begin
writeln('Ingrese categoria: ');
readln(o.categoria);
writeln('Ingrese nombre: ');
readln(o.nombre);
writeln('Ingrese distancia a la tierra: ');
readln(o.dtierra);
writeln('Ingrese descubridor: ');
readln(o.descubridor);
writeln('Ingrese a?o de descubrimiento: ');
readln(o.adescub);
end;
end;

Procedure cargarlista (var l, ult:lista);
var
o: objetos;
begin
leerobjetos (o);
while (o.codigo<>-1) do begin
NodoOrd (l, ult, o);
leerobjetos (o);
end;
end;

Procedure maslejanos (p:lista);//códigos de los dos objetos más lejanos de la tierra que se hayan observado
var
lejano, lejano2, cod1, cod2:integer;
begin
lejano:=0;
lejano2:=0;
while (p<> nil) do begin
if (p^.dato.dtierra>lejano) then begin
lejano2:=lejano;
cod2:=cod1;
cod1:=p^.dato.codigo;
lejano:=p^.dato.dtierra;
end
else
if (p^.dato.dtierra>lejano2) then begin
lejano2:=p^.dato.dtierra;
cod2:=p^.dato.codigo;
end;
p:=p^.sig;
end;
writeln ('Los codigos de los dos objetos mas lejanos a la tierra son: ', cod1, ' y ', cod2);
end;

Procedure galileo (p:lista); //cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
var
cant:integer;
begin
cant:=0;
while (p<> nil) do begin
if (p^.dato.descubridor='Galileo Galilei') and (p^.dato.adescub<1600) then
cant:=cant+1;
p:=p^.sig;
end;
writeln('La cantidad de planetas descubiertos por Galilei es: ', cant);
end;

Procedure cantcategoriav2 (p:lista); //cantidad de objetos observados por cada categoría.
var
cant:array [1..7] of integer; i:integer;
begin
for i:=1 to 7 do begin
cant [i]:=0;
end;
while (p<>nil) do begin
cant [p^.dato.categoria]:=cant[p^.dato.categoria]+1;
p:=p^.sig;
end;
for i:=1 to 7 do
writeln ('La cantidad de objetos del tipo ', i, ' es: ', cant [i]);
end;

Procedure estrellapar (p:lista); //nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares.
var
par, impar, cantp, num:integer;
begin
cantp:=0;
while (p<> nil) do begin
write ('Contar estrellas.');
if (p^.dato.categoria=1) then begin //revisa que sean estrellas
par:=0;
impar:=0;
num:=p^.dato.codigo; //num=codigo

while (num<>0)  do begin
if ((num mod 2)=1) then
impar:=impar+1
else
if ((num mod 2)=0) and (num<>0) then
par:=par+1;
num:=num div 10
end; //end del while num
writeln('Cant de digitos pares: ', par);
writeln('Cant de digitos impares: ', impar);
if (par>impar) then
writeln ('Estrella con codigo con mas mas digitos pares que impares: ', p^.dato.nombre);
end; //end del if de categoria
p:=p^.sig;
end; //end del mientras de p nil
end;


var
l, ult:lista;
begin
l:= nil;
cargarlista (l, ult);
maslejanos (l);
galileo (l);
cantcategoriav2 (l);
estrellapar (l);
end.



