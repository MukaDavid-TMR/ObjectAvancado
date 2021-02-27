unit Minerva.Treinamento.Generic;

interface

type
  TClasseGenerica<T> = class
  private
    FCodigo: integer;
    FDescricao: string;
    FObjeto: T;
  published
    property Codigo: integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property Objeto: T read FObjeto write FObjeto;
  end;

  TUtils = class
    class function IIf<T>(pCondicao: Boolean; T1,T2:T):T;
  end;


implementation

{ TUtils }

class function TUtils.IIf<T>(pCondicao: Boolean; T1, T2: T): T;
begin
  if pCondicao then
    Result := T1
  else
    Result := T2;
end;

end.
