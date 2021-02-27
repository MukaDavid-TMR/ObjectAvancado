unit Minerva.Treinamento.Proxy.Base;

interface
uses
  System.Rtti,
  Minerva.Treinamento.Proxy.ExecutorMetodoServidor;

type
  TRotaAttribute = class(TCustomAttribute)
  private
    FRota: string;
  public
    constructor create(pRota: string);
    property Rota: string read FRota write FRota;
  end;

  TProxyBase = class
  private
    FRota: string;
  public
    constructor Create;
    property Rota: string read FRota;
    function Executor: IExecutorMetodoServidor;
  end;


implementation

{ TProxyBase }


{ TProxyBase }

constructor TProxyBase.Create;
var
  lRttiContext: TRttiContext;
  lRttiType: TRttiType;
  lAttribute: TCustomAttribute;
begin
  lRttiType := lRttiContext.GetType(Self.ClassType);

  for lAttribute in lRttiType.GetAttributes do
  begin
    if lAttribute is TRotaAttribute then
      FRota := TRotaAttribute(lAttribute).Rota;
  end;
end;

function TProxyBase.Executor: IExecutorMetodoServidor;
begin
  Result := TExecutorMetodoServidor.Create;
  Result.Rota := Rota;
end;

{ TRotaAttribute }

constructor TRotaAttribute.create(pRota: string);
begin
  FRota := pRota;
end;

end.
