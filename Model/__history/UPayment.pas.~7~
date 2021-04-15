unit UPayment;

interface

uses UMoney;

type
  Payment = class
  private
    amount: Money;
  public
    constructor Create(cashTendered: Money);
    function getAmount(): Money;
  end;

implementation

{ Payment }

function Payment.getAmount: Money;
begin
  result := amount;
end;

constructor Payment.Create(cashTendered: Money);
begin
  amount := cashTendered;
end;

end.
