unit UPayment;

interface

uses UMoney;

type
  IPayment = interface
    function getAmount(): TMoney;
  end;

  TPayment = class(TInterfacedObject, IPayment)
  private
    amount: TMoney;
  public
    constructor Create(cashTendered: TMoney);
    function getAmount(): TMoney;
  end;

implementation

{ Payment }

function TPayment.getAmount: TMoney;
begin
  result := amount;
end;

constructor TPayment.Create(cashTendered: TMoney);
begin
  amount := cashTendered;
end;

end.
