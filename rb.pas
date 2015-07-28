unit rb;

interface
uses tas, scanner;

type
  tLlave = ^string;

  tDato = record
    n:string[4];        // *** N ES LA LLAVE EN LA ESTRUCTURA DE DATOS ***
    llave:tLlave;
  end;

  tarbol = ^nodo;
  nodo = Record
    info: tSigma;
    hijos:array[0..7] of tarbol;
    padre: tArbol;
    color:boolean;
  end;

  tFuncCmp = function (p1:Pointer; p2:Pointer): boolean;

  procedure crearArbol(var arbol:tArbol);
  procedure insertarArbol(var arbol:tArbol; simbolo:tSigma);
  // function buscarArbol(var raiz:arbol; llave:tLlave): arbol;
  // procedure inorden (var a:arbol);

	//procedure buscar (A: arbol; buscado: word; var nodoC: tdato; var salir: boolean);

	implementation

  procedure crearArbol(var arbol:tArbol);
  begin
    arbol := nil;
  end;

  Procedure insertarArbol(var arbol:tArbol; simbolo:tSigma);
  begin
    if (arbol = NIL) then
    begin
      new(arbol);
      arbol^.info := simbolo;
    end;
  end;

  // function vacio(a:arbol):boolean;
  // var
  //   r:boolean;
  // begin
  //   if (a = NIL) then
  //     r := true
  //   else
  //     r := false;
  //
  //   vacio := r;
  // end;
  //
  //
	// procedure crearArbol (var A:arbol);
	// begin
	// 	A:= nil;
	// end;
  //
  //
  // function buscarArbol(var raiz:arbol; llave:tLlave): arbol;
  // var
  //   actual:arbol;
  // begin
  //   actual := raiz;
  //   if (actual = NIL) then
  //     buscarArbol := actual
  //   else if (actual^.info.llave^ = llave^) then
  //     buscarArbol := actual
  //   else if (actual^.info.llave^ > llave^) then
  //     buscarArbol(actual^.izq, llave)
  //   else
  //     buscarArbol(actual^.der, llave);
  // end;
  //
  // procedure inorden (var a:arbol);
  // begin
  //   if (NOT(vacio(a))) then
  //   begin
  //     inorden(a^.izq);
  //     writeln(a^.info.llave^);
  //     inorden(a^.der);
  //   end;
  // end;

End.
