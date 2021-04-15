unit URegister;

interface

uses UItemID, UProductCatalog, USale, UMoney, UProductDescription;

 type
   IRegicter = interface
    procedure endSale();
    procedure enterItem(id: TItemID; quantity: integer);
    procedure makeNewSale();
    procedure makePayment(cashTendered: TMoney);
  end;

  TRegicter = class(TInterfacedObject, IRegicter)
  private
    catalog: TProductCatalog;
    currentSale: TSale;
  public
    procedure endSale();
    procedure enterItem(id: TItemID; quantity: integer);
    procedure makeNewSale();
    procedure makePayment(cashTendered: TMoney);
    constructor Create(catalog: TProductCatalog);
  end;

implementation

{ Regicter }

constructor TRegicter.Create(catalog: TProductCatalog);
begin
  Self.catalog:=catalog;
end;

procedure TRegicter.endSale;
begin
  currentSale.becomeComplete();
end;

procedure TRegicter.enterItem(id: TItemID; quantity: integer);
var desc:TProductDescription;
begin
  desc:=catalog.getProductDescription(id);
  currentSale.makeLineItem(desc, quantity);
end;

procedure TRegicter.makeNewSale;
begin
  currentSale:=TSale.Create;
end;

procedure TRegicter.makePayment(cashTendered: TMoney);
begin
  currentSale.makePayment(cashTendered);
end;

end.
