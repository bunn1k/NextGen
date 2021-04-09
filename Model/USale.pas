unit USale;

interface

uses UProductDescription, UMoney;

 type
 Sale = class
 private

 public
   procedure becomeComplete();
   procedure makeLineItem(desc:ProductDescription; quantity:integer);
   procedure makePayment(cashTendered:Money);
 end;
implementation

{ Sale }

procedure Sale.becomeComplete;
begin

end;

procedure Sale.makeLineItem(desc: ProductDescription; quantity: integer);
begin

end;

procedure Sale.makePayment(cashTendered: Money);
begin

end;

end.
