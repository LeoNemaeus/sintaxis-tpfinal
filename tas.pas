unit tas;

interface
uses scanner;
const
  maxprod = 8;
  tasx = 12;
  tasy = 6;

type
  tVecTAS =  array[1..maxprod] of sigma;
  tTas = array[1..tasy]of array [1..tasx] of tVecTAS;

const
  cTAS:tTas =
  (
    ( (Z, A, vacio, vacio, vacio, vacio, vacio, vacio), (Z, A, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (Z, A, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio) ),
    ( (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (puntoycoma, Z, A, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio) ),
    ( (leer, parentesis_abre, texto, coma, id, parentesis_cierra, vacio, vacio), (escribir, parentesis_abre, texto, coma, Q, H, N, parentesis_cierra), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (id, resta, Q, H, N, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio) ),
    ( (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (resta, Q, H, N, vacio, vacio, vacio, vacio), (multiplicacion, Q, H, N, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio) ),
    ( (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (division, Q, H, vacio, vacio, vacio, vacio, vacio), (division, Q, H, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio) ),
    ( (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (parentesis_abre, Q, H, N, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (id, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (constante, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio) )
  );


function tas(produccion:sigma; simbolo:sigma):tVecTAS;



implementation

function tVecTAS_Vacio(x:tVecTAS):boolean;
var
  i:1..8;
  resultado:boolean;
begin
  for i := 1 to 8 do
  begin
    if x[i] = (vacio) then
      resultado := true
    else
      resultado := false;
  end; // ### FIN for
  tVecTAS_Vacio := resultado;
end; // ### FIN FUNCTION tElemTas_Vacio

function tas(produccion:sigma; simbolo:sigma):tVecTAS;
var
  i:shortint;
  j:shortint;
  resultado: tVecTAS;
begin
  i := 1;
  j := 1;
  for i:=1 to maxprod do resultado[i] := (vacio);

  i := 1;

  if      simbolo = (leer)            then j := 1
  else if simbolo = (escribir)        then j := 2
  else if simbolo = (puntoycoma)      then j := 3
  else if simbolo = (parentesis_abre) then j := 4
  else if simbolo = (parentesis_cierra) then j := 5
  else if simbolo = (suma)            then j := 6
  else if simbolo = (resta)           then j := 7
  else if simbolo = (multiplicacion)  then j := 8
  else if simbolo = (division)        then j := 9
  else if simbolo = (id)              then j := 10
  else if simbolo = (constante)       then j := 11;

  if      produccion = (S) then i := 1
  else if produccion = (A) then i := 2
  else if produccion = (Z) then i := 3
  else if produccion = (N) then i := 4
  else if produccion = (H) then i := 5
  else if produccion = (Q) then i := 6;

  resultado := cTAS[i][j];

  tas := resultado;
end;  //### FIN DE FUNCTION tas


end.  //### FIN DE IMPLMENTATION
