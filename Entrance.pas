unit Entrance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFEntrance = class(TForm)
    lbledtName: TLabeledEdit;
    lbledtPassword: TLabeledEdit;
    btnEnter: TButton;
    btnRegistration: TButton;
    btnAdmin: TButton;
    btnCheats: TButton;
    procedure btnCheatsClick(Sender: TObject);
    procedure btnRegistrationClick(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEntrance: TFEntrance;

implementation

Uses Menu, UserRegistratin, AdmonForm;

{$R *.dfm}

procedure TFEntrance.btnCheatsClick(Sender: TObject);
begin
  Main.ShowModal;     
end;

procedure TFEntrance.btnRegistrationClick(Sender: TObject);
begin
  Registration.ShowModal;
end;

procedure TFEntrance.btnEnterClick(Sender: TObject);
begin
  poinUser := poinHead;
end;

procedure TFEntrance.btnAdminClick(Sender: TObject);
begin
  AdminForm.FillListView;
  adminForm.ShowModal;
end;

end.
