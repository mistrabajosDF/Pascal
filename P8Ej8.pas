Program mau;
type
cuentas=record
numo:integer;
dnio:longint;
numd:integer;
dnid:longint;
fecha:string;
hora:string;
monto:real;
motivo: 1..7 //1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7:varios
end;

lista = ^nodo;

nodo=record
dato:cuentas;
sig:lista;
ult:lista;
end;

procedure NodoOrd(var l, ult : lista; c:cuentas);
var
aux : lista;
begin
new(aux);
aux^.dato:= c;
aux^.sig:=nil;
If (l=nil) then
L:=aux
else
ult^.sig:=aux;
ult:=aux;
end;

Procedure leercuentas (var c:cuentas);
begin
writeln('Ingrese numero de cuenta de origen: ');
readln(c.numo);
if (c.numo<>-1) then begin
writeln('Ingrese dni titular cuenta de origen: ');
readln(c.dnio);
writeln('Ingrese numero de cuenta de destino: ');
readln(c.numd);
writeln('Ingrese dni titular cuenta de destino: ');
readln(c.dnid);
writeln('Ingrese fecha: ');
readln(c.fecha);
writeln('Ingrese hora: ');
readln(c.hora);
writeln('Ingrese monto: ');
readln(c.monto);
writeln('Ingrese motivo (1 a 7): ');
readln(c.motivo);
end;
end;

Procedure cargarlista (var l, ult:lista);
var
c: cuentas;
begin
leercuentas (c);
while (c.numo<>-1) do begin
NodoOrd (l, ult, c);
leercuentas (c);
end;
end;

Procedure agregarcuenta3 (var a:lista; numo, numd, motivo:integer; dnio, dnid:longint; fecha, hora:string; monto:real);
var nue,aux2:lista;
begin
new(nue);
nue^.dato.numo:=numo;
nue^.dato.dnio:=dnio;
nue^.dato.numd:=numd;
nue^.dato.dnid:=dnid;
nue^.dato.fecha:=fecha;
nue^.dato.hora:=hora;
nue^.dato.monto:=monto;
nue^.dato.motivo:=motivo;
nue^.sig:=nil;
if (a=nil) then
a:=nue
else begin
aux2:=a^.ult;
aux2^.sig:=nue;
end;
a^.ult:=nue;
end;

procedure listanueva(l:lista; var l3:lista);
begin
while (l<>nil) do begin
if (l^.dato.dnio<>l^.dato.dnid) then 
agregarcuenta3(l3, l^.dato.numo, l^.dato.numd, l^.dato.motivo, l^.dato.dnio, l^.dato.dnid, l^.dato.fecha, l^.dato.hora, l^.dato.monto);
l:=l^.sig;
end;
end;

Procedure imprimir (p:lista);
begin
while (p<> nil) do begin
writeln ('Numero de la cuenta de origen: ', p^.dato.numo);
writeln ('DNI de la cuenta de origen: ', p^.dato.dnio);
writeln ('Numero de la cuenta de destino: ', p^.dato.numd);
writeln ('DNI de la cuenta de destino: ', p^.dato.dnid);
writeln ('Fecha: ', p^.dato.fecha);
writeln ('Hora: ', p^.dato.hora);
writeln ('Motivo: ', p^.dato.motivo);
p:=p^.sig;
end;
end;

procedure monto(a:lista);
begin
while (a<>nil) do begin
writeln ('Monto transferido: ',a^.dato.monto);
a:=a^.sig;
end;
end;

procedure motivo (a:lista);
var
adm:array [1..7] of integer; i, max, motmax:integer;
begin
for i:=1 to 7 do //inicia arreglo en 0
adm [i]:=0;

while (a<>nil) do begin
adm [a^.dato.motivo]:=adm[a^.dato.motivo]+1;
a:=a^.sig;
end;

max:=-1;
for i:=1 to 7 do begin
if (adm [i]>max) then begin
motmax:=i;
max:=adm [i];
end; //if
end; //for
writeln ('El codigo del motivo que mas transferencias a terceros tuvo es: ', motmax);
end;


var
l, ult, lista3:lista;
begin
l:= nil;
lista3:=nil;
cargarlista (l, ult);
imprimir (l);
listanueva (l, lista3);
imprimir (lista3);
monto (lista3);
motivo (lista3);
end.
