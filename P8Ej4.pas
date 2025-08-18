Program mau;
type

adpeso= array [0..3] of real;

madre=record
nombre, apellido:string;
peso:adpeso;
end;

lista = ^nodo;

nodo=record
dato:madre;
sig:lista;
end;

procedure NodoOrd(var l, ult : lista; m:madre);
var
aux : lista;
begin
new(aux);
aux^.dato:= m;
aux^.sig:=nil;
If (l=nil) then
L:=aux
else
ult^.sig:=aux;
ult:=aux;
end;


procedure cargarpesos (var peso:adpeso);
var
i:integer;
begin
for i:=0 to 3 do begin //deberian ser 24
writeln ('Ingrese peso: ');
readln (peso [i]);
end;
end;

Procedure leermadre (var m:madre);
begin
writeln('Ingrese nombre: ');
readln(m.nombre);
if (m.nombre<>'ZZZ') then begin
writeln('Ingrese apellido: ');
readln(m.apellido);
cargarpesos (m.peso);
end;
end;

Procedure cargarlista (var l, ult:lista);
var
m: madre;
begin
leermadre (m);
while (m.nombre<>'ZZZ') do begin
NodoOrd (l, ult, m);
leermadre (m);
end;
end;

procedure semanamax (p:lista);//Para cada embarazada, la semana con mayor aumento de peso.
var
difmax, ant:real; i, semmax:integer;
begin

while (p<> nil) do begin
difmax:=0;
ant:=p^.dato.peso[0];

for i:=1 to 3 do begin //deberian ser 24
if (p^.dato.peso[i]-ant>difmax) then begin
difmax:=p^.dato.peso[i]-ant;
semmax:=i;
ant:=p^.dato.peso[i];
end;
end;
writeln ('La semana con mayor aumento de peso de la embarazada fue la: ', semmax);
p:=p^.sig;
end;
end;

procedure aumentototal (p:lista); //El aumento de peso total de cada embarazada durante el embarazo.
var
total:real;
begin;
while (p<> nil) do begin
total:=p^.dato.peso[3]-p^.dato.peso[0];
writeln ('El aumento total de peso de la embarazada ',p^.dato.nombre,' fue de: ', total:2:2);
p:=p^.sig;
end;
end;


var
l, ult:lista;
begin
l:= nil;
cargarlista (l, ult);
semanamax(l);
aumentototal (l);
end.
