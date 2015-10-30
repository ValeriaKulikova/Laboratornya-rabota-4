unit Unit2;

interface

uses
  Classes, SysUtils;

type
  tnew = class(TThread)
  private
  index:integer;
    { Private declarations }
    procedure UpdateLabel;
  protected
    procedure Execute; override;
  end;

implementation

uses Unit1;
procedure tnew.UpdateLabel;
begin
Form1.Label1.Caption:=IntToStr(Index);
end;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure tnew.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ tnew }

procedure tnew.Execute;
begin
  { Place thread code here }
  index:=1;
  while index>0 do
  begin
  Synchronize(UpdateLabel);
  Inc(index);
  if index>100000 then
  index:=0;
  if terminated then exit;
  end;
end;

end.
