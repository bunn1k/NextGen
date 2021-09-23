unit UStore;

interface

uses uproductdescription, UProductCatalog, URegister;

type
  IStore = interface
    function getRegister(): IRegicter;
  end;

  TStore = class(TInterfacedObject, IStore)
  private
    /// <link>aggregation</link>
    catalog: IProductCatalog;
    /// <link>aggregation</link>
    regicter: IRegicter;
  public
    function getRegister(): IRegicter;
    constructor Create();
  end;

implementation

{ TStore }

constructor TStore.Create;
begin
  catalog := TProductCatalog.Create;
  regicter := TRegicter.Create(catalog);
end;

function TStore.getRegister: IRegicter;
begin
  result := regicter;
end;

end.
