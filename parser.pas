program parser;

//interface
uses rb, tas, pila;

//implementation

procedure mostrarArbol(a:arbol);
begin
  writeln(a^.info.n);
end;

var
    simbolo_pesos:datoPila;
    simbolo_inicial:datoPila;
    simbolo_actual:datoPila;
begin

  simbolo_pesos.arbolito := ^;
  simbolo_pesos.simbolo := (peso);

  crearArbol(A);

  insertarArbol(A,S);

  simbolo_inicial.arbolito := A;
  simbolo_inicial.simbolo := S;       // DEBE RECIBIR COMO ENTRADA LA X, ES DE TIPO tEnumTAS

  push(P, simbolo_pesos);
  push(p, simbolo_inicial);

  resultado := 0;

  obtener_simbolo(a);
  repeat
  begin
    pop(p, simbolo_actual);

    if (terminal(simbolo_actual.simbolo)) then
      begin
        if (x = a) then
          obtener_simbolo(a)
        else
          resultado := -1;
      end;

    if variable(simbolo_actual.simbolo) then
      begin
        tas(simbolo_actual.simbolo, a) = v;

        if (v[1] = '') then
          resultado := -1
        else
          begin
            while(v[i] <> '') do
            begin
              aux.simbolo := v[i];
              aux.arbolito := insertarArbol(simbolo_actual^.nodo^.vector[i], v[i]);
              push(auxPila, aux);
              inc(i);
            end;

            while(i > 0) do
            begin
              pop(auxPila, aux);
              push(pila, aux);
              dec(i);
            end;
          end;
      end;
  end
  until (resultado <> 0);

end.
