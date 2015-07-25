unit scanner;

interface
type
  sigma=letra, digito, comilla, otro, vacio, id, constante, puntoycoma, parentesis_abre, parentesis_cierra, epsilon, multiplicacion, division, suma, resta, asignacion, leer, escribir, texto, coma, A, Z, Q, H, N, S, peso);
Function EsTexto(Cadena:String):Boolean;

implementation
Function CarASimb_texto(Car:Char):Sigma; forward;
Function EsTexto(Cadena:String):Boolean;
Type
  Q=0..3;
  TipoDelta=Array[Q,Sigma] of Q;
Const
  q0=0;
  F=[0];
Var
  Control:Integer;
  EstadoActual:Q;
  Delta:TipoDelta;
Begin
  {Cargar la tabla de transiciones}
  Delta[0,comilla]:=1;
  Delta[0,letra]:=3;
  Delta[0,digito]:=3;
  Delta[0,otro]:=3;
  //Para 1
  Delta[2,comilla]:=2;
  Delta[1,letra]:=1;
  Delta[1,digito]:=1;
  Delta[1,otro]:=3;
  //Para 2
  Delta[2,comilla]:=3;
  {Recorrer la cadena de entrada y cambiar estados}
  EstadoActual:=q0;
  For Control:=1 to Length(cadena) do
    EstadoActual:=Delta[EstadoActual,CarASimb(Cadena[Control])];
  EsTexto:=EstadoActual in F;
End;

Function CarASimb_texto(Car:Char):Sigma;
Begin
  Case Car of
    'a'..'z', 'A'..'Z':CarASimb:=letra;
    '0'..'9'          :carAsimb:=digito;
    ''''              :CarASimb:=comilla;
    else
      CarASimb:=Otro
  End;
End;


Function CarASimb_leer(Car:Char):Sigma; forward;
Function EsLeer(Cadena:String):Boolean;
Type
  Q=0..5;
  TipoDelta=Array[Q,Sigma] of Q;
Const
  q0=0;
  F=[0];
Var
  Control:Integer;
  EstadoActual:Q;
  Delta:TipoDelta;
Begin
  {Cargar la tabla de transiciones}
  Delta[0,comilla]:=1;
  Delta[0,letra]:=3;
  Delta[0,digito]:=3;
  Delta[0,otro]:=3;
  //para 1
  Delta[2,comilla]:=2;
  Delta[1,letra]:=1;
  Delta[1,digito]:=1;
  Delta[1,otro]:=3;
  {Recorrer la cadena de entrada y cambiar estados}
  EstadoActual:=q0;
  For Control:=1 to Length(cadena) do
    EstadoActual:=Delta[EstadoActual,CarASimb(Cadena[Control])];
  EsTexto:=EstadoActual in F;
End;

Function CarASimb_leer(Car:Char):Sigma;
Begin
  Case Car of
    'l'               :CarASimb:=l;
    'e'               :carAsimb:=e;
    'r'               :CarASimb:=e;
    else
      CarASimb:=Otro
  End;
End;


End.
