unit URegister;

interface

uses UItemID, UProductCatalog, USale, UMoney, UProductDescription;

 type
 Regicter = class
 private
   catalog:ProductCatalog;
   currentSale:Sale;
 public
   procedure endSale();
   procedure enterItem(id:ItemID; quantity:integer);
   procedure makeNewSale();
   procedure makePayment(cashTendered:Money);
   constructor Create(catalog:ProductCatalog);
 end;
implementation

{ Regicter }

constructor Regicter.Create(catalog: ProductCatalog);
begin
  Self.catalog:=catalog;
end;

procedure Regicter.endSale;
begin
  currentSale.becomeComplete();
end;

procedure Regicter.enterItem(id: ItemID; quantity: integer);
var desc:ProductDescription;
begin
  desc:=catalog.getProductDescription(id);
  currentSale.makeLineItem(desc, quantity);
end;

procedure Regicter.makeNewSale;
begin
  currentSale:=Sale.Create;
end;

procedure Regicter.makePayment(cashTendered: Money);
begin
  currentSale.makePayment(cashTendered);
end;

end.
