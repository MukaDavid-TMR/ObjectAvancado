unit Minerva.Treinamento.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Rtti,
  Minerva.Treinamento.Etiqueta,
  Minerva.Treinamento.Proxy.NotaFiscal,
  Minerva.Treinamento.ImpressaoEtiqueta, Minerva.Treinamento.Generic;

type
  TfrmPrincipal = class(TForm)
    MemLog: TMemo;
    btnListaPropriedades: TButton;
    btnListarAtributos: TButton;
    btnExibirRota: TButton;
    btnImprimirEtiqueta: TButton;
    btnClasseGenerica: TButton;
    btnIfGenerico: TButton;
    cbxGenerico: TCheckBox;
    btnAprovarNota: TButton;
    procedure btnListaPropriedadesClick(Sender: TObject);
    procedure btnListarAtributosClick(Sender: TObject);
    procedure btnExibirRotaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirEtiquetaClick(Sender: TObject);
    procedure btnClasseGenericaClick(Sender: TObject);
    procedure btnIfGenericoClick(Sender: TObject);
    procedure btnAprovarNotaClick(Sender: TObject);
  private
    procedure ExibirRota;
    procedure ImprimirRegEtiqueta(const pTexto: TStringList; const pEtiqueta: TEtiqueta);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnAprovarNotaClick(Sender: TObject);
var
  lProxyNotaFiscal: TProxyNotaFiscal;
begin
  lProxyNotaFiscal:= TProxyNotaFiscal.Create;
  try
    lProxyNotaFiscal.AprovarNotaFiscal(59, 12345, 'SP');
  finally
    lProxyNotaFiscal.Free;
  end;
end;

procedure TfrmPrincipal.btnClasseGenericaClick(Sender: TObject);
var
  lClasseGenerica : TClasseGenerica<string>;
begin
  lClasseGenerica := TClasseGenerica<string>.Create;
  try
    lClasseGenerica.Objeto := 'Teste';
  finally
    lClasseGenerica.Free
  end;
end;

procedure TfrmPrincipal.btnExibirRotaClick(Sender: TObject);
begin
  ExibirRota;
end;

procedure TfrmPrincipal.btnIfGenericoClick(Sender: TObject);
begin
  ShowMessage(
    TUtils.IIf<string>(cbxGenerico.Checked,
              'Componentes está ativo',
              'Componentes está desativado'));

end;

procedure TfrmPrincipal.ExibirRota;
var
  lProxyNotaFiscal: TProxyNotaFiscal;
begin
  lProxyNotaFiscal := TProxyNotaFiscal.Create;
  try
    MemLog.Text := lProxyNotaFiscal.Rota;
  finally
    lProxyNotaFiscal.Free;
  end;
end;

procedure TfrmPrincipal.btnImprimirEtiquetaClick(Sender: TObject);
var
  lImpressaoDeEtiquetas : TImpressaoDeEtiquetas;
  lEtiqueta: TEtiqueta;
  lPesoTotal: Double;
begin
  lImpressaoDeEtiquetas := TImpressaoDeEtiquetas.Create;
  try
    lPesoTotal:= 0;

    lEtiqueta := TEtiqueta.Create;
    lEtiqueta.Codigo := 1;
    lEtiqueta.DescItem := 'Picanha';
    lEtiqueta.Peso := 0.95;
    lPesoTotal := lPesoTotal + lEtiqueta.Peso;
    lEtiqueta.Tipo := teCaixa;
    lImpressaoDeEtiquetas.Add(lEtiqueta);

    lEtiqueta := TEtiqueta.Create;
    lEtiqueta.Codigo := 2;
    lEtiqueta.DescItem := 'Maminha';
    lEtiqueta.Peso := 1.20;
    lPesoTotal := lPesoTotal + lEtiqueta.Peso;
    lEtiqueta.Tipo := teCaixa;
    lImpressaoDeEtiquetas.Add(lEtiqueta);

    lEtiqueta := TEtiqueta.Create;
    lEtiqueta.Codigo := 3;
    lEtiqueta.DescItem := 'Costela';
    lEtiqueta.Peso := 7.75;
    lPesoTotal := lPesoTotal + lEtiqueta.Peso;
    lEtiqueta.Tipo := teCaixa;
    lImpressaoDeEtiquetas.Add(lEtiqueta);

    lEtiqueta := TEtiqueta.Create;
    lEtiqueta.Codigo := 4;
    lEtiqueta.DescItem := 'Contrafilé';
    lEtiqueta.Peso := 5.125;
    lPesoTotal := lPesoTotal + lEtiqueta.Peso;
    lEtiqueta.Tipo := teCaixa;
    lImpressaoDeEtiquetas.Add(lEtiqueta);

    //MemLog.Text := lImpressaoDeEtiquetas.Imprimir;
    //MemLog.Text := lImpressaoDeEtiquetas.Imprimir(ImprimirRegEtiqueta);
    MemLog.Text := lImpressaoDeEtiquetas.Imprimir(
       procedure (const pTexto: TStringList; const pEtiqueta: TEtiqueta)
       begin
         pTexto.Add('Item: '+pEtiqueta.Codigo.ToString + '-' +pEtiqueta.DescItem);
       end,
       procedure (const pTexto: TStringList)
       begin
         pTexto.Add('');
         pTexto.Add('Tota:'+FormatFloat('0.,00',lPesoTotal)+ 'KG');
       end);

  finally
    lImpressaoDeEtiquetas.Free;
  end;

end;

procedure TfrmPrincipal.btnListaPropriedadesClick(Sender: TObject);
var
  lRttiContext: TRttiContext;
  lRttiType: TRttiType;
  lRttiProperty: TRttiProperty;
begin
  lRttiType := lRttiContext.GetType(TEtiqueta);

  MemLog.Clear;
  for lRttiProperty in lRttiType.GetProperties do
  begin
    MemLog.Lines.Add(lRttiProperty.Name+': '+lRttiProperty.PropertyType.Name);
  end;

end;

procedure TfrmPrincipal.btnListarAtributosClick(Sender: TObject);
var
  lRttiContext: TRttiContext;
  lRttiType: TRttiType;
  lAttribute: TCustomAttribute;
begin
  lRttiType := lRttiContext.GetType(TEtiqueta);

  MemLog.Clear;
  for lAttribute in lRttiType.GetAttributes do
  begin
    if lAttribute is TDescricaoAttribute then
      MemLog.Lines.Add(TDescricaoAttribute(lAttribute).Descricao);
  end;

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TfrmPrincipal.ImprimirRegEtiqueta(const pTexto: TStringList; const pEtiqueta: TEtiqueta);
begin
  pTexto.Add('Item: '+pEtiqueta.Codigo.ToString + '-' +pEtiqueta.DescItem);
end;

end.
