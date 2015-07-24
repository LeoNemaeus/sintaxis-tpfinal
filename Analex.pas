Unit Analex;
Interface

Implementation

procedure ComponenteId (var texto: string; var posi: byte; var id: boolean); {1}
var
	cad: string;
        letram: set of char;
	letrama: set of char;
	num: set of char;
	mal: byte;
	I: byte;
begin
  	letram:= ['a'..'z'];
	letrama:= ['A'..'Z'];
	num:=['0'..'9'] ;
	mal:=0;
	cad:= texto;
	if (cad[posi] in letram) or (cad[posi] in letrama) then
	begin
		if posi = Length(cad) then
		begin
			mal:=0;
		end;
		posi:=posi+1;
		if posi = Length(cad) then
			mal:=0
		else
		begin
			for I:= posi to Length(cad) do
			begin
				if (cad[I] = '_') or (cad[I] = '-') then
				begin
				    if  (cad[I+1] in num) or  (cad[I+1] in letram) or (cad[I+1] in letrama) then
						mal:=0
					else
					begin
						if not (cad[I+1] in num) or  not (cad[I+1] in letram) or not(cad[I+1] in letrama) then
							mal:=1;
					end
				end
			end
		end
	end
	else
	begin
		if not (cad[posi] in letram) or not(cad[posi] in letrama) then
			mal:=1;
	end;
	if mal=1 then
		id:= false
	else
		if mal=0 then
			id:= true;
end;

procedure ComponenteConstante (var texto: string; var posi: byte; var cons: boolean); {2}
var
	num: set of char;
	cad: string;
	mal: byte;
begin
	cons:= false;
	num:= ['0'..'9'];
	cad:= texto;
	if ((cad[posi] = '-') and (cad[posi+1] in num)) or (cad[posi] in num) then
	begin
		mal:=0;
		posi:=posi+1;
		while (cad[posi] in num) and (posi <> length(cad)) do
		begin
			posi:=posi+1;
		end;
		if ((posi = length(cad)) and not (cad[posi] in num)) then
			mal:=1
		else
		begin
			if (posi <> length(cad)) then
				if (cad[posi]= '.') and (cad[posi+1] in num) then
				begin
					posi:=posi+1;
					while (cad[posi] in num) and (posi <> length(cad)) do
					begin
						posi:=posi+1;
					end;
					if ((posi= length(cad)) and not (cad[posi] in num)) then
						mal:=1
					else
					begin
						if ((cad[posi]='E') or (cad[posi]='e')) and ((cad[posi+1] in num) or ((cad[posi+1]='-') and (cad[posi+2] in num))) then
						begin
							posi:=posi+2;
							while (cad[posi] in num) and (posi <> length(cad)) do
							begin
								posi:=posi+1;
							end;
							if (posi = length(cad)) and not (cad[posi] in num) then
								mal:=1;
							if (posi<> length(cad)) and not (cad[posi] in num) then
								mal:=1;
						end
						else
							mal:=1;
					end
				end
				else
				begin
					if ((cad[posi]='E') or (cad[posi]='e')) and ((cad[posi+1] in num) or ((cad[posi+1]='-') and (cad[posi+2] in num))) then
					begin
						posi:= posi+2;
						while (cad[posi] in num) and (posi <> length(cad)) do
						begin
							posi:=posi+1;
						end;
						if (posi = length(cad)) and not (cad[posi] in num) then
						begin
							mal:=1;
						end;
						if (posi<> length(cad)) and not (cad[posi] in num) then
							mal:=1;
					end
					else
						mal:=1;
				end
			
		end
	end
	else
		mal:=1;
	if (mal=1) then
		cons:= false;
	if (mal=0) then
		cons:= true;
end;

Procedure ComponenteIgual(var cad:String; var pos:byte;var igual:boolean); {3}
begin
If cad[pos]='=' then
begin	
	pos:=pos+1;
	igual:=true;
end
else
	igual:=false;
end;

Procedure ComponenteMas(var cad:String;var pos:byte;var mas:boolean); {4}
begin
If cad[pos]='+' then
begin	
	pos:=pos+1;
	mas:=true;
end
else
	mas:=false;
end;

Procedure ComponenteMenos(var cad:String;var pos:byte;var menos:boolean); {5}
begin
If cad[pos]='-' then
begin	
	pos:=pos+1;
	menos:=true;
end
else
	menos:=false;
end;

Procedure ComponentePor(var cad:String;var pos:byte;var por:boolean); {6}
begin
If cad[pos]='*'then
begin
	pos:=pos+1;
	por:=true;
end
else
	por:=false;
end;

Procedure ComponenteDividir(var cad:String;var pos:byte;var dividir:boolean); {7}

begin
If cad[pos]='/'then
begin	
	pos:=pos+1;
	dividir:=true;
end
else
	dividir:=false;
end;

Procedure ComponentePuntoyComa(var cad:String;var pos:byte;var pcoma:boolean); {8}

begin
If cad[pos]=';'then
begin	
	pos:=pos+1;
	pcoma:=true;
end
else
	pcoma:=false;
end;

Procedure ComponentePunto(var cad:String;var pos:byte;var punto:boolean); {9}

begin
If cad[pos]='.'then
begin	
	pos:=pos+1;
	punto:=true;
end
else
	punto:=false;
end;

Procedure ComponenteParentesisAbre(var cad:String;var pos:byte;var parenta:boolean); {10}
begin
If cad[pos]='('then
begin
	pos:=pos+1;
	parenta:=true;
end
else
	parenta:=false;
end;

Procedure ComponenteParentesisCierra(var cad:String;var pos:byte;var parentc:boolean); {11}
begin
If cad[pos]=')' then
begin	
	pos:=pos+1;
	parentc:=true;
end
else
	parentc:=false;
end;

Procedure ComponenteLeer(var cad:String;var pos:byte;var leer:boolean);  {12}
begin
IF ((cad[pos]='L') or (cad[pos]='l')) and ((cad[pos+1]='e') or (cad[pos+1]='E')) and ((cad[pos+2]='e') or (cad[pos+2]='E')) and ((cad[pos+3]='r') or (cad[pos+3]='R')) then
begin
	pos:=pos+4;
	leer:=true
end
else
	leer:=false;
end;

Procedure ComponenteEscribir(var cad:String;var pos:byte;var escribir:boolean); {13}
begin
IF ((cad[pos]='E')or(cad[pos]='e'))and ((cad[pos+1]='S')or(cad[pos+1]='s'))and ((cad[pos+2]='C')or(cad[pos+2]='c'))and ((cad[pos+3]='R')or(cad[pos+3]='r'))and ((cad[pos+4]='I')or(cad[pos+4]='i'))and ((cad[pos+5]='B')or(cad[pos+5]='i'))and ((cad[pos+6]='I'
)or(cad[pos+6]='i'))and ((cad[pos+7]='R')or(cad[pos+7]='r'))then
begin
	pos:=pos+8;
	escribir:=true;
end
else
	escribir:=false;
end;

Procedure ComponenteTexto(var cad:String;var pos:byte;var texto:boolean); {14}
begin
IF  (cad[pos]='''') then
	begin
		pos:=pos+1;
		while cad[pos]<>'''' do begin pos:=pos+1; end;
		texto:=true;
	end
else
	texto:=false;
end;

Procedure Componente (var cad:String;var pos:byte;var componente:string);
var aux:byte;
	texto: string;
	R: boolean;
begin
aux:=pos;
ComponenteId(texto,aux,R); 						//1
IF R then
	componente:='1'
else
	begin											//2
	aux:=pos;
	ComponenteConstante(texto,aux,R) ;
	If R then
		componente:='2'
	else
		begin										//3
		aux:=pos;
		ComponenteIgual(texto,aux,R);
		If R then
			componente:='3'
		else
			begin									//4
			aux:=pos;
			ComponenteMas(texto,aux,R);
			If R then
				componente:='4'
			else
				begin								//5
				aux:=pos;
				ComponenteMenos(texto,aux,R);
				If R then
					componente:='5'
				else
					begin							//6
					aux:=pos;
					ComponentePor(texto,aux,R);
					If R then
						componente:='6'
						else
							begin												//7
							aux:=pos;
							ComponenteDividir(texto,aux,R); 								
							If R then
								componente:='7'
								else
									begin										//8
									aux:=pos;
									ComponentePuntoyComa(texto,aux,R);
									If R then
										componente:='8'
										else
											begin								//9
											aux:=pos;
											ComponentePunto(texto,aux,R);
											If R then
												componente:='9'
												else
													begin						//10
													aux:=pos;
													ComponenteParentesisAbre(texto,aux,R); 		
													If R then
														componente:='10'
														else
															begin											//11
															aux:=pos;
															ComponenteParentesisCierra(texto,aux,R);
															If R then
																componente:='11'
																else
																	begin									//12
																	aux:=pos;
																	ComponenteLeer(texto,aux,R);
																	If R then
																		componente:='12'
																		else
																			begin							//13
																			aux:=pos;
																			ComponentePor(texto,aux,R);
																			If R then
																				componente:='13'
																				else
																					begin					//14	
																					aux:=pos;
																					ComponenteTexto(texto,aux,R);
																					If R then
																						componente:='14';
																					end	
																			end
																	end			
															end
													end
											end
									end				
							end
					end
				end
			end			
		end
	end
					
end;
end.
