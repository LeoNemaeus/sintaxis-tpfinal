unit scanner;

interface

implementation

{ Type
  sigma=(L, D, G, O);
{ var
	L: byte;
	D: byte;
	O: byte;
	G:byte;
	sigma: set of byte; }
 }


Function EsID(texto:String):Boolean;
Const
  q0=0;
  F=[0];
Type
  Q=0..2;
  sigma=(L, D, G, O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;

  Function simboloID(Car:Char): sigma;
Begin
  Case Car of
    'a'..'z', 'A'..'Z':simboloID:=L;
    '0'..'9'	     :simboloID:=D;
	'_' : simboloID:= G
  else
   simboloID:=O
  End;
End;

Begin
  delta[0,L]:=1;
  delta[0,D]:=2;
  delta[0,G]:=2;
  delta[0,O]:=2;
  delta[1,L]:=1;
  delta[1,D]:=1;
  delta[1,G]:=1;
  delta[1,O]:=2;
  delta[2,L]:=2;
  delta[2,D]:=2;
  delta[2,G]:=2;
  delta[2,O]:=2;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact, simboloID(texto[control])];
  EsID:=estact in F;
End;



Function EsConstReales(texto:String):Boolean;
Const
  q0=0;
  F=[4,2, 7];
Type
  Q=0..8;
  sigma=(D, menos, punto, E, O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;

  Function simbCONS(Car:Char):sigma;
Begin
  Case Car of
    '0'..'9' :simbCONS:=D;
	'-' : simbCONS:= menos;
	'.' : simbCONS:= punto;
	'e', 'E' : simbCONS:= E;
  else
   simbCONS:=O
  End;
End;

Begin
  delta[0,D]:=2;
  delta[0,menos]:=1;
  delta[0,punto]:=8;      { 8=muerto }
  delta[0,E]:=8;
  delta[0,O]:=8;
  delta[1,D]:=2;
  delta[1,menos]:=8;
  delta[1,punto]:=8;
  delta[1,E]:=8;
  delta[1,O]:=8;
  delta[2,D]:=2;
  delta[2,menos]:=8;
  delta[2,punto]:=3;
  delta[2,E]:=5;
  delta[2,O]:=8;
  delta[3,D]:=4;
  delta[3,menos]:=8;
  delta[3,punto]:=8;
  delta[3,E]:=8;
  delta[3,O]:=8;
  delta[4,D]:=4;
  delta[4,menos]:=8;
  delta[4,punto]:=8;
  delta[4,E]:=5;
  delta[4,O]:=8;
  delta[5,D]:=7;
  delta[5,menos]:=6;
  delta[5,punto]:=8;
  delta[5,E]:=8;
  delta[5,O]:=8;
  delta[6,D]:=7;
  delta[6,menos]:=8;
  delta[6,punto]:=8;
  delta[6,E]:=8;
  delta[6,O]:=8;
  delta[7,D]:=7;
  delta[7,menos]:=8;
  delta[7,punto]:=8;
  delta[7,E]:=8;
  delta[7,O]:=8;
  delta[8,D]:=8;
  delta[8,menos]:=8;
  delta[8,punto]:=8;
  delta[8,E]:=8;
  delta[8,O]:=8;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact,simbCONS(texto[control])];
  EsConstReales:=estact in F;
End;


Function EsConstIgual(texto:String):Boolean;
Const
  q0=0;
  F=[1];
Type
  Q=0..2;
  sigma=(igual, O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;

 Function simbIGUAL(Car:Char):sigma;
Begin
  if Car = '=' then
	simbIGUAL:=igual
  else
   simbIGUAL:=O
End;

Begin
  delta[0,igual]:=1;
  delta[0,O]:=2;
  delta[1,igual]:=2;
  delta[1,O]:=2;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact,simbIGUAL(texto[control])];
  EsConstIgual:=estact in F;
End;

Function EsConstMenos(texto:String):Boolean;
Const
  q0=0;
  F=[1];
Type
  Q=0..2;
  sigma=(menos, O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;
  Function simbmenos(Car:Char):sigma;
Begin
  if Car = '-' then
	simbmenos:=menos
  else
   simbmenos:=O
End;

Begin
  delta[0,menos]:=1;
  delta[0,O]:=2;
  delta[1,menos]:=2;
  delta[1,O]:=2;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact,simbmenos(texto[control])];
  EsConstMenos:=estact in F;
End;



Function EsConstMas(texto:String):Boolean;
Const
  q0=0;
  F=[1];
Type
  Q=0..2;
  sigma=(mas, O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;

 Function simbmas(Car:Char):sigma;
Begin
  if Car = '+' then
	simbmas:=mas
  else
   simbmas:=O
End;

Begin
  delta[0,mas]:=1;
  delta[0,O]:=2;
  delta[1,mas]:=2;
  delta[1,O]:=2;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact,simbmas(texto[control])];
  EsConstMas:=estact in F;
End;



Function EsConstPor(texto:String):Boolean;
Const
  q0=0;
  F=[1];
Type
  Q=0..2;
  sigma=(por, O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;

 Function simbpor(Car:Char):sigma;
Begin
  if Car = '*' then
	simbpor:=por
  else
   simbpor:=O
End;

Begin
  delta[0,por]:=1;
  delta[0,O]:=2;
  delta[1,por]:=2;
  delta[1,O]:=2;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact,simbpor(texto[control])];
  EsConstPor:=estact in F;
End;



Function EsConstDividido(texto:String):Boolean;
Const
  q0=0;
  F=[1];
Type
  Q=0..2;
  sigma=(dividido, O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;

Function simbdividido(Car:Char):sigma;
Begin
  if Car = '/' then
	simbdividido:=dividido
  else
   simbdividido:=O
End;

Begin
  delta[0,dividido]:=1;
  delta[0,O]:=2;
  delta[1,dividido]:=2;
  delta[1,O]:=2;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact,simbdividido(texto[control])];
  EsConstDividido:=estact in F;
End;



Function EsConstPuntoycoma(texto:String):Boolean;
Const
  q0=0;
  F=[1];
Type
  Q=0..2;
  sigma=(pyc, O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;

Function simbpyc(Car:Char):sigma;
Begin
  if Car = ';' then
	simbpyc:=pyc
  else
   simbpyc:=O
End;

Begin
  delta[0,pyc]:=1;
  delta[0,O]:=2;
  delta[1,pyc]:=2;
  delta[1,O]:=2;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact,simbpyc(texto[control])];
  EsConstPuntoycoma:=estact in F;
End;



Function EsConstPunto(texto:String):Boolean;
Const
  q0=0;
  F=[1];
Type
  Q=0..2;
  sigma=(punto, O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;

Function simbpunto(Car:Char):sigma;
Begin
  if Car = '.' then
	simbpunto:=punto
  else
   simbpunto:=O
End;

Begin
  delta[0,punto]:=1;
  delta[0,O]:=2;
  delta[1,punto]:=2;
  delta[1,O]:=2;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact,simbpunto(texto[control])];
  EsConstPunto:=estact in F;
End;



Function EsConstParA(texto:String):Boolean;
Const
  q0=0;
  F=[1];
Type
  Q=0..2;
  sigma=(parA, O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;

Function simbparA(Car:Char):sigma;
Begin
  if Car = '(' then
	simbparA:=parA
  else
   simbparA:=O
End;


Begin
  delta[0,parA]:=1;
  delta[0,O]:=2;
  delta[1,parA]:=2;
  delta[1,O]:=2;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact,simbparA(texto[control])];
  EsConstParA:=estact in F;
End;



Function EsConstParC(texto:String):Boolean;
Const
  q0=0;
  F=[1];
Type
  Q=0..2;
  sigma=(parC, O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;

Function simbparC(Car:Char):sigma;
Begin
  if Car = ')' then
	simbparC:=parC
  else
   simbparC:=O
End;

Begin
  delta[0,parC]:=1;
  delta[0,O]:=2;
  delta[1,parC]:=2;
  delta[1,O]:=2;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact,simbparC(texto[control])];
  EsConstParC:=estact in F;
End;



Function EsConstLEER(texto:String):Boolean;
Const
  q0=0;
  F=[4];
Type
  Q=0..5;
  sigma=(L, E, R, O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;

Function simbLEER(Car:Char):sigma;
Begin
  Case Car of
    'L','l'  :simbLEER:=L;
    'E', 'e' :simbLEER:=E;
	'R', 'r' : simbLEER:= R
  else
   simbLEER:=O
  End;
End;

Begin
  delta[0,L]:=1;
  delta[0,E]:=5;
  delta[0,R]:=5;
  delta[0,O]:=5;
  delta[1,L]:=5;
  delta[1,E]:=2;
  delta[1,R]:=5;
  delta[1,O]:=5;
  delta[2,L]:=5;
  delta[2,E]:=3;
  delta[2,R]:=5;
  delta[2,O]:=5;
  delta[3,L]:=5;
  delta[3,E]:=5;
  delta[3,R]:=4;
  delta[3,O]:=5;
  delta[4,L]:=5;
  delta[4,E]:=5;
  delta[4,R]:=5;
  delta[4,O]:=5;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact,simbLEER(texto[control])];
  EsConstLEER:=estact in F;
End;



Function EsConstESCRIBIR(texto:String):Boolean;
Const
  q0=0;
  F=[8];
Type
  Q=0..9;
  sigma=(E, S, C, R, I, B ,O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;

Function simbESCRI(Car:Char):sigma;
Begin
  Case Car of
    'E', 'e' :simbESCRI:=E;
    'S','s'  :simbESCRI:=S;
	'C', 'c' : simbESCRI:= C;
	'R', 'r' : simbESCRI:= R;
	'I', 'i' : simbESCRI:= I;
	'B', 'b' : simbESCRI:= B;
  else
   simbESCRI:=O
  End;
End;

Begin
  delta[0,E]:=1;
  delta[0,S]:=9;
  delta[0,C]:=9;
  delta[0,R]:=9;
  delta[0,I]:=9;
  delta[0,B]:=9;
  delta[0,O]:=9;
  delta[1,E]:=9;
  delta[1,S]:=2;
  delta[1,C]:=9;
  delta[1,R]:=9;
  delta[1,I]:=9;
  delta[1,B]:=9;
  delta[1,O]:=9;
  delta[2,E]:=9;
  delta[2,S]:=9;
  delta[2,C]:=3;
  delta[2,R]:=9;
  delta[2,I]:=9;
  delta[2,B]:=9;
  delta[2,O]:=9;
  delta[3,E]:=9;
  delta[3,S]:=9;
  delta[3,C]:=9;
  delta[3,R]:=4;
  delta[3,I]:=9;
  delta[3,B]:=9;
  delta[3,O]:=9;
  delta[4,E]:=9;
  delta[4,S]:=9;
  delta[4,C]:=9;
  delta[4,R]:=9;
  delta[4,I]:=5;
  delta[4,B]:=9;
  delta[4,O]:=9;
  delta[5,E]:=9;
  delta[5,S]:=9;
  delta[5,C]:=9;
  delta[5,R]:=9;
  delta[5,I]:=9;
  delta[5,B]:=6;
  delta[5,O]:=9;
  delta[6,E]:=9;
  delta[6,S]:=9;
  delta[6,C]:=9;
  delta[6,R]:=9;
  delta[6,I]:=7;
  delta[6,B]:=9;
  delta[6,O]:=9;
  delta[7,E]:=9;
  delta[7,S]:=9;
  delta[7,C]:=9;
  delta[7,R]:=8;
  delta[7,I]:=9;
  delta[7,B]:=9;
  delta[7,O]:=9;
  delta[8,E]:=9;
  delta[8,S]:=9;
  delta[8,C]:=9;
  delta[8,R]:=9;
  delta[8,I]:=9;
  delta[8,B]:=9;
  delta[8,O]:=9;
  delta[9,E]:=9;
  delta[9,S]:=9;
  delta[9,C]:=9;
  delta[9,R]:=9;
  delta[9,I]:=9;
  delta[9,B]:=9;
  delta[9,O]:=9;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact,simbESCRI(texto[control])];
  EsConstESCRIBIR:=estact in F;
End;



Function EsConstCADENA(texto:String):Boolean;
Const
  q0=0;
  F=[2];
Type
  Q=0..3;
  sigma=(C,O);
  t_delta=Array[Q,sigma] of Q;
Var
  control:Integer;
  estact:Q;
  delta:t_delta;

Function simbCAD(Car:Char):sigma;
Begin
  Case Car of
    '''' :simbCAD:=C;
  else
   simbCAD:=O
  End;
End;

Begin
  delta[0,C]:=1;
  delta[0,O]:=3;
  delta[1,C]:=2;
  delta[1,O]:=1;
  delta[2,C]:=3;
  delta[2,O]:=3;
  delta[3,C]:=3;
  delta[3,O]:=3;
  estact:=q0;
  For control:=1 to Length(texto) do
    estact:=delta[estact,simbCAD(texto[control])];
  EsConstCADENA:=estact in F;
End;

End.
