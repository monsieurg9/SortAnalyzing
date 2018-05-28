unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls;

type
  TMain = class(TForm)
    btnGraphics: TButton;
    btnChangeUser: TButton;
    btnExit: TButton;
    btnInfo: TButton;
    procedure btnGraphicsClick(Sender: TObject);
    procedure btnChangeUserClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure SaveData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses TablesAndGraphics, Entrance, UserRegistratin;

{$R *.dfm}

procedure TMain.btnGraphicsClick(Sender: TObject);
begin
  FGraphics.ShowModal;
end;

procedure TMain.btnChangeUserClick(Sender: TObject);
begin
  main.Close;
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

end.
