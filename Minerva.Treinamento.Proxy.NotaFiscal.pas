unit Minerva.Treinamento.Proxy.NotaFiscal;

interface

uses
  Minerva.Treinamento.Proxy.Base,
  Minerva.Treinamento.Proxy.ExecutorMetodoServidor;

type
  [TRota('minerva/nota_fiscal')]
  TProxyNotaFiscal = class(TProxyBase)
    procedure AprovarNotaFiscal(pEmpresa, pNumNota: integer; pUF: string);
  end;

implementation

{ TProxyNotaFiscal }
{
procedure TProxyNotaFiscal.AprovarNotaFiscal(pEmpresa, pNumNota: integer;
  pUF: string);
var
  lExecutorMetodoServidor: IExecutorMetodoServidor;
begin
  lExecutorMetodoServidor:= TExecutorMetodoServidor.Create;
  try
    lExecutorMetodoServidor.Rota   := Rota;
    lExecutorMetodoServidor.Metodo := 'AprovarNotaFiscal';
    lExecutorMetodoServidor.Parametro['Empresa'] := pEmpresa;
    lExecutorMetodoServidor.Parametro['NumNota'] := pNumNota;
    lExecutorMetodoServidor.Parametro['UF'] := pUF;
    lExecutorMetodoServidor.Executar;
  finally
    //lExecutorMetodoServidor.Free;
  end;
end;
}
{ TProxyNotaFiscal }

procedure TProxyNotaFiscal.AprovarNotaFiscal(pEmpresa, pNumNota: integer;
  pUF: string);
begin
 Executor
  .AddParametro('Empresa',pEmpresa)
  .AddParametro('NumNota',pEmpresa)
  .AddParametro('Empresa',pEmpresa)
  .Executar('AprovarNotaFiscal');
end;

end.
