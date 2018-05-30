unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls;

type
  TMain = class(TForm)
    btnGraphics: TButton;
    btnRegistration: TButton;
    procedure btnGraphicsClick(Sender: TObject);
    procedure btnRegistrationClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

uses TablesAndGraphics, Unit2;

{$R *.dfm}

procedure TMain.btnGraphicsClick(Sender: TObject);
begin
  FGraphics.ShowModal;
end;

procedure TMain.btnRegistrationClick(Sender: TObject);
begin
  FRegistration.ShowModal;
end;

end.
