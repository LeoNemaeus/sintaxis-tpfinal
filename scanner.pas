{ TipoComplex:
			ConsReal				mas						punto
			cadena					menos					puntoycoma
			id						por						errorLexico
			leer					dividido
			escribir				parA
			igual					parC
			}

unit scanner;

interface
uses	archivos;
type
	//tSigma = (vacio, epsilon, peso, S, A, Q, Z, H, N, escribir, leer, parA, parC, mas, menos, por, dividido, cadena, coma, puntoycoma, id, punto, ConsReal, igual);
	tSigma = (escribir, leer, parA, parC, mas, menos, por, dividido, cadena, coma, puntoycoma, id, punto, ConsReal, igual, ErrorLexico, vacio, epsilon, peso, S, A, Q, Z, H, N);
	TipoComplex = escribir..peso;
	TipoVariables = S..N;
	dato= Record
			nom: string;
			valor: string;
			posicion: longint;
			End;
	punt= ^nodo;
	nodo= Record
			info: dato;
			sig: punt;
			end;
	lista= Record
			cab: punt;
			tam: word;
			end;



{ const }
	//TipoComplex= (ConsReal, cadena, id, leer, escribir, igual, mas, menos, por, coma, dividido, parA, parC, punto, puntoycoma, ErrorLexico);
	procedure crearTS (var ts:lista);
	Procedure ObtenerSiguienteCompLex(Var archivo:textfile;Var Control:Longint; Var CompLex:TipoComplex;Var Lexema:String;Var TS:lista);
	procedure insertarTS (var lexema: string; compLex: TipoComplex; var control: longint; var TS: lista);



implementation

function Simbolo (var archivo: textfile; var control:Longint): boolean;
var
	auxcontrol: Longint;
	T: char;
begin
	simbolo:=false;
	auxcontrol:= control;
	T:=leercaracter(archivo);
	case T of
		'=':Simbolo:= true;
		'+':Simbolo:= true;
		'-':Simbolo:= true;
		'*':Simbolo:= true;
		'/':Simbolo:= true;
		';':Simbolo:= true;
		',':Simbolo:= true;
		'.':Simbolo:= true;
		'(':Simbolo:= true;
		')':Simbolo:= true;
	end;
end;

procedure EsSimbolo (var archivo: textfile; var control: Longint; var compLex: TipoComplex);
var
	auxcontrol: Longint;
	T: char;
begin
	auxcontrol:= control;
	T:=leercaracter(archivo);
	case T of
		'=':begin
				compLex:= igual;
				control:= auxControl;
			end;
		'+':begin
				compLex:= mas;
				control:= auxControl;
			end;
		'-':begin
				compLex:= menos;
				control:= auxControl;
			end;
		'*':begin
				compLex:= por;
				control:= auxControl;
			end;
		'/':begin
				compLex:= dividido;
				control:= auxControl;
			end;
		';':begin
				compLex:= puntoycoma;
				control:= auxControl;
			end;
		',':begin
				compLex:= coma;
				control:= auxControl;
			end;
		'.':begin
				compLex:= punto;
				control:= auxControl;
			end;
		'(':begin
				compLex:= parA;
				control:= auxControl;
			end;
		')':begin
				compLex:= parC;
				control:= auxControl;
			end;
	end;
end;


function EsID (var archivo: textfile; var control: Longint; var lexema: string): boolean;
Const
	q0=0;
	F=[0];
Type
	Q=0..2;
	sigma=(L, D, G, O);
	t_delta=Array[Q,sigma] of Q;
Var
	estact:Q;
	delta:t_delta;
	T:char;
	auxControl: Longint;
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
	auxControl:= control;
	estact:=q0;
	lexema:= '';
	T:= leercaracter(archivo);
	while ((estact <> 2) or (T<>' ') or not (Simbolo(archivo, control))) do
	begin
		estact:= delta[estact, simboloID(T)];
		EsID:= estact in F;
		if (estact=1) then
		begin
			lexema:= lexema+T;
			auxControl:= auxControl+1;
			T:= leercaracter(archivo);
		end;
	end;
	if EsID then
		control:= auxControl;
end;

function EsConstRealpas(var archivo: textfile; var control: Longint; var lexema: string):boolean;
Const
  q0=0;
  F=[4,2, 7];
Type
  Q=0..8;
  sigma=(D, menos, punto, E, O);
  t_delta=Array[Q,sigma] of Q;
Var
	estact:Q;
	delta:t_delta;
	T:char;
	auxControl: Longint;

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
	auxControl:= control;
	estact:=q0;
	lexema:= '';
	T:= leercaracter(archivo);
	while ((estact <> 8) or (T<>' ') or not (Simbolo(archivo, control))) do
	begin
		estact:= delta[estact, simbCONS(T)];
		EsConstReal:= estact in F;
		if (estact<>8) then
		begin
			lexema:= lexema+T;
			auxControl:= auxControl+1;
			T:= leercaracter(archivo);
		end;
	end;
	if EsConstReal then
		control:= auxControl;
end;

Function EsLEER(var archivo: textfile; var control: Longint):Boolean;
Const
  q0=0;
  F=[4];
Type
  Q=0..5;
  sigma=(L, E, R, O);
  t_delta=Array[Q,sigma] of Q;
Var
  estact:Q;
  delta:t_delta;
	T:char;
	lexema: string;
	auxControl: Longint;pas

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
	auxControl:= control;
	estact:=q0;
	lexema:= '';
	T:= leercaracter(archivo);
	while ((estact <> 5) or (T<>' ') or not (Simbolo(archivo, control))) do
	begin
		estact:= delta[estact, simbLEER(T)];
		EsLEER:= estact in F;
		if (estact<>5) then
		begin
			lexema:= lexema+T;
			auxControl:= auxControl+1;
			T:= leercaracter(archivo);
		end;
	end;
	if EsLEER then
		control:= auxControl;
end;

Function EsESCRIBIR(var archivo: textfile; var control: Longint):Boolean;
Const
	q0=0;
	F=[8];
Type
	Q=0..9;
	sigma=(E, S, C, R, I, B ,O);
	t_delta=Array[Q,sigma] of Q;
Var
	estact:Q;
	delta:t_delta;
	T:char;
	auxControl: Longint;
	lexema: string;

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
	auxControl:= control;
	estact:=q0;
	lexema:= '';
	T:= leercaracter(archivo);
	while ((estact <> 9) or (T<>' ') or not (Simbolo(archivo, control))) do
	begin
		estact:= delta[estact, simbESCRI(T)];
		EsESCRIBIR:= estact in F;
		if (estact<>9) then
		begin
			lexema:= lexema+T;
			auxControl:= auxControl+1;
			T:= leercaracter(archivo);
		end;
	end;
	if EsESCRIBIR then
		control:= auxControl;
End;

Function EsCADENA(var archivo: textfile; var control: Longint):Boolean;
Const
	q0=0;
	F=[2];
Type
	Q=0..3;
	sigma=(C,O);
	t_delta=Array[Q,sigma] of Q;
Var
	estact:Q;
	delta:t_delta;
	T:char;
	auxControl: Longint;
	lexema: string;

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
	auxControl:= control;
	estact:=q0;
	lexema:= '';
	T:= leercaracter(archivo);
	while ((estact <> 3) or (T<>' ') or not (Simbolo(archivo, control))) do
	begin
		estact:= delta[estact, simbCAD(T)];
		EsCADENA:= estact in F;
		if (estact<>3) then
		begin
			lexema:= lexema+T;
			auxControl:= auxControl+1;
			T:= leercaracter(archivo);
		end;
	end;
	if EsCADENA then
		control:= auxControl;
End;

procedure crearTS (var ts:lista);
begin
	ts.cab := nil;
	ts.tam := 0;
end;

 procedure insertarTS (var lexema: string; compLex: TipoComplex; var control: longint; var TS: lista);
Var
	dir: punt;
	ant: punt;
	act: punt;
	x: dato;
	posi: longint;
Begin
	posi:= control;
	posi:= posi-Length(lexema);			//hace que la posicion que guarda en la TS sea la posicion donde empieza ese id en el archivo
	x.nom:= 'ID';
	x.valor:= lexema;
	x.posicion:= posi;
	new(dir);
	dir^.info := x;
	if (TS.cab = nil) or (TS.cab^.info.posicion > x.posicion) then
		Begin
			dir^.sig := TS.cab;
			TS.cab := dir;
		End
	else
		Begin
			ant := TS.cab;
			act := TS.cab^.sig;
			while (act <> nil) and (act^.info.posicion < x.posicion) do
				Begin
					ant := act;
					act := act^.sig;
				End;
			dir^.sig := act;
			ant^.sig := dir;
		End;
	compLex:= id;
	inc(TS.tam);
End;

Procedure ObtenerSiguienteCompLex(Var archivo:textfile;Var Control:Longint; Var CompLex:TipoComplex;Var Lexema:String;Var TS:lista);
var
	T: string;								//fijarse el valor del control antes de esta funsion
begin
	while T IN [#0..#32] do
	begin
		T:=leerCaracter(archivo);
		control:= control+1;
	end;
	control:= control-1;
	If Simbolo(archivo, control) then
		EsSimbolo (archivo, control, compLex)
	else
		If (EsID(archivo, control, lexema)) then
		begin
			compLex:= id;
			insertarTS(lexema, compLex, control, TS);
		end
		else
			if EsConstReal(archivo, control, lexema) then
				compLex:= ConsReal
			else
				if EsLEER(archivo, control) then
					compLex:= leer
				else
					if EsESCRIBIR(archivo, control) then
						compLex:= escribir
					else
						if EsCADENA(archivo, control) then
							compLex:= cadena
						else
							compLex:=ErrorLexico;
end;


End.
