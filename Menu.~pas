unit Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls;

type
  TMain = class(TForm)
    btnGraphics: TButton;
    btnChangeUser: TButton;
    procedure btnGraphicsClick(Sender: TObject);
    procedure btnChangeUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses TablesAndGraphics, Entrance;

{$R *.dfm}

procedure TMain.btnGraphicsClick(Sender: TObject);
begin
  FGraphics.ShowModal;
end;

procedure TMain.btnChangeUserClick(Sender: TObject);
begin
  main.Close;
end;

end.
