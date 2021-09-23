unit UItemID;

interface

type
  TItemID = class
  private
  id:integer;
  public

    function get():integer;
    constructor Create(id: integer);
  end;

implementation

{ ItemID }

constructor TItemID.Create(id: integer);
begin
  self.id:=id;
end;

function TItemID.get: integer;
begin
  result:=id;
end;

end.
