unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
  co:tnew;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  prov:boolean;

implementation



{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
if prov=false then
co:=tnew.Create(true)
else
prov:=false;
co.Resume;
co.Priority:=tpLower;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
co.Suspend;
prov:=true;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
co.Terminate;
co.Free;
end;

end.
