program SortingAnalysis;

uses
  Forms,
  TablesAndGraphics in 'TablesAndGraphics.pas' {FGraphics},
  Menu in 'Menu.pas' {Main},
  Entrance in 'Entrance.pas' {FEntrance},
  UserRegistratin in 'UserRegistratin.pas' {Registration},
  AdmonForm in 'AdmonForm.pas' {AdminForm},
  DialogForm in 'DialogForm.pas' {Dialog};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFEntrance, FEntrance);
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TFGraphics, FGraphics);
  Application.CreateForm(TRegistration, Registration);
  Application.CreateForm(TAdminForm, AdminForm);
  Application.CreateForm(TDialog, Dialog);
  Registration.Initialize;
  FGraphics.SetScale;
  FGraphics.Initialize;
  Application.Run;
end.
