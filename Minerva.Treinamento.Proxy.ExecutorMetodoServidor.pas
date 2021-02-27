unit Minerva.Treinamento.Proxy.ExecutorMetodoServidor;

interface
uses
  System.Generics.Collections, System.Rtti, System.Classes, vcl.Dialogs;

type
  IExecutorMetodoServidor = interface
  ['{09B34189-ECE6-45A1-8302-EAC62794C13B}']
    function GetParametro(const pNome: string): TValue;
    procedure SetParametro(const pNome: string; const Value: TValue);
    function GetMetodo: string;
    function GetRota: string;
    procedure SetMetodo(const Value: string);
    procedure SetRota(const Value: string);
    property Rota: string read GetRota write SetRota;
    property Metodo: string read GetMetodo write SetMetodo;
    property Parametro[const pNome: string]: TValue read GetParametro write SetParametro;
    function Executar: string; overload;
    function Executar(pMetodo: string): string; overload;
    function AddParametro(pNome: string; pValor: TValue): IExecutorMetodoServidor;
  end;


  TExecutorMetodoServidor = class(TInterfacedObject, IExecutorMetodoServidor)
  private
    FRota: string;
    FMetodo: string;
    FParametros: TDictionary<string,TValue>;
    function GetParametro(const pNome: string): TValue;
    procedure SetParametro(const pNome: string; const Value: TValue);
    function GetMetodo: string;
    function GetRota: string;
    procedure SetMetodo(const Value: string);
    procedure SetRota(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property Rota: string read GetRota write SetRota;
    property Metodo: string read GetMetodo write SetMetodo;
    property Parametro[const pNome: string]: TValue read GetParametro write SetParametro;
    function AddParametro(pNome: string; pValor: TValue): IExecutorMetodoServidor;
    function Executar: string; overload;
    function Executar(pMetodo: string): string; overload;
  end;

implementation

{ TExecutorMetodoServidor }

function TExecutorMetodoServidor.AddParametro(pNome: string;
  pValor: TValue): IExecutorMetodoServidor;
begin
  Parametro[pNome]:= pValor;
  Result := Self;
end;

constructor TExecutorMetodoServidor.Create;
begin
  FParametros := TDictionary<string,TValue>.Create;
end;

destructor TExecutorMetodoServidor.Destroy;
begin
  FParametros.Free;
  inherited;
end;

function TExecutorMetodoServidor.Executar(pMetodo: string): string;
begin
  FMetodo := pMetodo;
  Executar;
end;

function TExecutorMetodoServidor.Executar: string;
var
  lTexto: TStringList;
begin
  lTexto := TStringList.Create;
  try
    lTexto.Add('Metodo: '+FMetodo);
    lTexto.Add('Rota: '+FRota);
    lTexto.Add('Parametros: ');
    for var lParametro in FParametros do
    begin
      lTexto.Add('  '+lParametro.Key +': '+ lParametro.Value.ToString);
    end;
    ShowMessage(lTexto.Text);
  finally
    lTexto.Free;
  end;
end;

function TExecutorMetodoServidor.GetMetodo: string;
begin
  Result := FMetodo;
end;

function TExecutorMetodoServidor.GetParametro(const pNome: string): TValue;
begin
  Result := '';
  if FParametros.ContainsKey(pNome) then
    Result := FParametros.Items[pNome];

end;

function TExecutorMetodoServidor.GetRota: string;
begin
  Result := FRota;
end;

procedure TExecutorMetodoServidor.SetMetodo(const Value: string);
begin
  FMetodo := Value;
end;

procedure TExecutorMetodoServidor.SetParametro(const pNome: string;
  const Value: TValue);
begin
  FParametros.AddOrSetValue(pNome,Value);
end;

procedure TExecutorMetodoServidor.SetRota(const Value: string);
begin
  FRota := Value;
end;

end.
