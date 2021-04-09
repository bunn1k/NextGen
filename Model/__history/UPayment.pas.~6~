unit UPayment;

interface

uses UMoney;

type
  Payment = class
  private
    amount: Money;
  public
    procedure Payment(cashTendered: Money);
    function getAmount(): Money;
  end;

implementation

{ Payment }

function Payment.getAmount: Money;
begin
  result := amount;
end;

procedure Payment.Payment(cashTendered: Money);
begin
  amount := cashTendered;
end;

end.
