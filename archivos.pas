{$IFDEF FPC}
  {$MODE DELPHI}
{$ENDIF}


unit  archivos;

interface
uses
  Sysutils;

function abrirArchivo(var archivo:TextFile; ruta:string):boolean;
procedure cerrarArchivo(var archivo:TextFile);
function leerCaracter(var archivo:TextFile):char;

implementation

function abrirArchivo(var archivo:TextFile; ruta:string):boolean;
begin
  {$I-}
  {try
    reset(archivo);
  finally
    try
      assignFile(archivo, ruta);
      reset(archivo);
    finally
      abrirArchivo := false;
    end;  // ### FIN DE TRY 2
  end;  // ### FIN DE TRY 1}

  assignFile(archivo, ruta);
  reset(archivo);

  abrirArchivo := true;
  {$I+}
end;  // ### FIN DE abrirArchivo

procedure cerrarArchivo(var archivo:TextFile);
begin
  closeFile(archivo);
end;

function leerCaracter(var archivo:TextFile):char;
var
  salida:char;
begin
  if (not eof(archivo)) then
  begin
    read(archivo, salida);
    leerCaracter := salida;
  end;
end;



end.  // ### FIN DE IMPLEMENTATION
