unit AdmonForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

const
  NSize = 12;
  MaxMassSize = 70000;
  MaxRandomValue = 5000;

type
  TFile = file of cardinal;
  TMas  = array [1..MaxMassSize] of cardinal;
  ResultMas = array [1..3, 1..NSize] of cardinal;

  TAdminForm = class(TForm)
    lvUsers: TListView;
    pnlEditListButtons: TPanel;
    btnAddUser: TButton;
    lblUsers: TLabel;
    btnEditUser: TButton;
    btnDeleteUser: TButton;
    btnBack: TButton;
    btnRewriteData: TButton;
    procedure FillListView;
    procedure btnAddUserClick(Sender: TObject);
    procedure btnDeleteUserClick(Sender: TObject);
    procedure btnEditUserClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnRewriteDataClick(Sender: TObject);
    procedure writeFile(Var FFile: text; const ResultiveMas : ResultMas);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdminForm: TAdminForm;
  // Массив файлов : случайный, отсортированный, перевернутый
  Files : array [1..3] of file of cardinal;
  FHeapTime,FBubbleTime,FHeapTransp,FBubbleTransp,FCompHeap,FCompBubble : text;
  // Теоретические данные вычислений
  ThHeapSorted, ThHeapRandom, ThHeapInverted,  ThBubbleRandom : Text;
  // Массив для вычислений
  Mas : TMas;
  // Массив размерностей массивов
  size : array [1..NSize] of cardinal = (100, 250, 500, 1000, 2000, 3000, 5000, 10000, 20000, 50000, 60000, 70000);
  n, // Размерность массива
  i, // Переменная-счетчик
  k, // Переменная-счетчик в массиве размерностей
  w, // Номер файла
  L, R // Границы просеивания
   : cardinal;
  // Количество перестановок
  comp : cardinal;
  //
  ResultTimeBubble : ResultMas;
  ResultTimeHeap   : ResultMas;

  ResultTranspBubble : ResultMas;
  ResultTranspHeap   : ResultMas;

  ResultCompBubble : ResultMas;
  ResultCompHeap   : ResultMas;

  Transp : cardinal;

  // Вспомогательный массив для вывода
  MassType : array [0..2] of string = ('    Random     ',
    '    Sorted     ', '    Inverted   ');

implementation

uses UserRegistratin, Entrance, Menu, DialogForm;

{$R *.dfm}

{ TAdminForm }

// Процедура обмена двух переменных
procedure Swap ( Var  a, b: cardinal);
Var
  temp : cardinal;
begin
  Temp := a;
  a := b;
  b := Temp;
end;

// Процедура, сортирующая массив "пузырьком"
procedure bubbleSort(var Mas : TMas; var comp : cardinal; var Transp : cardinal);
var
  // Переменные-счетчики для прохода по массиву
  i, j : cardinal;
  // Флаг, указывающий наличие перестановок на предыдущей итерации
  Fl : boolean;
begin
  // Стартовая инициализация
  i := 2;
  Fl := True;
  while (i <= N) and fl do
  begin
    // Инициализация внутреннего цикла
    Fl := False;
    j := N;
    // Проход по неотсортированной части
    while j >= i do
    begin
      if Mas[j-1] > Mas[j] then
      begin
        swap(Mas[j-1],Mas[j]);
        fl := true;
        transp := transp + 1;
      end;
      dec(j);
      inc(comp);
    end;
    inc(i);
  end;
end;

// Процедура, сортирующая массив с помощью "пирамиды"
procedure HeapSort(Mas : TMas; var comp : cardinal; var transp : cardinal);
var
  // Переменные-счетчики
  i, j : cardinal;
// Процедура просеивания
procedure Sift(L, R : cardinal; var comp : cardinal; var transp : cardinal);
var
  x : cardinal;    // Хранение буферного элемента
begin
  // Инициализация индексов
  i := L;
  j := 2 * L;
  x := Mas[L];
  if (j < R) then
  begin
    // Сравнение потомков
    if (Mas[j] < Mas[j+1]) then
    begin
      Inc(j);
    end;
    inc(comp);
  end;

  // Сравнение потомка с предком
  while (j <= R) and (x < Mas[j]) do
  begin
    Mas[i] := Mas[j];
    Mas[j] := x;
    i := j;
    j := 2 * j;
    x := Mas[i];
    transp := transp + 1;
    inc(comp);
    if (j < R) then
    begin
      // Сравнение потомков
      if (Mas[j] < Mas[j+1]) then
      begin
        Inc(j);
      end;
      inc(comp);
    end;
  end;
end;

begin

  // Постройка пирамиды
  L := (N div 2) + 1;
  R := N;
  while  L > 1 do
  begin
    Dec(L);
    Sift(L,R,comp,transp);
  end;

  // Сортировка массива
  while R > 1 do
  begin
    transp := transp + 1;
    swap(Mas[1],Mas[R]);
    Dec(R);
    Sift(L,R,comp, transp);
  end;

end;

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
    item.SubItems.Add(intToStr(poinUser^.Age));
    item.SubItems.Add(poinUser^.WorkPlace);
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
  end
  else
  begin
    ShowMessage('Пожалуйста, выберите пользователя');
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

    with registration do
    begin
      lbledtUsername.Text := poinUser.UserName;
      lbledtPassword.Text := poinUser.Password;
      lbledtConfirmPassword.Text := poinUSer.ConfirmPassword;
      lbledtName.Text := poinUser.Name;
      lbledtSurname.Text := poinUser.SurName;
      lbledtAge.Text := intToStr(poinUser.Age);
      lbledtWorkplace.Text := poinUser.Workplace;
      btnEditUser.Visible := true;
      btnConfirm.Visible := False;
      ShowModal;
    end;

    FillListView;
    poinUser := poinHead;
  end
  else
  begin
    ShowMessage('Пожалуйста, выберите пользователя');
  end;
  Registration.clearedits;
end;
procedure TAdminForm.btnBackClick(Sender: TObject);
begin
  AdminForm.Close;
end;

procedure TAdminForm.btnRewriteDataClick(Sender: TObject);
var
  i : cardinal;
begin
  Dialog.ShowModal;
  if Dialog.Flag then
  begin
    ShowMessage('Нажмите ОК и ожидайте');
    // Связывание файловых переменных с файлами
    assignFile(Files[1], 'FRandomMass.dat');
    assignFile(Files[2], 'FSortedMass.dat');
    assignFile(Files[3], 'FInvertedMass.dat');
    assignfile(FHeapTime, 'FHeapTime.dat');
    assignfile(FBubbleTime, 'FBubbleTime.dat');
    assignfile(FHeapTransp, 'FHeapTransp.dat');
    assignfile(FBubbleTransp, 'FBubbleTransp.dat');
    assignfile(FCompHeap, 'FCompHeap.dat');
    assignfile(FCompBubble, 'FCompBubble.dat');

    // Иициализация
    w := 1;
   // iRow := 1;

    // Расчет данных для сортировки пирамидой
    while w <= 3 do
    begin
      k := 1;
      while k <= NSize do
      begin
        n := size[k];
        reset(Files[w]);
        for i := 1 to n do
        begin
          read(Files[w], Mas[i]);
        end;
        closefile(Files[w]);

        comp := 0;
        transp := 0;
        ResultTimeHeap[w,k] := gettickCount;

        heapsort(Mas, comp, transp);

        ResultTimeHeap[w,k] := cardinal(gettickCount) - ResultTimeHeap[w,k];
        ResultTranspHeap[w,k] := transp;
        ResultCompHeap[w,k] := comp;

      //  Results[iRow, jColumn] := comp;
        inc(k);
      end;
      inc(w);
    end;

    //TableTop;

    w := 1;
    // Расчет данных для сортировки пузырьком
    while w <= 3 do
    begin
      k := 1;
      while k <= NSize do
      begin
        n := size[k];
        reset(Files[w]);
        for i := 1 to n do
        begin
          read(Files[w], Mas[i]);
        end;
        closefile(Files[w]);

        comp := 0;
        transp := 0;
        ResultTimeBubble[w,k] := gettickcount;

        bubbleSort(Mas, comp, transp);

        ResultTimeBubble[w,k] := cardinal(gettickcount) - ResultTimeBubble[w,k];
        ResultTranspBubble[w,k] := transp;
        ResultCompBubble[w,k] := Comp;

        inc(k);
      end;
      inc(w);
    end;
    writeFile(FHeapTime, ResultTimeHeap);
    writeFile(FBubbleTime, ResultTimeBubble);
    writeFile(FHeapTransp, ResultTranspHeap);
    writeFile(FBubbleTransp, ResultTranspBubble);
    writeFile(FCompHeap, ResultCompHeap);
    writeFile(FCompBubble, ResultCompBubble);
    ShowMessage('Перезапись данных закончена');
  end;

end;

procedure TAdminForm.writeFile(var FFile: text;
  const ResultiveMas: ResultMas);
Var
  i, j : cardinal;
Begin
  rewrite(FFile);
  for i := 1 to 3 do
  begin
    for j := 1 to NSize do
    begin
      write(FFile,ResultiveMas[i,j], ' ');
    end;
    Writeln(FFile);
  end;
  closeFile(FFile);
end;

end.
