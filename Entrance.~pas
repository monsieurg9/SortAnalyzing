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
    chkShowPassword: TCheckBox;
    procedure btnRegistrationClick(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
    procedure chkShowPasswordClick(Sender: TObject);
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

procedure TFEntrance.btnRegistrationClick(Sender: TObject);
begin
  Registration.ShowModal;
end;

procedure TFEntrance.btnEnterClick(Sender: TObject);
var
  allowEnter : boolean;
begin
  AllowEnter := False;
  poinUser := poinHead;
  while poinUser <> nil do
  begin
    if poinUser^.UserName = lbledtName.Text then
    begin
      if poinUser^.Password = lbledtPassword.Text then
      begin
        AllowEnter := True;
      end;
    end;
    PoinUser := poinUser^.PoinNext;
  end;
  poinUser := poinHead;

  if AllowEnter then
  begin
    Main.ShowModal;
  end
  else
  begin
    ShowMessage('Не удалось выполнить вход'+#13#10+'Пожалуйста, проверьте введенные данные');
  end;
end;

procedure TFEntrance.btnAdminClick(Sender: TObject);
begin
  if (lbledtName.Text = '') and (lbledtPassword.Text = '') then
  begin
    AdminForm.FillListView;
    adminForm.ShowModal;
  end
  else
  begin
    ShowMessage('Не удалось выполнить вход'+#13#10+'Пожалуйста, проверьте введенные данные');
  end;
end;

procedure TFEntrance.chkShowPasswordClick(Sender: TObject);
begin
  if chkShowpassword.Checked then
  begin
    lbledtPassword.PasswordChar := #0;
  end
  else
  begin
    lbledtPassword.PasswordChar := '*';
  end;

end;
end.
