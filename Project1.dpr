program Project1;

uses
  Forms,
  Stuff in 'Stuff.pas' {Main},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TForm1, Form1);
  Main.SetScale;
  Application.Run;
end.
