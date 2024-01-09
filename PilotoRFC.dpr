program PilotoRFC;

uses
  System.StartUpCopy,
  FMX.Forms,
  view.frmMain in 'src\view\view.frmMain.pas' {frmMain},
  controller.SAP_RFC in 'src\controller\controller.SAP_RFC.pas',
  controller.iniFile in 'src\controller\controller.iniFile.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
