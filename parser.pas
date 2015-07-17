unit parser;

interface
uses rb;

implementation

function analizarCadena():shortinteger;
var pila:pilaParser;
    X:simbolo;
    a:simboloCadena;
    result: shortinteger;
    s_aux:
begin
  push(pila, '$');
  while (result = 1) do
  begin
    pop(pila, X);
    if(es_terminal(X)) then
      begin
        if(X=a)
          begin
            if (X='$') hen result = 0;
            else obtener_simbolo(a);
          end
        else result := -1;
      end
    else if(tas(X, a) = $) then result = -1
    else
      begin
        s_aux := tas(X, a);
        rb_insertar(s_aux[1]);
        rb_insertar(s_aux[2]);
      end;
  end;
  analizarCadena := -1
end

end.
