unit TablesAndGraphics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, TeeFunci, StdCtrls,
  jpeg, ComCtrls, Grids, Buttons;

const
  NSize = 12;
  MaxMassSize = 70000;
  MaxRandomValue = 5000;
  FileNames : array [1..3,1..2] of string = (('FBubbleTime.txt','FHeapTime.txt'),
                                             ('FCompBubble.txt','FCompHeap.txt'),
                                             ('FBubbleTransp.txt','FHeapTransp.txt'));
  GridHead : array [0..3] of string = ('Размерность','Случайный','Отсортированный','Перевернутый');
type
  ResultMas = array [1..3, 1..NSize] of cardinal;
  TFile = file of cardinal;
  TMas  = array [1..MaxMassSize] of cardinal;
  TCriteria = (Random=1, Sorted, Inverted);

  TFGraphics = class(TForm)
    chtGraphicBoxBubble: TChart;
    lnsrsSeries1: TLineSeries;
    TeeFunction1: TMultiplyTeeFunction;
    grpMassType: TGroupBox;
    rbRandom: TRadioButton;
    rbSorted: TRadioButton;
    rbInverted: TRadioButton;
    chtGraphicBoxHeap: TChart;
    lnsrsSeries2: TLineSeries;
    grpSortType: TGroupBox;
    rbComp: TRadioButton;
    rbTime: TRadioButton;
    rbTransp: TRadioButton;
    btnDrawGraphic: TButton;
    btnTable: TButton;
    strngrdHeap: TStringGrid;
    strngrdBubble: TStringGrid;
    btnFillTable: TBitBtn;
    txtHeap: TStaticText;
    txtBubble: TStaticText;
    btnBack: TBitBtn;
    procedure rbInvertedClick(Sender: TObject);
    procedure rbRandomClick(Sender: TObject);
    procedure SetScale;
    function  GetMax(Const FFile : text) : cardinal;
    function  GetMaxRow(Const FFile : text; Row : TCriteria) : cardinal;
    procedure rbTimeClick(Sender: TObject);
    procedure rbCompClick(Sender: TObject);
    procedure rbTranspClick(Sender: TObject);
    procedure btnDrawGraphicClick(Sender: TObject);
    procedure rbSortedClick(Sender: TObject);
    procedure btnTableClick(Sender: TObject);
    procedure btnFillTableClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure Initialize;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FGraphics: TFGraphics;
  FHeapTime,FBubbleTime,FHeapTransp,FBubbleTransp,FCompHeap,FCompBubble : text;
  size : array [1..NSize] of integer = (100, 250, 500, 1000, 2000, 3000, 5000, 10000, 20000, 50000, 60000, 70000);
  FBubble, FHeap : text;

  MinValue : cardinal = 0;
  MaxValue : cardinal = 100;
  CurrentFile : array [1..2] of String;
  Criteria : TCriteria;
  {
  ResultTimeBubble : ResultMas;
  ResultTimeHeap   : ResultMas;

  ResultTranspBubble : ResultMas;
  ResultTranspHeap   : ResultMas;

  ResultCompBubble : ResultMas;
  ResultCompHeap   : ResultMas;
  }
implementation

uses Unit1;

{$R *.dfm}

procedure TFGraphics.SetScale;
begin
  with chtGraphicBoxBubble do
  begin
    with BottomAxis do
    begin
      Automatic := false;
      SetMinMax(0,MaxMassSize);
    end;

    with LeftAxis do
    begin
      Automatic := false;
      SetMinMax(0,MaxValue);
    end;
  end;
  with chtGraphicBoxHeap do
  begin
    with BottomAxis do
    begin
      Automatic := false;
      SetMinMax(0,MaxMassSize);
    end;

    with LeftAxis do
    begin
      Automatic := false;
      SetMinMax(0,MaxValue);
    end;
  end;
end;

procedure TFGraphics.rbSortedClick(Sender: TObject);
begin
  Criteria := Sorted;
end;

procedure TFGraphics.rbInvertedClick(Sender: TObject);
begin
  Criteria := Inverted;
end;

procedure TFGraphics.rbRandomClick(Sender: TObject);
begin
  Criteria := Random;
end;

function TFGraphics.GetMax(Const FFile: text): cardinal;
var
  a : ResultMas;
  i, j : cardinal;
begin
  reset(FFile);
  for i := 1 to 3 do
  begin
    for j := 1 to NSize do
    begin
      read(FFile, a[i,j])
    end;
  end;
  if a[1, NSize] > a[2, NSize] then
  begin
    if a[1, NSize] > a[3, NSize] then
      Result := a[1, NSize]
    else
      Result := a[3, NSize];
  end
  else
  begin
    if a[2, NSize] > a[3, NSize] then
      Result := a[2, NSize]
    else
      Result := a[3, NSize];
  end;
end;

function TFGraphics.GetMaxRow(const FFile: text; Row: TCriteria): cardinal;
var
  a : ResultMas;
  i, j : cardinal;
begin
  reset(FFile);
  for i := 1 to 3 do
  begin
    for j := 1 to NSize do
    begin
      read(FFile, a[i,j])
    end;
  end;
  Result := a[1, NSize];
  case Row of
    Random:   Result := a[1, NSize];
    Sorted:   Result := a[2, NSize];
    Inverted: Result := a[3, NSize];
  end;
end;

procedure TFGraphics.rbTimeClick(Sender: TObject);
begin
  CurrentFile[1] := FileNames[1,1];
  CurrentFile[2] := FileNames[1,2];
end;

procedure TFGraphics.rbCompClick(Sender: TObject);
begin
  CurrentFile[1] := FileNames[2,1];
  CurrentFile[2] := FileNames[2,2];
end;

procedure TFGraphics.rbTranspClick(Sender: TObject);
begin
  CurrentFile[1] := FileNames[3,1];
  CurrentFile[2] := FileNames[3,2];
end;

procedure TFGraphics.btnDrawGraphicClick(Sender: TObject);
var
  i, x, y : cardinal;
begin
  lnsrsSeries1.Clear;
  lnsrsSeries2.Clear;
  assignfile(FBubble, CurrentFile[1]);
  assignfile(FHeap,   CurrentFile[2]);

  if GetMaxRow(FBubble, Criteria) > GetMaxRow(FHeap, Criteria) then
  begin
    MaxValue := GetMaxRow(FBubble, Criteria);
  end
  else
  begin
    MaxValue := GetMaxRow(FHeap, Criteria)
  end;
  setscale;

  reset(FBubble);
  reset(FHeap);
  case Criteria of
    Random:
    begin

    end;

    Sorted:
    begin
      Readln(FBubble);
      Readln(FHeap);
    end;

    Inverted:
    begin
      Readln(FBubble);
      Readln(FHeap);
      Readln(FBubble);
      Readln(FHeap);
    end;
  end;

  with lnsrsSeries1 do
  begin
    for i := 1 to NSize do
    begin
      x := Size[i];
      Read(FBubble, y);
      lnsrsSeries1.AddXY(x,y);
    end;
  end;
  closefile(FBubble);

  with lnsrsSeries2 do
  begin
    for i := 1 to NSize do
    begin
      x := Size[i];
      Read(FHeap, y);
      lnsrsSeries2.AddXY(x,y);
    end;
  end;
  closefile(FHeap);
end;

procedure TFGraphics.btnFillTableClick(Sender: TObject);
var
  i, j: cardinal;
  buf : cardinal;
begin
  assignfile(FBubble, CurrentFile[1]);
  assignfile(FHeap,   CurrentFile[2]);

  reset(FBubble);
  reset(FHeap);
  for i := 1 to 3 do
  begin
    for j := 1 to NSize do
    begin
      read(FHeap, buf);
      strngrdHeap.Cells [i,j] := IntToStr(buf);
      read(FBubble, buf);
      strngrdBubble.Cells [i,j] := IntToStr(buf);
    end;
  end;
end;
procedure TFGraphics.btnBackClick(Sender: TObject);
begin
  FGraphics.close;
end;

procedure TFGraphics.Initialize;
var
  i : cardinal;
begin
  rbTimeClick(rbTime);
  rbRandomClick(rbRandom);

  for i := 0 to 3 do
  begin
    strngrdHeap.Cells[i,0] := GridHead[i];
    strngrdBubble.Cells[i,0] := GridHead[i];
  end;

  for i := 1 to NSize do
  begin
    strngrdHeap.Cells[0,i] := IntToStr(Size[i]);
    strngrdBubble.Cells[0,i] := IntToStr(Size[i]);
  end;
end;

procedure TFGraphics.btnTableClick(Sender: TObject);
begin
  if btnDrawGraphic.Visible then
    btnDrawGraphic.Visible := False
  else
    btnDrawGraphic.Visible := True;

  if ChtGraphicBoxBubble.Visible then
    ChtGraphicBoxBubble.Visible := False
  else
    ChtGraphicBoxBubble.Visible := True;

  if ChtGraphicBoxHeap.Visible then
    ChtGraphicBoxHeap.Visible := False
  else
    ChtGraphicBoxHeap.Visible := True;

  if grpMassType.Visible then
    grpMassType.Visible := False
  else
    grpMassType.Visible := True;

  if strngrdHeap.Visible then
    strngrdHeap.Visible := False
  else
    strngrdHeap.Visible := True;

  if strngrdBubble.Visible then
    strngrdBubble.Visible := False
  else
    strngrdBubble.Visible := True;

  if txtBubble.Visible then
    txtBubble.Visible := False
  else
    txtBubble.Visible := True;

  if txtHeap.Visible then
    txtHeap.Visible := False
  else
    txtHeap.Visible := True;

  if btnFillTable.Visible then
    btnFillTable.Visible := False
  else
    btnFillTable.Visible := True;
end;

end.

