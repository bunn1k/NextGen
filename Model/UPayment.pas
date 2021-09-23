unit UPayment;

interface

uses UMoney;

type
  IPayment = interface
    function getAmount(): IMoney;
  end;

  TPayment = class(TInterfacedObject, IPayment)
  private
    amount: IMoney;
  public
    constructor Create(cashTendered: IMoney);
    function getAmount(): IMoney;
  end;

implementation

{ Payment }

function TPayment.getAmount: IMoney;
begin
  result := amount;
end;

constructor TPayment.Create(cashTendered: IMoney);
begin
  amount := cashTendered;
end;

end.
