Program mau;
type

adnotas=array [1..24] of integer ;

alumno=record
num:integer;
apellido,nombres, mail:string;
anioing, anioegr:integer;
notas:adnotas; //notas obtenidas ​en cada una de las 24 materias que aprobó
end;

lista = ^nodo;

nodo=record
dato:alumno;
sig:lista;
end;

procedure NodoOrd(var l, ult : lista; a:alumno);
var
aux : lista;
begin
new(aux);
aux^.dato:= a;
aux^.sig:=nil;
If (l=nil) then
L:=aux
else
ult^.sig:=aux;
ult:=aux;
end;

procedure cargarnotas (var notas:adnotas); //Las 24 notas correspondientes a cada alumno deben quedar ordenadas de forma descendente.
var
diml, num:integer;
begin
diml:=0;
writeln ('Ingrese nota: ');
readln (num);
while (diml<3) do begin //Deberia ser 24
diml:=diml+1;
notas [diml]:=num; //ver como cambia aca
writeln ('Ingrese nota: ');
readln (num);
end;
end;

Procedure leeralumno (var a:alumno);
begin
writeln('Ingrese num de alumno: ');
readln(a.num);
if (a.num<>-1) then begin
writeln('Ingrese apellido: ');
readln(a.apellido);
writeln('Ingrese nombre: ');
readln(a.nombres);
writeln('Ingrese mail: ');
readln(a.mail);
writeln('Ingrese ano ingreso: ');
readln(a.anioing);
writeln('Ingrese ano egreso: ');
readln(a.anioegr);
cargarnotas (a.notas);
end;
end;

Procedure cargarlista (var l, ult:lista);
var
a:alumno;
begin
leeralumno (a);
while (a.num<>-1) do begin
NodoOrd (l, ult, a);
leeralumno (a);
end;
end;

Procedure imprimirlista (p:lista);
begin
writeln ('proceso impri');
while (p<> nil) do begin
writeln ('Version android: ', p^.dato.nombres);
p:=p^.sig;
end;
end;

procedure promedio (p:lista); //promedio de notas obtenido por cada alumno.
var
prom:real; i, total:integer;
begin
while (p<> nil) do begin
total:=0;
for i:=1 to 3 do begin //Deberia ser 24
total:=total+p^.dato.notas [i];
end; //for
prom:=total/3;
writeln ('El promedio obtenido por el alumno es: ', prom);
p:=p^.sig;
end;//while
end;

Procedure numparpar (p:lista); //cant alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente por dígitos impares.
var
impar, cantimp, num:integer; imparb:boolean;
begin
cantimp:=0;
while (p<> nil) do begin

if (p^.dato.anioing=2012) then begin
num:=p^.dato.num;
imparb:=true;

while (num<>0) and (imparb=true) do begin
if ((num mod 2)=0) then
imparb:=false;
num:=num div 10;
if (num=0) then
cantimp:=cantimp+1
end;//end del while num
end; //del if grande
p:=p^.sig;
end;//end del while p nil
writeln ('Cant de alumnos ingr 2012 c/num de alumcompuesto únicamente por dígitos impares: ', cantimp);
end; //proceso


Procedure masnerd (p:lista); //El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido se recibieron
var
nerd, nerd2:integer; ap1, nomb1, mail1, ap2, nomb2, mail2:string;
begin
nerd:=32000;
nerd2:=32000;
while (p<> nil) do begin
if ((p^.dato.anioegr-p^.dato.anioing)<nerd) then begin
nerd2:=nerd;
ap2:=ap1;
nomb2:=nomb1;
mail2:=mail1;

nerd:=p^.dato.anioegr-p^.dato.anioing;
ap1:=p^.dato.apellido;
nomb1:=p^.dato.nombres;
mail1:=p^.dato.mail;
end //if
else
if ((p^.dato.anioegr-p^.dato.anioing)<nerd2) then begin
nerd2:=p^.dato.anioegr-p^.dato.anioing;
ap2:=p^.dato.apellido;
nomb2:=p^.dato.nombres;
mail2:=p^.dato.mail;
end;
p:=p^.sig;
end; //while
writeln ('Los alumnos que mas rapido se recibieron son: ', ap1,'  ', nomb1,'  ', mail1, ' y ', ap2,'  ', nomb2,'  ', mail2);
end;



var
l, ult:lista;
begin
l:= nil;
cargarlista (l, ult);
promedio (l);
numparpar(l);
masnerd(l);
end.


//Las 24 notas correspondientes a cada alumno deben quedar ordenadas de forma descendente.
//b. La c
//c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido se recibieron
//3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de la estructura generada en el inciso 1. El alumno puede no existir.
