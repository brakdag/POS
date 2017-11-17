unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var conf:TStringList;
begin
try
  conf:=TStringList.Create();


  conf.Add(edit1.Text);
  if checkbox1.Checked = true then
  begin
    conf.Add('balanza:SI');
  end
  else
  begin
  conf.Add('balanza:NO');
  end;

  conf.SaveToFile('conf.cfg');
except
  Application.MessageBox(pchar('error tratando de guardar configuracion'),pchar('error'),0);
end;
form2.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
var conf:TStringList;
begin

 if fileexists('conf.cfg') then
  begin
  try
    conf:=TStringList.Create;
    conf.LoadFromFile('conf.cfg');
    edit1.Text:=conf.Strings[0];
    if(conf.strings[1]= 'balanza:SI') then
    begin
      checkbox1.Checked := true
    end
    else
    begin
      checkbox1.Checked := false;
    end;
  except
   application.MessageBox(pchar('error tratando de leer la configuracion'),pchar('error'),0);
  end;

  end;
end;
end.
