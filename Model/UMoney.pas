unit UMoney;

interface

type
  TMoney = class;

  IMoney = interface
    procedure add(value: IMoney);
    function times(quantity: integer): IMoney;
    function minus(value: IMoney): IMoney;
  end;

  TMoney = class(TInterfacedObject, IMoney)
    constructor Create(value: integer);
    procedure add(value: IMoney);
    function times(quantity: integer): IMoney;
    function minus(value: IMoney): IMoney;
  end;

implementation

{ Money }

procedure TMoney.add(value: IMoney);
begin

end;

constructor TMoney.Create(value: integer);
begin

end;

function TMoney.minus(value: IMoney): IMoney;
begin

end;

function TMoney.times(quantity: integer): IMoney;
begin
  Result:=Self;
end;

end.
