unit controller.iniFile;

interface

uses IniFiles, sysutils, Vcl.Dialogs;

procedure SetVariaveis;
procedure LerIni;
procedure GravarIni;

var
  NomeArquivo : string;

  ID_SISTEMA  : string;
  N_INSTANCIA : string;
  SERVIDOR    : string;
  MANDANTE    : string;
  IDIOMA      : string;
  USUARIO     : string;
  SENHA       : string;

implementation

procedure ExecuteLeituraIni;
begin
  SetVariaveis;
  LerIni;
  GravarIni;
end;

procedure SetVariaveis;
begin

end;

procedure GravarIni;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(NomeArquivo);

  ini.WriteString('AMBIENTE','ID_SISTEMA', ID_SISTEMA);
  ini.WriteString('AMBIENTE','N_INSTANCIA', N_INSTANCIA);
  ini.WriteString('AMBIENTE','SERVIDOR', SERVIDOR);
  ini.WriteString('AMBIENTE','MANDANTE', MANDANTE);
  ini.WriteString('AMBIENTE','IDIOMA', IDIOMA);

  ini.WriteString('ACESSO','USUARIO', USUARIO);
  ini.WriteString('ACESSO','SENHA', SENHA);

  ini.Free;
end;

procedure LerIni;
var
  ini: TIniFile;
begin
  NomeArquivo := StringReplace(ExtractFileName(ParamStr(0)), '.exe', '', [rfReplaceAll]);
  NomeArquivo := ExtractFilePath(ParamSTR(0)) + NomeArquivo + '.ini';

  ini := TIniFile.Create(NomeArquivo);

  ID_SISTEMA  := ini.ReadString('AMBIENTE','ID_SISTEMA', ID_SISTEMA);
  N_INSTANCIA := ini.ReadString('AMBIENTE','N_INSTANCIA', N_INSTANCIA);
  SERVIDOR    := ini.ReadString('AMBIENTE','SERVIDOR', SERVIDOR);
  MANDANTE    := ini.ReadString('AMBIENTE','MANDANTE', MANDANTE);
  IDIOMA      := ini.ReadString('AMBIENTE','IDIOMA', IDIOMA);

  USUARIO := ini.ReadString('ACESSO','USUARIO', USUARIO);
  SENHA   := ini.ReadString('ACESSO','SENHA', SENHA);

  ini.Free;
end;




initialization
ExecuteLeituraIni;

end.



