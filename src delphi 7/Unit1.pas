unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, Menus, Buttons, OleCtrls, MSCommLib_TLB;
type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label2: TLabel;
    Button4: TButton;
    Button5: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    XPManifest1: TXPManifest;
    MainMenu1: TMainMenu;
    Archivo1: TMenuItem;
    Compra1: TMenuItem;
    Productos1: TMenuItem;
    Nueva1: TMenuItem;
    Agregar1: TMenuItem;
    Borrar1: TMenuItem;
    Guardar1: TMenuItem;
    N1: TMenuItem;
    salir1: TMenuItem;
    Ayuda1: TMenuItem;
    Acercade1: TMenuItem;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    Editar1: TMenuItem;
    borrar2: TMenuItem;
    SpeedButton7: TSpeedButton;
    MSComm1: TMSComm;
    Configuracin1: TMenuItem;
    procedure ListBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ListBox1MeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure Button5Click(Sender: TObject);
    procedure ListBox1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Agregar1Click(Sender: TObject);
    procedure Borrar1Click(Sender: TObject);
    procedure Nueva1Click(Sender: TObject);
    procedure salir1Click(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure borrar2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Configuracin1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
Form1: TForm1;
total,paga:variant;
pagado:integer;
arr:TStringList;
balanza:string;
implementation

uses Unit2;

{$R *.dfm}

//check crc comunicaci�n con balanza.

function crc_check(str:string;crc:string):integer;
var i,t:integer;
begin
  t:=2;
  for i:=2 to length(str) do
  begin
   t:= t xor strtoint(str[i]);
  end;
  t:= t xor 3;
  
  if t=ord(crc[1]) then
  begin
    crc_check:= 1;
  end
  else
  begin
    crc_check:=0;
  end;
end;

(*
  Devuelve el peso le�do en la balanza.
 *)
function peso_balanza():integer;
var entrada:OleVariant;var s,peso:string;
var j:integer;
begin
  try
    if form1.mscomm1.PortOpen <> true then form1.mscomm1.PortOpen:=true;
    //form1.mscomm1.Output:= #02+'12,345'+#03+#00;
    form1.mscomm1.Output:= #05;
    sleep(200);
    s:=String(form1.mscomm1.Input);

    if length(s)>6 then
    begin
      peso:= copy(s,2,6);
      j:=crc_check(peso,copy(s,9,1));
      if j<>1 then application.MessageBox(pchar('error de crc'),pchar('error'),0);
      peso_balanza:=  strtoint(peso);
      form1.mscomm1.output:=#06;
    end;

  except
    application.MessageBox('error de comunicacion con balanza','error',0);
  end;
end;



Procedure update_list();
var i,p,p2:integer;var c,CurrencyString,s,s2:string;var vuelto:variant;
begin
total:=0;
  for i:= 0 to form1.listbox1.Count -1 do
  begin
    try
      c := form1.listbox1.Items.ValueFromIndex[i];
      p:=pos('$',c)+1;
      p2:=pos('*',c);
      if p2=0 then
      begin
        p2:= length(c)+1;
        s:= copy(c,p,p2-p);
        total:= total+strtofloat(s);
      end
      else
      begin
        s:= copy(c,p,p2-p);
        s2:= copy(c,p2+1,length(c)-3-p2);
        total:= total+strtofloat(s)*strtofloat(s2);
      end;
    except
      application.MessageBox('ocurri� un error', 'un error',0);
    end;
  end;
    CurrencyString := '? ';
    form1.label2.Caption:=floattostrf(total, ffCurrency,5,2)+'.-';
    vuelto:= paga-total;
    form1.label5.Caption:= '$' + floattostr(paga);
    if (vuelto >= 0) then
    begin
      form1.label6.Caption:= '$'+ floattostr(vuelto);
    end
    else
    begin
      form1.label6.Caption:= '-';
    end;
      form1.listbox1.TopIndex := form1.listbox1.Items.Count - 1;
end;



procedure TForm1.ListBox2KeyPress(Sender: TObject; var Key: Char);
var i:integer;
var str,kg:string;
begin
  IF key = #13 then
  begin
    i:=listbox2.ItemIndex;
    str:=listbox2.Items.ValueFromIndex[i];
    if pos('kg',str)<>0 then
      begin
        if balanza = 'no' then
        begin
        kg:=inputbox('Peso', 'cuantos kg pesa','1');
        end
        else
        begin
        kg:=floattostr(peso_balanza()/1000);
        end;
        if strtofloat(kg)<>0 then
        listbox1.AddItem(inttostr(listbox1.Count+1)+'-'+str+ ' * '+ kg +' kg',nil);
      end
      else
      begin
        listbox1.AddItem(inttostr(listbox1.Count+1)+'-'+str,nil);
      end;
    update_list;

  end
  else
  begin
  edit1.SetFocus;
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
total:=0;
pagado:=0;
listbox1.Clear;
label2.Caption:='$0,00';
label5.Caption:='$0,00';
label6.Caption:='$0,00';
listbox2.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
var str:string;
begin
str:=inputbox('Agregar', 'Producto a Agregar', '');
if (pos('.',str)<>0 ) or (pos('$',str)=0)  then
begin
 application.MessageBox('Producto mal ingresado','error',0);

end
else
begin
listbox2.addItem(' ' + str,nil);
arr.clear;
arr.AddStrings(listbox2.Items);
listbox2.SetFocus;
end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin

listbox2.DeleteSelected;
listbox2.SetFocus;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
edit1.Text:='';
listbox2.Items.SaveToFile('datos.cfg');
end;

procedure TForm1.FormCreate(Sender: TObject);
var conf:TStringList;
begin
if fileexists('conf.cfg') then
  begin
  try
    conf:=TStringList.Create;
    conf.LoadFromFile('conf.cfg');
    mscomm1.CommPort:=strtoint(conf.Strings[0]);
    if(conf.strings[1]= 'balanza:SI') then
    begin
      balanza := 'si'
    end
    else
    begin
      balanza := 'no';
    end;
  except
   application.MessageBox(pchar('error tratando de leer la configuracion'),pchar('error'),0);
  end;

end;



pagado:=0;
listbox2.Items.LoadFromFile('datos.cfg');
arr := TStringList.Create;
arr.clear;
arr.AddStrings(listbox2.Items);

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
form1.Caption := form1.Caption + ' ' + inttostr(form1.listbox2.count) + ' productos.';
listbox2.SetFocus;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
listbox1.addItem(inttostr(listbox1.Count+1)+'-'+inputbox('Agregar', 'Producto a Agregar', ''),nil);
update_list;
listbox2.SetFocus;
end;
procedure TForm1.ListBox1MeasureItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
begin
      application.MessageBox('evento', 'evento',0);
end;
procedure TForm1.Button5Click(Sender: TObject);
var str:string;
begin
str:=inputbox('Paga con', 'Plata que paga', '');
paga:= strtofloat(str);
update_list;
end;
procedure TForm1.ListBox1KeyPress(Sender: TObject; var Key: char);
begin
if key ='r' then
begin
listbox1.DeleteSelected;
update_list;
end;
end;
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
button2.Click;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
button3.Click;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
button1.Click;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
button5.click;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
button4.Click;
end;

procedure TForm1.Agregar1Click(Sender: TObject);
begin
button2.Click;
end;

procedure TForm1.Borrar1Click(Sender: TObject);
begin
button3.click;
end;

procedure TForm1.Nueva1Click(Sender: TObject);
begin
button1.Click;
end;

procedure TForm1.salir1Click(Sender: TObject);
begin
listbox2.Items.SaveToFile('datos.cfg');
application.Terminate;
end;

procedure TForm1.Guardar1Click(Sender: TObject);
begin
try
listbox2.Items.SaveToFile('datos.cfg');
except
application.MessageBox('Hubo un error tratando de guardar','error');
end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var
  i: Integer;
  begin
  ListBox2.Items.BeginUpdate;
  ListBox2.Items.Clear;
  if length(Edit1.Text) = 0 then
    ListBox2.Items.AddStrings(arr)
  else
    for i := 0 to arr.Count - 1 do
      if Pos(Edit1.Text, arr[i]) <> 0 then
        ListBox2.Items.Add(arr[i]);
  ListBox2.Items.EndUpdate;
end;
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if (ord(key) = 13) or (ord(key) = VK_UP) or (ord(key) = VK_DOWN) then listbox2.SetFocus;

end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
edit1.Text:='';
end;

procedure TForm1.Editar1Click(Sender: TObject);
var i:integer;
var str:string;
begin
i:=listbox2.ItemIndex;
str := inputbox('Editar', 'Producto a Editar', listbox2.Items.ValueFromIndex[i]);
listbox2.Items.Strings[i]:=str;
end;

procedure TForm1.borrar2Click(Sender: TObject);
begin
BUTTON3.Click;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
var peso:variant;
begin
peso:=peso_balanza();
application.MessageBox(pchar('Peso:'+ floattostr(peso/1000) + ' kg'),'Peso medido por la balanza.',0);
end;
procedure TForm1.Configuracin1Click(Sender: TObject);
begin
form2.ShowModal;
end;

end.
