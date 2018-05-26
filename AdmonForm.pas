unit AdmonForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TAdminForm = class(TForm)
    lvUsers: TListView;
    pnlEditListButtons: TPanel;
    btnAddUser: TButton;
    lblUsers: TLabel;
    btnEditUser: TButton;
    btnDeleteUser: TButton;
    procedure FillListView;
    procedure btnAddUserClick(Sender: TObject);
    procedure btnDeleteUserClick(Sender: TObject);
    procedure btnEditUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdminForm: TAdminForm;

implementation

uses UserRegistratin, Entrance;

{$R *.dfm}

{ TAdminForm }

procedure TAdminForm.FillListView;
var
  item : TListItem;
  i : cardinal;
begin
  {
  reset(users);
  lvUsers.Clear;
  i := 0;
  while not(EoF(Users)) do
  begin
    Item := TListItem.Create(lvUsers.Items);
    read(Users, bufUser);
    Item.Caption := IntToStr(i+1);
    item.SubItems.add(bufUser.UserName);
    item.SubItems.Add(bufUser.Password);
    item.SubItems.Add(bufUser.Name);
    item.SubItems.Add(bufUser.SurName);
    lvUsers.Items.Insert(i);
    lvUsers.Items.Item[i] := item;
    item.Free;
    inc(i);
  end;
  closeFile(users);
  }
  poinUser := poinHead^.PoinNext;
  lvUsers.Clear;
  i := 0;
  while poinUser <> nil do
  begin
    Item := TListItem.Create(lvUsers.Items);
    Item.Caption := IntToStr(i+1);
    item.SubItems.add(poinUser^.UserName);
    item.SubItems.Add(poinUser^.Password);
    item.SubItems.Add(poinUser^.Name);
    item.SubItems.Add(poinUser^.SurName);
    lvUsers.Items.Insert(i);
    lvUsers.Items.Item[i] := item;
    item.Free;
    inc(i);
    poinUser := poinUser^.PoinNext;
  end;
  poinUser := poinHead;
end;

procedure TAdminForm.btnAddUserClick(Sender: TObject);
begin
  Registration.ShowModal;
  AdminForm.FillListView;
end;

procedure TAdminForm.btnDeleteUserClick(Sender: TObject);
var
  i : cardinal;
  BufPoin : Poin;
begin
  poinUser := poinHead;
  if lvUsers.ItemIndex <> -1 then
  begin
    i := 0;
    while i <> lvUsers.itemIndex do
    begin
      poinUser := poinUser^.PoinNext;
      inc(i);
    end;

    bufPoin := poinUser^.PoinNext;
    poinUser^.PoinNext := poinUser^.PoinNext^.PoinNext;
    dispose(BufPoin);

    FillListView;
    poinUser := poinHead;
  end;
end;

procedure TAdminForm.btnEditUserClick(Sender: TObject);
var
  i : integer;
begin
  poinUser := poinHead;
  if lvUsers.ItemIndex <> -1 then
  begin
    i := 0;
    while i <> lvUsers.itemIndex+1 do
    begin
      poinUser := poinUser^.PoinNext;
      inc(i);
    end;


    registration.lbledtUsername.Text := poinUser.UserName;
    registration.lbledtPassword.Text := poinUser.Password;
    registration.lbledtConfirmPassword.Text := poinUSer.ConfirmPassword;
    registration.lbledtName.Text := poinUser.Name;
    registration.lbledtSurname.Text := poinUser.SurName;
    registration.ShowModal;

    FillListView;
    poinUser := poinHead;
  end;
  Registration.clearedits;
end;
end.
