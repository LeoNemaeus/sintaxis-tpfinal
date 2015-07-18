program parser;

//interface
uses rb;

//implementation

//function analizarCadena():shortint;
var
    // pila:pilaParser;
    // X:simbolo;
    // a:simboloCadena;
    // result: shortinteger;
    tree:arbol;
    nuevo:tdato;
    resultado:shortint;
    c:string[4];
begin
  tree := NIL;
  c:='';
  while(c <> ':q') do
    begin
      readln(c);
      if (c <> ':q') then
        begin
          nuevo.n := c;
          nuevo.llave := nuevo.n;
          resultado := insertarArbol(tree, nuevo);
          if(resultado = 0) then
            writeln('Exito')
          else
            write('Error!');
        end;
    end;

    if(resultado = 0) then
      inorden(tree);
  // push(pila, '$');
  // while (result = 1) do
  // begin
  //   pop(pila, X);
  //   if(es_terminal(X)) then
  //     begin
  //       if(X=a)
  //         begin
  //           if (X='$') hen result = 0;
  //           else obtener_simbolo(a);
  //         end
  //       else result := -1;
  //     end
  //   else if(tas(X, a) = $) then result = -1
  //   else
  //     begin
  //       s_aux := tas(X, a);
  //       rb_insertar(s_aux[1]);
  //       rb_insertar(s_aux[2]);
  //     end;
  // end;
  // analizarCadena := -1

end.
