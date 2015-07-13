unit arboles;

interface
type
  datos = record
  end;

  arbol = ^hoja;

  hoja = record
    data:datos;
    izq:arbol;
    der:arbol;
    balance:shortint;
  end;

procedure crearArbol(var x:arbol);
function arbolVacío(var x:arbol):boolean;
procedure instertarArbol(a:dato; var x:arbol);
procedure buscarArbol(a:dato; var x:arbol);

implementation

begin

end.
