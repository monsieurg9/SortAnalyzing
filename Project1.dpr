program Project1;

uses
  Forms,
  Stuff in 'Stuff.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Main.SetScale;
  Application.Run;
end.
