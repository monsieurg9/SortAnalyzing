unit SortInformation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TInformation = class(TForm)
    mmoHeapSort: TMemo;
    mmoBubbleSort: TMemo;
    imgBubble: TImage;
    imgHeap: TImage;
    lblHeap: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Information: TInformation;

implementation

{$R *.dfm}

procedure TInformation.FormCreate(Sender: TObject);
begin
  mmoBubbleSort.Lines.LoadFromFile('C:\”нивер\ќјиѕ\SortAnalyzing\InfoBubble.txt');
  mmoHeapSort.Lines.LoadFromFile('C:\”нивер\ќјиѕ\SortAnalyzing\InfoHeap.txt');
end;

end.
