unit UserRegistratin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  poin = ^User;

  User = Record
           UserName        : String[30];
           Password        : String[30];
           ConfirmPassword : String[30];
           Name            : String[30];
           SurName         : String[30];
           PoinNext        : poin;
         end;
  FileUsers = file of User;

  TRegistration = class(TForm)
    lbledtUsername: TLabeledEdit;
    lbledtPassword: TLabeledEdit;
    lbledtConfirmPassword: TLabeledEdit;
    lbledtName: TLabeledEdit;
    btnConfirm: TButton;
    lbledtSurname: TLabeledEdit;
    btnCancel: TButton;
    procedure Initialize;
    procedure btnConfirmClick(Sender: TObject);
    procedure ClearEdits;
//    procedure btnCancelClick(Sender: TObject);
    procedure addUser(Var CurrPoin : poin; NewUser : User);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Registration: TRegistration;
  Users : FileUsers;
  PoinHead, PoinUser : poin;
  BufUser, FirstUser : User;

implementation

{$R *.dfm}


{ TRegistration }

procedure TRegistration.Initialize;
begin
  assignFile(Users, 'C:\”нивер\ќјиѕ\SortAnalyzing\Users.dat');
  if not(FileExists('C:\”нивер\ќјиѕ\SortAnalyzing\Users.dat')) then
  begin
    Rewrite(Users);
    CloseFile(users);
    New(poinHead);
    PoinUser := PoinHead;
    PoinUser^.PoinNext := nil;
  end
  else
  begin
    New(poinHead);
    PoinUser := PoinHead;
    PoinUser^.PoinNext := nil;

    reset(users);
    while not(EoF(Users)) do
    begin
      read(Users, bufUser);
      addUser(poinUser, bufUser);
    end;
    closeFile(users);
  end;


end;

procedure TRegistration.btnConfirmClick(Sender: TObject);
begin
  if lbledtPassword.Text = lbledtConfirmPassword.Text then
  begin
    bufUser.UserName := lbledtUserName.Text;
    bufUser.Password := lbledtPassword.Text;
    bufUser.ConfirmPassword := lbledtConfirmPassword.Text;
    bufUser.Name := lbledtName.Text;
    bufUser.SurName := lbledtSurName.Text;
    addUser(PoinUser, bufUser);

    assignFile(users, 'C:\”нивер\ќјиѕ\SortAnalyzing\Users.dat');
    reset(Users);
    Seek(users, filesize(users));

    write(Users, bufUser);
    closeFile(Users);

    ClearEdits;
    Registration.close;
  end
  else
    ShowMessage('ѕароли несовпадают'+#13#10+'ѕожалуйста, повторите попытку');
end;

procedure TRegistration.ClearEdits;
begin
  lbledtUserName.Text := '';
  lbledtPassword.Text := '';
  lbledtConfirmPassword.Text := '';
  lbledtName.Text := '';
  lbledtSurName.Text := '';
end;
 {
procedure TRegistration.btnCancelClick(Sender: TObject);
begin
  ClearEdits;
  registration.close;
end;
  }
procedure TRegistration.addUser(Var CurrPoin : poin; NewUser : User);
var
  bufPoin : poin;
Begin                                 
  New(bufPoin);
  CurrPoin^.PoinNext := bufPoin;

  bufpoin^.UserName := NewUser.UserName;
  bufpoin^.Password := NewUser.Password;
  bufpoin^.ConfirmPassword := NewUser.ConfirmPassword;
  bufpoin^.Name := NewUser.Name;
  bufpoin^.SurName := NewUser.SurName;
  bufPoin^.PoinNext := nil;

  CurrPoin := bufPoin;
end;

end.