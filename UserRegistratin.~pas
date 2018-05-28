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
           Age             : cardinal;
           WorkPlace       : String[30];
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
    btnEditUser: TButton;
    lbledtAge: TLabeledEdit;
    lbledtWorkPlace: TLabeledEdit;
    txtMessage: TStaticText;
    procedure Initialize;
    procedure btnConfirmClick(Sender: TObject);
    procedure ClearEdits;
    procedure addUser(Var CurrPoin : poin; NewUser : User);
    procedure btnEditUserClick(Sender: TObject);
    procedure btnEditUserExit(Sender: TObject);
    function  checkUserName : boolean;
    function  checkLogin : boolean;
    function  checkNameAndSurname : boolean;
    function  checkWorkPlace : boolean;
    function  checkPassword : boolean;
    function  checkAge : boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  RusSymbols : Set of Char = ['а'..'я', 'А'..'Я'];
  EngSymbols : Set of Char = ['a'..'z', 'A'..'Z'];
  digits     : Set of Char = ['0'..'9'];

var
  Registration: TRegistration;
  Users : FileUsers;
  PoinHead, PoinUser : poin;
  BufUser, FirstUser : User;

implementation

uses Menu;

{$R *.dfm}


{ TRegistration }

procedure TRegistration.Initialize;
begin
  assignFile(Users, 'C:\Универ\ОАиП\SortAnalyzing\Users.dat');
  if not(FileExists('C:\Универ\ОАиП\SortAnalyzing\Users.dat')) then
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
  if checkPassword then
  begin
    if checkWorkplace then
    begin
      if checkNameAndSurname then
      begin
        if checkLogin then
        begin
          if checkAge then
          begin
            if lbledtPassword.Text = lbledtConfirmPassword.Text then
            begin
              if CheckUsername then
              begin
                poinUser := poinHead;
                while poinUser^.poinNext <> nil do
                begin
                  poinUser := poinUser^.PoinNext;
                end;

                with bufUser do
                begin
                  UserName := lbledtUserName.Text;
                  Password := lbledtPassword.Text;
                  ConfirmPassword := lbledtConfirmPassword.Text;
                  Name := lbledtName.Text;
                  SurName := lbledtSurName.Text;
                  Age := strToInt(lbledtAge.Text);
                  WorkPlace := lbledtWorkplace.Text;
                end;
                addUser(PoinUser, bufUser);

                assignFile(users, 'C:\Универ\ОАиП\SortAnalyzing\Users.dat');
                reset(Users);
                Seek(users, filesize(users));

                write(Users, bufUser);
                closeFile(Users);

                ClearEdits;
                Registration.close;

              end
              else
                ShowMessage('Такой логин уже существует'+#13#10+'Пожалуйста, введите другой');
            end
            else
              ShowMessage('Пароли не совпадают'+#13#10+'Пожалуйста, повторите попытку');
          end
          else
            ShowMessage('Проверьте введенный возраст и повторите попытку');
        end
        else
          ShowMessage('Проверьте введенный логин и повторите попытку');
      end
      else
        ShowMessage('Проверьте введенные имя и фамилию, и повторите попытку');
    end
    else
      ShowMessage('Проверьте введенное место работы, и повторите попытку');
  end
  else
    ShowMessage('Пароль должен содержать минимум 4 символа'+#13#10+'Пожалуйста, повторите попытку');
end;

procedure TRegistration.ClearEdits;
begin
  lbledtUserName.Text := '';
  lbledtPassword.Text := '';
  lbledtConfirmPassword.Text := '';
  lbledtName.Text := '';
  lbledtSurName.Text := '';
  lbledtAge.Text := '';
  lbledtWorkplace.Text := '';
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
  bufpoin^.Age := NewUser.Age;
  bufpoin^.WorkPlace := NewUser.WorkPlace;
  bufPoin^.PoinNext := nil;

  CurrPoin := bufPoin;
end;

procedure TRegistration.btnEditUserClick(Sender: TObject);
begin
  poinUser.UserName := lbledtUsername.Text;
  poinUser.Password := lbledtPassword.Text;
  poinUSer.ConfirmPassword := lbledtConfirmPassword.Text;
  poinUser.Name := lbledtName.Text;
  poinUser.SurName := lbledtSurname.Text;
  poinUser.Age := strToInt(lbledtAge.Text);
  poinUser.WorkPlace := lbledtWorkplace.Text;
  btnEditUser.Visible := False;
  btnConfirm.Visible := True;
  registration.Close;
end;

procedure TRegistration.btnEditUserExit(Sender: TObject);
begin
  Main.SaveData;
end;

function TRegistration.checkUserName : boolean;
begin
  Result := True;
  poinUser := poinHead;
  while poinUser^.poinNext <> nil do
  begin
    if poinUser^.UserName = lbledtUserName.Text then
      Result := False;
    poinUser := poinUser^.PoinNext;
  end;
end;

function TRegistration.checkLogin: boolean;
var
  i : cardinal;
begin
  Result := True;
  for i := 1 to length(lbledtUsername.Text) do
  begin
    if not((lbledtUsername.Text[i] in RusSymbols)
      or (lbledtUsername.Text[i] in EngSymbols)
      or (lbledtUsername.Text[i] in digits)
      or (lbledtUsername.Text[i] = '_')) then
    begin
      Result := False;
    end;
  end;
end;

function TRegistration.checkNameAndSurname: boolean;
var
  i : cardinal;
begin
  Result := True;
  for i := 1 to length(lbledtname.Text) do
  begin
    if not((lbledtName.Text[i] in RusSymbols)
      or (lbledtname.Text[i] in EngSymbols)) then
    begin
      Result := False;
    end;
  end;
  for i := 1 to length(lbledtSurname.Text) do
  begin
    if not((lbledtSurName.Text[i] in RusSymbols)
      or (lbledtSurname.Text[i] in EngSymbols)) then
    begin
      Result := False;
    end;
  end;
end;

function TRegistration.checkWorkPlace: boolean;
var
  i : cardinal;
begin
  Result := True;
  for i := 1 to length(lbledtWorkplace.Text) do
  begin
    if not((lbledtWorkplace.Text[i] in RusSymbols)
      or (lbledtWorkplace.Text[i] in EngSymbols)
      or (lbledtWorkplace.Text[i] in digits)
      or (lbledtWorkplace.Text[i] = '№')
      or (lbledtWorkplace.Text[i] = ' ')) then
    begin
      Result := False;
    end;
  end;
end;

function TRegistration.checkPassword: boolean;
begin
  if length(lbledtPassword.Text) < 3 then
    result := false
  else
    result := true;
end;

function TRegistration.checkAge: boolean;
var
  i : cardinal;
begin
  result := true;
  for i := 1 to length(lbledtWorkplace.Text) do
  begin
    if not((lbledtAge.Text[i] in digits)) then
    begin
      Result := False;
    end
  end;
end;

end.
