unit UFasad;

interface

uses URegister, UStore,UProductCatalog,UMoney,UItemID;

type
  IFasad = interface
    procedure getStore();
    procedure makeNewSale();
    function GetTotalSale(): IMoney;
    procedure EnterItem(id:integer; quantity:integer);
  end;

  TFasad = class(TInterfacedObject, IFasad)
  private
    Regicter: TRegicter;
    catalog: TProductCatalog;
    /// <link>aggregation</link>
    store: IStore;
  public
    procedure EnterItem(id:integer; quantity:integer);
    function GetTotalSale(): IMoney;
    procedure makeNewSale();
    procedure getStore();
    constructor Create();
  end;

implementation

{ TFasad }

constructor TFasad.Create;
begin
  catalog:=TProductCatalog.Create();
  Regicter:=TRegicter.Create(catalog);
end;

procedure TFasad.EnterItem(id:integer; quantity: integer);
begin
 Regicter.enterItem(id,quantity);
end;

procedure TFasad.getStore();
begin
  store := TStore.Create();
end;

function TFasad.GetTotalSale: IMoney;
begin
  result:=Regicter.getTotalSale;
end;

procedure TFasad.makeNewSale;
begin
  Regicter.makeNewSale;
end;

end.
