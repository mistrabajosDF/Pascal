Program mau;
type

siembra=record
ha:integer;
tipo:string;
meses:integer;
end;

adcultivos=array [1..3] of siembra; //deberia ser 20

empresa=record
codigo:integer;
nombre:string;
propiedad:string; //estatal o privada
ciudad: string;
cultivos:adcultivos;
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

procedure cargarcultivos (var cul:adcultivos); //Las 24 notas correspondientes a cada alumno deben quedar ordenadas de forma descendente.
var
diml:integer; h:integer; 
begin
diml:=0;
writeln ('Ingrese cant de hectareas: ');
readln (h);
while (diml<3) and (h<>0) do begin
diml:=diml+1;
cul[diml].ha:=h;
writeln ('Ingrese tipo de cultivo: ');
readln (cul[diml].tipo);
writeln ('Ingrese cant de meses del ciclo: ');
readln (cul[diml].meses);
end;
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

Procedure b (p:lista); //Nombres de las empresas de “San Miguel del Monte” que cultivan trigo y cuyo código de empresa posee al menos dos ceros.
var
i, num,cant, cero:integer;
begin

while (p<> nil) do begin
if (p^.dato.ciudad='San Miguel del Monte') then begin
for i:=1 to 3 do begin
if (p^.dato.cultivos[i].tipo='trigo') then begin
num:=p^.dato.codigo;
cant:=0;
while (num<>0) do begin
cero:=num mod 10;
if (cero=0) then
cant:=cant+1;
num:=num div 10;
end; //while num 0
if (cant>=2) then
writeln ('Empresa de San miguel que cultiva trigo y posee un codigo con al menos 2 ceros: ', p^.dato.nombre);
end; //if trigo
end;//for 
end; //if san miguel
p:=p^.sig;
end; //while p nil
end;

Procedure cantsoja (p:lista); //cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto al total de hectáreas.
var
hasoja,hatotales, i:integer; porce:real; 
begin
hasoja:=0;
hatotales:=0;
while (p<> nil) do begin
for i:=1 to 3 do begin
hatotales:=hatotales+p^.dato.cultivos[i].ha;
if (p^.dato.cultivos[i].tipo='soja') then
hasoja:=hasoja+p^.dato.cultivos[i].meses;
end;
p:=p^.sig;
end;
porce:=100/hatotales*hasoja;
writeln ('Cantidad de hectareas dedicadas a soja: ', hasoja);
writeln ('Porcentaje respecto al total: ', porce);
end;

Procedure tiempomaiz (p:lista); //empresa que dedica más tiempo al cultivo de maíz
var
maxt, i:integer; nombemp:string;
begin
while (p<> nil) do begin
for i:=1 to 3 do begin
if (p^.dato.cultivos[i].tipo='maiz') then begin
maxt:=p^.dato.cultivos[i].meses;
nombemp:=p^.dato.nombre;
end;
end; //while aux
p:=p^.sig;
end;
writeln ('La empresa que dedica mas tiempo al cultivo de maiz es: ', nombemp);
end;

Procedure parteb (var p:lista); //un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5 hectáreas de todas las empresas que no son estatales.
var
i:integer;
begin
while (p<> nil) do begin
if (p^.dato.propiedad='privada') then begin
for i:=1 to 3 do begin
if (p^.dato.cultivos[i].tipo='girasol') and (p^.dato.cultivos[i].ha<5) then
p^.dato.cultivos[i].meses:=p^.dato.cultivos[i].meses+1;
end; //for
end; //if propiedad
p:=p^.sig;
end;
end;

var
l, ult:lista;
begin
l:= nil;
cargarlista (l, ult);
b (l);
cantsoja (l);
tiempomaiz(l);
parteb (l);
end.
