unit URegister;

interface

uses UItemID, UProductCatalog, USale, UMoney, UProductDescription;

type
  IRegicter = interface
    function getTotalSale():IMoney;
    procedure endSale();
    procedure enterItem(id: integer; quantity: integer);
    procedure makeNewSale();
    procedure makePayment(cashTendered: IMoney);
  end;

  TRegicter = class(TInterfacedObject, IRegicter)
  private
    /// <link>aggregation</link>
    catalog: IProductCatalog;
    /// <link>aggregation</link>
    currentSale: ISale;
  public
    function getTotalSale():IMoney;
    procedure endSale();
    procedure enterItem(id: integer; quantity: integer);
    procedure makeNewSale();
    procedure makePayment(cashTendered: IMoney);
    constructor Create(catalog: IProductCatalog);
  end;

implementation

{ Regicter }

constructor TRegicter.Create(catalog: IProductCatalog);
begin
//  catalog := TProductCatalog.Create;
  Self.catalog := catalog;
end;

procedure TRegicter.endSale;
begin
  currentSale.becomeComplete();
end;

procedure TRegicter.enterItem(id: integer; quantity: integer);
var
  desc: IProductDescription;
begin
  desc := catalog.getProductDescription(id);
  currentSale.makeLineItem(desc, quantity);
end;

function TRegicter.getTotalSale: IMoney;
begin
  result:=currentSale.getTotal;
end;

procedure TRegicter.makeNewSale;
begin
  currentSale := TSale.Create;
end;

procedure TRegicter.makePayment(cashTendered: IMoney);
begin
  currentSale.makePayment(cashTendered);
end;

end.
