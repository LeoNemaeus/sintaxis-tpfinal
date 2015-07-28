unit pila;

interface
uses rb, tas, scanner;

type
  datoPila = record
    arbolito:^nodo;
    simbolo:tSigma;
  end;
  tPila = ^nodoPila;
  nodoPila = record
    info: datoPila;
    sig: tPila;
  end;

procedure crearPila(var pila:tPila);
procedure push (var tope:tPila; var dato:datoPila);
procedure pop(var tope:tPila; var dato:datoPila);

implementation
procedure crearPila(var pila:tPila);
begin
  pila := nil;
end;

procedure push (var tope:tPila; var dato:datoPila);
var
  aux:tPila;
begin
  if (tope = NIL) then
  begin
    new(aux);
    aux^.info := dato;
    aux^.sig := NIL;
    tope := aux;
  end
  else
    begin
      aux := tope;
      new(tope);
      tope^.info := dato;
      tope^.sig := aux;
    end;
end;
procedure pop(var tope:tPila; var dato:datoPila);
var
  aux:tPila;
begin
  if (tope <> NIL) then
    begin
      dato := tope^.info;
      aux  := tope;
      tope := tope^.sig;
      dispose(aux);
    end
    else
    begin
      dato.arbolito := NIL;
      dato.simbolo := (vacio);
    end;
end;

end.
