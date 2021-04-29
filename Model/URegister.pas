unit URegister;

interface
  uses UItemID, UProductCatalog, USale, UMoney, UProductDescription;
type
  IRegicter = interface
      procedure endSale();
      procedure enterItem(id: TItemID; quantity: integer);
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
      procedure endSale();
      procedure enterItem(id: TItemID; quantity: integer);
      procedure makeNewSale();
      procedure makePayment(cashTendered: IMoney);
      constructor Create(catalog: IProductCatalog);
    end;

  implementation

{ Regicter }

constructor TRegicter.Create(catalog: IProductCatalog);
begin
  Self.catalog:=catalog;
end;

procedure TRegicter.endSale;
begin
  currentSale.becomeComplete();
end;

procedure TRegicter.enterItem(id: TItemID; quantity: integer);
var desc:IProductDescription;
begin
  desc:=catalog.getProductDescription(id);
  currentSale.makeLineItem(desc,quantity);
end;

procedure TRegicter.makeNewSale;
begin
  currentSale:=TSale.Create;
end;

procedure TRegicter.makePayment(cashTendered: IMoney);
begin
  currentSale.makePayment(cashTendered);
end;

end.
