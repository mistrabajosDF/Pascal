{
4. Una maternidad dispone información sobre sus pacientes.
De cada una se conoce: nombre,
apellido y peso registrado el primer día de cada semana de
embarazo (a lo sumo 42). La
maternidad necesita un programa que analice esta información,
determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.

}

program e4pr8;
const
  SEMANA_MAX=42;
type

  rangoSemanas=1..SEMANA_MAX;
  pesosSemanas=array[rangoSemanas]of real;
  Embarazada=record
    nom,ape:string;
    pesos:pesosSemanas;
    cantSemanas:rangoSemanas;
  end;

  lista=^nodo;
  nodo=record
    dato:Embarazada;
    sig:lista;
  end;

procedure cargarlista(var l:lista);//Se dispone implementado
begin
  l:=nil;
end;

//punto A
function semanaMaxor(v:pesosSemanas;dimL:rangoSemanas):rangoSemanas;
var
  max,pesoAct:real;
  semMax,i:rangoSemanas;
begin
  max:=-1;
  for i:=2 to dimL do begin
    pesoAct:=v[i]- v[i-1];
    if(pesoAct>max)then begin
      max:=pesoAct;
      semMax:=i;
    end;
  end;
 semanaMaxor:=semMax;
end;

//Punto B
function aumentoTotal(v:pesosSemanas;dimL:rangoSemanas):real;
begin
    aumentoTotal:= (v[dimL] - v[1]);
end;

procedure EliminarEmbarazoCompleto(var l:lista);
var
  ant,act:lista;
begin
  act:=l;
  ant:=l;
  while(act<>nil)do begin
    while(act<>nil)and(act^.dato.cantSemanas<SEMANA_MAX)do begin
      ant:=act;
      act:=act^.sig;
    end;

    if(act<>nil)then begin
      if(act=l)then //desengancho le puntero actual
        l:=l^.sig
      else
        ant^.sig:=act^.sig;

      if(ant=act)then begin  //actualizo los punteros y libero mem
        ant:=l;
        Dispose(act);
        act:=l;
      end
      else begin
       Dispose(act);
       act:=ant^.sig;
      end;
    end;
end;

end;



procedure BorrarLista(var l:lista);
var
  aux:lista;
begin
    while(l<>nil)do begin
      aux:=l;
      l:=l^.sig;
      Dispose(aux);
    end;
end;


  procedure recorrerEInformar(l:lista);
begin
   while(l<>nil)do begin
     writeln('La paciente ',l^.dato.ape,', ',l^.dato.nom);
     writeln('tuvo su mayor aumento de peso en la semana: ',
     semanaMaxor(l^.dato.pesos,l^.dato.cantSemanas));
     writeln('aumento: ',aumentoTotal(l^.dato.pesos,l^.dato.cantSemanas),' kilos');
    l:=l^.sig;
   end;
end;
var
  l:lista;


begin
  l:=nil;
  cargarlista(l);//se dispone implementado
  recorrerEInformar(l);
  readln;
  end.




