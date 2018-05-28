unit DialogForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TDialog = class(TForm)
    btnYes: TButton;
    btnNo: TButton;
    lblMessage: TLabel;
    lblMessage2: TLabel;
    procedure btnYesClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
  private
    { Private declarations }
  public
    Flag : Boolean;
    { Public declarations }
  end;

var
  Dialog: TDialog;


implementation

{$R *.dfm}

procedure FormCreate(Sender: TObject);
begin
  Dialog.Flag := False;
end;

procedure TDialog.btnYesClick(Sender: TObject);
begin
  Dialog.Flag := True;
  dialog.Close;
end;

procedure TDialog.btnNoClick(Sender: TObject);
begin
  Dialog.Flag := False;
  dialog.Close;
end;

end.
