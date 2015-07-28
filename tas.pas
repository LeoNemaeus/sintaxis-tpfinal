unit tas;

interface
uses scanner;
const
  maxprod = 8;
  tasx = 12;
  tasy = 6;

type
  tVecTAS =  array[1..maxprod] of tSigma;
  tTas = array[1..tasy]of array [1..tasx] of tVecTAS;


const
  cTAS:tTas =
  (
    ( (Z, A, vacio, vacio, vacio, vacio, vacio, vacio), (Z, A, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (Z, A, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio) ),
    ( (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (puntoycoma, Z, A, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio) ),
    ( (leer, parA, cadena, coma, id, parC, vacio, vacio), (escribir, parA, cadena, coma, Q, H, N, parC), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (id, menos, Q, H, N, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio) ),
    ( (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (menos, Q, H, N, vacio, vacio, vacio, vacio), (por, Q, H, N, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio) ),
    ( (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (dividido, Q, H, vacio, vacio, vacio, vacio, vacio), (dividido, Q, H, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (epsilon, vacio, vacio, vacio, vacio, vacio, vacio, vacio) ),
    ( (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (parA, Q, H, N, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (id, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (consreal, vacio, vacio, vacio, vacio, vacio, vacio, vacio), (vacio, vacio, vacio, vacio, vacio, vacio, vacio, vacio) )
  );


function tas(produccion:tsigma; simbolo:tsigma):tVecTAS;



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

function tas(produccion:tsigma; simbolo:tsigma):tVecTAS;
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
  else if simbolo = (parA) then j := 4
  else if simbolo = (parC) then j := 5
  else if simbolo = (mas)            then j := 6
  else if simbolo = (menos)           then j := 7
  else if simbolo = (por)  then j := 8
  else if simbolo = (dividido)        then j := 9
  else if simbolo = (id)              then j := 10
  else if simbolo = (consreal)       then j := 11;

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
