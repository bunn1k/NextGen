program Project1;

uses
  Vcl.Forms,
  Unit1 in 'View\Unit1.pas' {Form1},
  USales in 'Model\USales.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
