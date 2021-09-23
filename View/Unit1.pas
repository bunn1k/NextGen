unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UFasad, Unit2,UItemID;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    /// <link>aggregation</link>
    fasad: IFasad;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
var quantity:integer;
    id:integer;
begin
  id:=strtoint(edit1.Text);
  quantity:=strtoint(edit2.Text);
  Fasad.EnterItem(id,quantity);

  edit1.Text:='0';
  edit2.Text:='0';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fasad := TFasad.Create();
  fasad.getStore;
   fasad.makeNewSale;
end;

end.
