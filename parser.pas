program parser;

//interface
uses rb, tas, pila, scanner, archivos;



//implementation

var
    simbolo_pesos:datoPila;
    simbolo_inicial:datoPila;
    simbolo_actual:datoPila;

    archivo:TextFile;
    control:longint;
    componenteLexico:tipocomplex;
    lexema:string;

    ts:lista;

    P:tPila;

    arbol:tArbol;

    resultado:shortint;
begin

  abrirArchivo(archivo, 'archivo.asd');

  crearTS(ts);
  crearPila(P);

  simbolo_pesos.arbolito := NIL;
  simbolo_pesos.simbolo := (peso);

  crearArbol(arbol);

  insertarArbol(arbol,S);

  simbolo_inicial.arbolito := arbol;
  simbolo_inicial.simbolo := S;

  push(P, simbolo_pesos);
  push(p, simbolo_inicial);

  resultado := 0;

  ObtenerSiguienteCompLex(archivo, control, componenteLexico, lexema, ts);
  repeat
  begin
    pop(p, simbolo_actual);

    if ((simbolo_actual.simbolo = tSigma(ConsReal)) OR
    (simbolo_actual.simbolo = tSigma(cadena)) OR
    (simbolo_actual.simbolo = tSigma(id)) OR
    (simbolo_actual.simbolo = tSigma(leer)) OR
    (simbolo_actual.simbolo = tSigma(escribir)) OR
    (simbolo_actual.simbolo = tSigma(igual)) OR
    (simbolo_actual.simbolo = tSigma(mas)) OR
    (simbolo_actual.simbolo = tSigma(menos)) OR
    (simbolo_actual.simbolo = tSigma(por)) OR
    (simbolo_actual.simbolo = tSigma(coma)) OR
    (simbolo_actual.simbolo = tSigma(dividido)) OR
    (simbolo_actual.simbolo = tSigma(parA)) OR
    (simbolo_actual.simbolo = tSigma(parC)) OR
    (simbolo_actual.simbolo = tSigma(punto)) OR
    (simbolo_actual.simbolo = tSigma(puntoycoma))) then
      begin
        if (simbolo_actual.simbolo = a) then
        ObtenerSiguienteCompLex(archivo, control, a, lexema, ts);
        else
          resultado := -1;
      end;

    if simbolo_actual.simbolo in variable then
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

  cerrarArchivo(archivo);

end.
