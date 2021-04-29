unit UFasad;

interface

uses URegister, UStore;

type
  IFasad = interface
    procedure getStore();
  end;

  TFasad = class(TInterfacedObject, IFasad)
  private
    /// <link>aggregation</link>
    store: IStore;
  public
    procedure getStore();
    constructor Create();
  end;

implementation

{ TFasad }

constructor TFasad.Create;
begin

end;

procedure TFasad.getStore();
begin
  store := TStore.Create();
end;

end.
