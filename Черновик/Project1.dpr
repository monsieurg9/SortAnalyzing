program SortingAnalysis;

uses
  Forms,
  TablesAndGraphics in 'TablesAndGraphics.pas' {FGraphics},
  Unit1 in 'Unit1.pas' {Main},
  Unit2 in 'Unit2.pas' {FRegistration};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TFGraphics, FGraphics);
  Application.CreateForm(TFRegistration, FRegistration);
  FGraphics.SetScale;
  FGraphics.Initialize;
  Application.Run;
end.
