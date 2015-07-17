unit arboles;

interface
type
  tDato = record
  end;

  arbol= ^nodo;
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

  procedure crearArbol (var A:arbol;);
	function arbolVacio (A:arbol): boolean;
	procedure insertarArbol (var A: arbol; nodoC: ArtC);
	procedure buscar (A: arbol; buscado: word; var nodoC: ArtC; var salir: boolean);

	implementation

  procedure push (var tope:pila; var dato:datoPila);
  begin
    if (tope = NIL) then
    begin
      new(tope);
      tope.info := dato;
      tope.sig := NIL;
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
  begin
    if (tope <> NIL)
      begin
        dato := tope;
        aux  := tope;
        tope := tope.sig;
        delete(tope);
      end
      else dato := NIL;
  end;


	procedure crearArbol (var A:arbol);
	begin
		A:= nil;
	end;

	function arbolVacio(A:arbol):boolean;
	Begin
		arbolVacio := (A=nil);
	end;

function max (uno: Shortint; dos: Shortint): Shortint;
begin
	if (uno > dos) then
		max:= uno
	else max:= dos;
end;

function min (uno: Shortint; dos: Shortint; tres: Shortint): Shortint;
begin
	if (uno = dos) then
		if (uno < tres) then
			min:= uno
		else min:= tres
	else
		if (uno = tres) then
			if (uno < dos) then
				min:= uno
			else min:= dos
		else
			if (dos = tres) then
				if (dos < uno) then
					min:= dos
				else min:= uno
			else
				if (uno < dos) and (uno < tres) then
					min:= uno
				else
					if (dos < uno) and (dos < tres) then
						min:= dos
					else min:= tres;
end;

	procedure rotIzq(var x: arbol);
	var
		aux: arbol;
	begin
    aux := x.der;
    x.der := aux.izq;
    if (aux.izq <> NIL) then
      x.izq.padre = aux;

    aux->padre := x.padre;

    if (x.padre =  NIL) then x := aux
    else if (x = x.parent.izq) then x.padre.izq := aux
    else x.padre.der := aux;

    aux.izq := x;
    x.padre := aux;
	end;

	procedure rotDer(var x: arbol);
	var
		aux: arbol;
	begin
		aux := x.izq;
    x.izq := aux.der;
		if (aux.der <> NIL) then
      aux.der.padre := x;

    aux.padre := x.padre;

    if (x.padre = NIL) then x := aux
    else if (x = x.padre.izq) then x.padre.izq := aux
    else x.padre.der := aux;

    aux.der := x;
    x.padre := aux;
	end;

	function insertarArbol(var A: arbol; nodoC: ArtC; var tope:pila): Shortint;
	var
		aux: Shortint;
    dato: datoPila;
	begin
		if ((A=nil) AND (tope = NIL)) then
			begin
				new(A);
				A^.info       := nodoC;
				A^.der        := nil;
				A^.izq        := nil;
				A^.color      := true;
        A^.padre      := NIL;
				insertarArbol := 1;
			end
    else if ((A=NIL) AND (tope <> NIL)) then
      begin
        new(A);
        A^.info       := nodoC;
        A^.der        := nil;
        A^.izq        := nil;
        A^.color      := true;
        A^.padre      := pila.info;
        insertarArbol := 1;
      end
		else if (A^.info.codigo < nodoC.codigo) then
      begin
        push(pila, A^.der);
				aux := insertarArbol (A^.der, nodoC, pila);
      end
		else
      begin
          push(pila, A^.izq);
          aux := insertarArbol (A^.izq, nodoC, pila);
      end;

    if (tope <> NIL) then
      pop(pila);

	end;


	procedure buscarCodigo (A: arbol; buscado: word; var nodoC: ArtC; var salir: boolean);
	var
		j:word;
		aux:arbol;
	Begin
		salir:=false;
		if not arbolVacioA(A) then
		Begin
			aux:=A;
			if aux^.info.codigo = buscado then
				begin
				nodoC:= aux^.info
				end
			else
			Begin
				if aux^.info.codigo > buscado then
					buscarCodigo(aux^.izq, buscado, nodoC, salir)
				else
					buscarCodigo(aux^.der, buscado, nodoC, salir);
			end;
		end
		else
		Begin
			errorcod; //menu
			read(j);
			clrscr;
			if (j=1) then
			begin
				repetir; //menu
				read(buscado);
				buscarCodigo(A, buscado, nodoC, salir)
			end
			else salir:=true;
		end
	end;

Procedure postordenA (var A : arbol);
var
	aux: arbol;
begin
	aux:=A;
	if (aux <> nil) then
	begin
		postordenA(aux^.Izq);
		postordenA(aux^.Der);
		dispose(aux);
	end
end;

End.
