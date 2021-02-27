unit Minerva.Treinamento.Etiqueta;

interface

type
  TDescricaoAttribute = class(TCustomAttribute)
  private
    FDescricao: string;
  public
    constructor Create(pDescricao: string);
    property Descricao: string read FDescricao write FDescricao;
  end;

  [TDescricao('Tipo para definir formato da etiqueta')]
  TTipoEtiqueta = (teCaixa, tePallet);

  [TDescricao('Classe de etiquetas de Caixas e Pallets')]
  TEtiqueta = class
  private
    FCodigo: integer;
    FDescItem: string;
    FPeso: Double;
    FTipo: TTipoEtiqueta;
  public
    property Codigo: integer read FCodigo write FCodigo;
    property DescItem: string read FDescItem write FDescItem;
    property Peso: Double read FPeso write FPeso;
    property Tipo: TTipoEtiqueta read FTipo write FTipo;
  end;

implementation

{ TEtiqueta }


{ TDescricaoAttribute }

constructor TDescricaoAttribute.Create(pDescricao: string);
begin
  FDescricao := pDescricao;
end;

end.
