unit Minerva.Treinamento.ImpressaoEtiqueta;

interface

uses
  Minerva.Treinamento.Etiqueta, System.SysUtils,  System.Classes,
  System.Generics.Collections;

type
  TImprimirRegEvent = procedure(const pTexto: TStringList; const pEtiqueta: TEtiqueta) of object;

  TProcImprimirReg   = reference to procedure(const pTexto: TStringList; const pEtiqueta: TEtiqueta);
  TProcImprimirFinal = reference to procedure(const pTexto: TStringList);

  TImpressaoDeEtiquetas = class
  private
    FListaEtiqueta: TObjectList<TEtiqueta>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(pEtiqueta: TEtiqueta);
    function Imprimir: string; overload;
    function Imprimir(pImprimirRegEvent: TImprimirRegEvent): string; overload;
    function Imprimir(pProcImprimirReg: TProcImprimirReg; pProcImprimirFinal: TProcImprimirFinal = nil): string; overload;
  end;


implementation

{ TImpressaoDeEtiquetas }

procedure TImpressaoDeEtiquetas.Add(pEtiqueta: TEtiqueta);
begin
  FListaEtiqueta.Add(pEtiqueta);
end;

constructor TImpressaoDeEtiquetas.Create;
begin
  FListaEtiqueta := TObjectList<TEtiqueta>.Create;
end;

destructor TImpressaoDeEtiquetas.Destroy;
begin
  FListaEtiqueta.Free;
  inherited;
end;

function TImpressaoDeEtiquetas.Imprimir(
  pProcImprimirReg: TProcImprimirReg; pProcImprimirFinal: TProcImprimirFinal): string;
var
  lTexto: TStringList;
  lEtiqueta: TEtiqueta;
begin
  lTexto := TStringList.Create;
  try
    for lEtiqueta in FListaEtiqueta do
    begin
      if Assigned(pProcImprimirReg)  then
        pProcImprimirReg(lTexto,lEtiqueta);
    end;
    if Assigned(pProcImprimirFinal)  then
      pProcImprimirFinal(lTexto);

    Result := lTexto.Text;
  finally
    lTexto.Free;
  end;
end;


function TImpressaoDeEtiquetas.Imprimir(
  pImprimirRegEvent: TImprimirRegEvent): string;
var
  lTexto: TStringList;
  lEtiqueta: TEtiqueta;
begin
  lTexto := TStringList.Create;
  try
    for lEtiqueta in FListaEtiqueta do
    begin
      if Assigned(pImprimirRegEvent)  then
        pImprimirRegEvent(lTexto,lEtiqueta);
    end;

    Result := lTexto.Text;
  finally
    lTexto.Free;
  end;
end;

function TImpressaoDeEtiquetas.Imprimir: string;
var
  lTexto: TStringList;
  lEtiqueta: TEtiqueta;
begin
  lTexto := TStringList.Create;
  try
    for lEtiqueta in FListaEtiqueta do
    begin
      lTexto.Add('Codigo: '+lEtiqueta.Codigo.ToString);
      lTexto.Add('Item: '+lEtiqueta.DescItem);
      lTexto.Add('Peso: '+FormatFloat('0.,00',lEtiqueta.Peso)+'KG');
      lTexto.Add('');
    end;

    Result := lTexto.Text;
  finally
    lTexto.Free;
  end;
end;

end.
