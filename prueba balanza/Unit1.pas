unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, MSCommLib_TLB;

type
  TForm1 = class(TForm)
    MSComm1: TMSComm;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var s:string;
var p:variant;
begin
if mscomm1.PortOpen =false then mscomm1.PortOpen :=true;
mscomm1.Output := #05;
sleep(200);
s:= copy(String(mscomm1.Input),2,6);
if s<>'' then
begin
p:= strtoint(s);
label1.Caption:= floattostr(p/1000);
mscomm1.Output:=#06;
end;
end;

end.
