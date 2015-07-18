unit rb;

interface
type
  tDato = record
    n:string[4];        // *** N ES LA LLAVE EN LA ESTRUCTURA DE DATOS ***
  end;

  arbol = ^nodo;
  nodo = Record
    info: tDato;
    izq: arbol;
    der: arbol;
    padre: arbol;
    color:boolean;
  end;

  datoPila = ^nodo;

  pila = ^nodoPila;
  nodoPila = record
    info: datoPila;
    sig: pila;
  end;

  procedure crearArbol (var A:arbol);
  function insertarArbol(var a: arbol; nodo: tDato): Shortint;
  procedure inorden (var a:arbol);
	//procedure buscar (A: arbol; buscado: word; var nodoC: tdato; var salir: boolean);

	implementation

  function vacio(a:arbol):boolean;
  var
    r:boolean;
  begin
    if (a = NIL) then
      r := true
    else
      r := false;

    vacio := r;
  end;

  procedure push (var tope:pila; var dato:datoPila);
  var
    aux:pila;
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
  procedure pop(var tope:pila; var dato:datoPila);
  var
    aux:pila;
  begin
    if (tope <> NIL) then
      begin
        dato := tope^.info;
        aux  := tope;
        tope := tope^.sig;
        dispose(aux);
      end
      else dato := NIL;
  end;


	procedure crearArbol (var A:arbol);
	begin
		A:= nil;
	end;

	procedure rotarIzq(var x: arbol);
	var
		aux: arbol;
	begin
    aux := x^.der;
    x^.der := aux^.izq;
    if (aux^.izq <> NIL) then
      x^.izq^.padre := aux;

    aux^.padre := x^.padre;

    if (x^.padre =  NIL) then x := aux
    else if (x = x^.padre^.izq) then x^.padre^.izq := aux
    else x^.padre^.der := aux;

    aux^.izq := x;
    x^.padre := aux;
	end;

	procedure rotarDer(var x: arbol);
	var
		aux: arbol;
	begin
		aux := x^.izq;
    x^.izq := aux^.der;
		if (aux^.der <> NIL) then
      aux^.der^.padre := x;

    aux^.padre := x^.padre;

    if (x^.padre = NIL) then x := aux
    else if (x = x^.padre^.izq) then x^.padre^.izq := aux
    else x^.padre^.der := aux;

    aux^.der := x;
    x^.padre := aux;
	end;

	function insertarArbol(var a: arbol; nodo: tDato): Shortint;
	var
  aux:^nodo;
  actual:^nodo;
  tempColor:boolean;
  resultado:shortint;

  begin
    aux := NIL;
    actual := a;

    //*** ¡¡VER QUE LA LLAVE ES N ACÁ!!
    while(not(vacio(actual)) AND (nodo.n <> actual^.info.n)) do
    begin
      if (nodo.n < actual^.info.n) then
        begin
          aux := actual;
          if (actual <> NIL) then
            actual := actual^.izq;
        end
      else
        begin
          aux := actual;
          if (actual <> NIL) then
            actual := actual^.der;
        end;
    end;

    if (NOT(vacio(actual))) then
      resultado := 0
    else
    begin

      if (vacio(aux)) then
        begin
          new(actual);
          actual^.info := nodo;
          actual^.izq := NIL;
          actual^.der := NIL;
          actual^.color := true;
          actual^.padre := nil;
          a := actual;
          resultado := 0;
        end
      else if (nodo.n < aux^.info.n) then
        begin
          new(actual);
          actual^.info := nodo;
          actual^.izq := NIL;
          actual^.der := NIL;
          actual^.color := true;
          aux^.izq := actual;
          resultado := 0;
        end
        else if (nodo.n > aux^.info.n) then
          begin
            new(actual);
            actual^.info := nodo;
            actual^.izq := NIL;
            actual^.der := NIL;
            actual^.color := true;
            aux^.der := actual;
            resultado := 0;
          end
        end;

      while((actual^.padre <> nil) AND (actual^.padre^.color = true)) do
      begin
        if (actual^.padre = actual^.padre^.padre^.izq) then
          aux := actual^.padre^.padre^.der
        else
          aux := actual^.padre^.padre^.izq;

        if (aux^.color = true) then
          begin
            aux^.color := true;
            actual^.padre^.color := false;
            actual := actual^.padre^.padre;
          end
        else
          begin
            if((actual^.padre = actual^.padre^.padre^.izq) AND (actual = actual^.padre^.izq)) then
              begin
                tempColor := actual^.padre^.color;
                actual^.padre^.color := actual^.padre^.padre^.color;
                actual^.padre^.padre^.color := tempColor;
                rotarDer(actual^.padre);
              end;
            if ((actual^.padre = actual^.padre^.padre^.izq) AND (actual = actual^.padre^.der)) then
              begin
                tempcolor := actual^.color;
                actual^.color := actual^.padre^.padre^.color;
                actual^.padre^.padre^.color := tempcolor;
                rotarIzq(actual^.padre);
                rotarDer(actual^.padre^.padre);
              end;
            if ((actual^.padre = actual^.padre^.padre^.der) AND (actual = actual^.padre^.der)) then
              begin
                tempcolor := actual^.padre^.color;
                actual^.padre^.color := actual^.padre^.padre^.color;
                actual^.padre^.padre^.color := tempcolor;
                rotarIzq(actual^.padre);
              end;
            if((actual^.padre = actual^.padre^.padre^.der) AND (actual = actual^.padre^.izq)) then
              begin
                tempcolor := actual^.color;
                actual^.color := actual^.padre^.padre^.color;
                actual^.padre^.padre^.color := tempcolor;
                rotarDer(actual^.padre);
                rotarIzq(actual^.padre^.padre)
              end;
          end;
      end;

      if(actual^.padre = NIL) then
        actual^.color := false;

      insertarArbol := resultado;

  end;

	// procedure buscarCodigo (A: arbol; buscado: word; var nodoC: ArtC; var salir: boolean);
	// var
	// 	j:word;
	// 	aux:arbol;
	// Begin
	// 	salir:=false;
	// 	if not arbolVacioA(A) then
	// 	Begin
	// 		aux:=A;
	// 		if aux^.info.codigo = buscado then
	// 			begin
	// 			nodoC:= aux^.info
	// 			end
	// 		else
	// 		Begin
	// 			if aux^.info.codigo > buscado then
	// 				buscarCodigo(aux^.izq, buscado, nodoC, salir)
	// 			else
	// 				buscarCodigo(aux^.der, buscado, nodoC, salir);
	// 		end;
	// 	end
	// 	else
	// 	Begin
	// 		errorcod; //menu
	// 		read(j);
	// 		clrscr;
	// 		if (j=1) then
	// 		begin
	// 			repetir; //menu
	// 			read(buscado);
	// 			buscarCodigo(A, buscado, nodoC, salir)
	// 		end
	// 		else salir:=true;
	// 	end
	// end;

  procedure inorden (var a:arbol);
  begin
    if (NOT(vacio(a))) then
    begin
      inorden(a^.izq);
      writeln(a^.info.n);
      inorden(a^.der);
    end;
  end;

End.
