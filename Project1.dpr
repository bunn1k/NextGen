program Project1;

uses
  Vcl.Forms,
  Unit1 in 'View\Unit1.pas' {Form1},
  USale in 'Model\USale.pas',
  USalesLineItem in 'Model\USalesLineItem.pas',
  ULedger in 'Model\ULedger.pas',
  UProductCatalog in 'Model\UProductCatalog.pas',
  UProductDescription in 'Model\UProductDescription.pas',
  UItemID in 'Model\UItemID.pas',
  UStore in 'Model\UStore.pas',
  URegister in 'Model\URegister.pas',
  UCashPayment in 'Model\UCashPayment.pas',
  UCustomer in 'Model\UCustomer.pas',
  UCashier in 'Model\UCashier.pas',
  UPayment in 'Model\UPayment.pas',
  UMoney in 'Model\UMoney.pas',
  UDate in 'Model\UDate.pas',
  UFasad in 'Model\UFasad.pas',
  Unit2 in 'View\Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
