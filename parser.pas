program parser;

//interface
uses rb;

//implementation

procedure mostrarArbol(a:arbol);
begin
  writeln(a^.info.n);
end;

var
    // pila:pilaParser;
    // X:simbolo;
    // a:simboloCadena;
    // result: shortinteger;
    tree:arbol;
    tree2:arbol;
    nuevo:tdato;
    resultado:shortint;
    c:string[4];
begin

  push(P, $);
  push(p, );

  resultado := 0;

  obtener_simbolo(a);
  repeat
  begin
    pop(p, x);

    if (terminal(x.simbolo)) then
      begin
        if (x = a) then
          obtener_simbolo(a)
        else
          resultado := -1;
      end;

    if variable(x.simbolo) then
      begin
        tas(x.simbolo, a) = v;

        if (v[1] = '') then
          resultado := -1
        else
          begin
            while(v[i] <> '') do
            begin
              aux.simbolo := v[i];
              aux.nodo := insertarArbol(x^.nodo^.vector[i], v[i]);
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
