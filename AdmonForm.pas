unit AdmonForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TAdminForm = class(TForm)
    lvUsers: TListView;
    procedure FillListView;
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
  reset(users);
  Item := TListItem.Create(lvUsers.Items);
  i := 0;
  //while not(EoF(Users)) do
  begin
    read(Users, bufUser);
    Item.Caption := bufUser.UserName;
    item.SubItems.Add(bufUser.Name);
    item.SubItems.Add(bufUser.SurName);
    lvUsers.Items.Insert(0);
    lvUsers.Items.Item[0] := item;
    item.Free;
    inc(i);
  end;
  closeFile(users);
end;

end.
