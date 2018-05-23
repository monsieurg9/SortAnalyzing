unit Stuff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, TeeFunci, StdCtrls,
  jpeg, ComCtrls;

const
  NSize = 12;
  MaxMassSize = 70000;
  MaxRandomValue = 5000;
  FileNames : array [1..3,1..2] of string = (('FBubbleTime.txt','FHeapTime.txt'),
                                             ('FCompBubble.txt','FCompHeap.txt'),
                                             ('FBubbleTransp.txt','FHeapTransp.txt'));
type
  ResultMas = array [1..3, 1..NSize] of cardinal;
  TFile = file of cardinal;
  TMas  = array [1..MaxMassSize] of cardinal;
  TCriteria = (Random=1, Sorted, Inverted);

  TMain = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Main: TMain;
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

{$R *.dfm}

procedure TMain.SetScale;
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

procedure TMain.rbSortedClick(Sender: TObject);
begin
  Criteria := Sorted;
end;

procedure TMain.rbInvertedClick(Sender: TObject);
begin
  Criteria := Inverted;
end;

procedure TMain.rbRandomClick(Sender: TObject);
begin
  Criteria := Random;
end;

function TMain.GetMax(Const FFile: text): cardinal;
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

function TMain.GetMaxRow(const FFile: text; Row: TCriteria): cardinal;
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
  case Row of
    Random:   Result := a[1, NSize];
    Sorted:   Result := a[2, NSize];
    Inverted: Result := a[3, NSize];
  end;
end;

procedure TMain.rbTimeClick(Sender: TObject);
begin
  CurrentFile[1] := FileNames[1,1];
  CurrentFile[2] := FileNames[1,2];
end;

procedure TMain.rbCompClick(Sender: TObject);
begin
  CurrentFile[1] := FileNames[2,1];
  CurrentFile[2] := FileNames[2,2];
end;

procedure TMain.rbTranspClick(Sender: TObject);
begin
  CurrentFile[1] := FileNames[3,1];
  CurrentFile[2] := FileNames[3,2];
end;

procedure TMain.btnDrawGraphicClick(Sender: TObject);
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

end.
