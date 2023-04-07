unit Unit1;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    procedure QuickSort(var A: array of Integer; iLo, iHi: Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.QuickSort(var A: array of Integer; iLo, iHi: Integer);
var
  Lo, Hi, Pivot, T: Integer;
begin
  Lo := iLo;
  Hi := iHi;
  Pivot := A[(Lo + Hi) div 2];
  repeat
    while A[Lo] < Pivot do
      Inc(Lo);
    while A[Hi] > Pivot do
      Dec(Hi);
    if Lo <= Hi then
    begin
      T := A[Lo];
      A[Lo] := A[Hi];
      A[Hi] := T;
      Inc(Lo);
      Dec(Hi);
    end;
  until Lo > Hi;
  if Hi > iLo then
    QuickSort(A, iLo, Hi);
  if Lo < iHi then
    QuickSort(A, Lo, iHi);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  A: array of Integer;
  i: Integer;
begin
  // Populate the array with some random numbers
  Randomize;
  SetLength(A, 10);
  for i := 0 to Length(A) - 1 do
    A[i] := Random(100);

  // Show the array before sorting
  Memo1.Lines.Add('Before: ');
  Memo1.Lines.Add(IntToStr(A[0]));
  for i := 1 to Length(A) - 1 do
    Memo1.Lines.Add(IntToStr(A[i]));

  // Sort the array
  QuickSort(A, 0, Length(A) - 1);

  // Show the array after sorting
  Memo1.Lines.Add('After: ');
  Memo1.Lines.Add(IntToStr(A[0]));
  for i := 1 to Length(A) - 1 do
    Memo1.Lines.Strings[Memo1.Lines.Count - 1] :=
      Memo1.Lines.Strings[Memo1.Lines.Count - 1] + #13#10 + IntToStr(A[i]);
end;

end.

