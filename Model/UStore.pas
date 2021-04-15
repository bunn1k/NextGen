unit UStore;

interface

 uses UProductCatalog, URegister;

 type
   IStore = interface
    function getRegister(): TRegicter;
  end;

  TStore = class(TInterfacedObject, IStore)
  private
    catalog: TProductCatalog;
    regicter: TRegicter;
  public
    constructor Create();
    function getRegister(): TRegicter;
  end;

implementation

{ Store }

constructor TStore.Create;
begin

end;

function TStore.getRegister: TRegicter;
begin
  result:=regicter;
end;

end.
