unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, Menus;

type
  TMain = class(TForm)
    btnGraphics: TButton;
    btnChangeUser: TButton;
    btnExit: TButton;
    btnInfo: TButton;
    mmMenu: TMainMenu;
    N1: TMenuItem;
    procedure btnGraphicsClick(Sender: TObject);
    procedure btnChangeUserClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure SaveData;
    procedure N1Click(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    changeUser : boolean;
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses TablesAndGraphics, Entrance, UserRegistratin, SortInformation;

{$R *.dfm}

procedure TMain.btnGraphicsClick(Sender: TObject);
begin
  FGraphics.ShowModal;
end;

procedure TMain.btnChangeUserClick(Sender: TObject);
begin
  ChangeUser := true;
  main.close;
end;

procedure TMain.btnExitClick(Sender: TObject);
var
  bufUser : User;
begin
  SaveData;
  Main.Close;
  FEntrance.Close;
end;

procedure TMain.SaveData;
begin
  assignFile(Users, 'C:\”ÌË‚Â\Œ¿Ëœ\SortAnalyzing\Users.dat');
  rewrite(Users);
  poinUser := poinHead^.PoinNext;
  while poinUser <> nil do
  begin
    BufUser.UserName := poinUser^.UserName;
    BufUser.Password := poinUser^.Password;
    BufUser.ConfirmPassword := poinUser^.ConfirmPassword;
    BufUser.Name := poinUser^.Name;
    BufUser.SurName := poinUser^.SurName;
    bufUser.Age := poinUser^.Age;
    bufUser.WorkPlace := poinUser^.WorkPlace;
    Write(Users, BufUser);
    poinUser := PoinUser.PoinNext;
  end;
end;

procedure TMain.N1Click(Sender: TObject);
begin
  ShowMessage('»‰');
end;

procedure TMain.btnInfoClick(Sender: TObject);
begin
  Information.ShowModal;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if changeUser then
  begin
    Main.Close;
    ChangeUser := false;
  end
  else
  begin
    Main.Close;
    SaveData;
    FEntrance.Close;
  end;
end;

procedure TMain.FormCreate(Sender: TObject);
begin
  changeUser := false;
end;

end.
