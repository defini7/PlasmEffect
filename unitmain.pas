unit UnitMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

const
  PixelWidth = 13;
  PixelHeight = 25;

type

  { TFormMain }

  TFormMain = class(TForm)
    procedure FormPaint(Sender: TObject);
  end;

var
  FormMain: TFormMain;

implementation

uses
  Math;

{$R *.lfm}

{ TFormMain }

procedure TFormMain.FormPaint(Sender: TObject);
var
  AreaWidth: Integer;
  AreaHeight: Integer;
  X: Integer;
  Y: Integer;
  TransformedX: Integer;
  TransformedY: Integer;
  Val: Integer;
begin
  Canvas.Pen.Style := psClear;
  Canvas.Brush.Style := bsSolid;

  AreaWidth := Trunc(ClientWidth / PixelWidth);
  AreaHeight := Trunc(ClientHeight / PixelHeight);

  for X:=0 to AreaWidth do
  begin
    for Y:=0 to AreaHeight do
    begin
      Val := Trunc((0.5 * Sin(1.24 * Sin(X * 0.3 + y * 0.1) + Sin(X * 0.02 + Y * 0.37)
      	  	 + 3 * Sin(X * 0.15 + Y * 0.08) + 1.8 * Sin(X * 0.139 + Y * 0.265))
             + 0.5) * 255.0);

      Canvas.Brush.Color := RGBToColor(Byte(255 - Val), Byte(Val), Byte(255 - Val));

      TransformedX := X * PixelWidth;
      TransformedY := Y * PixelHeight;

      Canvas.Rectangle(
       TransformedX, TransformedY,
       TransformedX + PixelWidth + 1, TransformedY + PixelHeight + 1
      );
  	end;
  end;

end;

end.

