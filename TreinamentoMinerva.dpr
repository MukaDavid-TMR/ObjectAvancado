program TreinamentoMinerva;

uses
  Vcl.Forms,
  Minerva.Treinamento.Principal in 'Minerva.Treinamento.Principal.pas' {frmPrincipal},
  Minerva.Treinamento.Etiqueta in 'Minerva.Treinamento.Etiqueta.pas',
  Minerva.Treinamento.Proxy.Base in 'Minerva.Treinamento.Proxy.Base.pas',
  Minerva.Treinamento.Proxy.NotaFiscal in 'Minerva.Treinamento.Proxy.NotaFiscal.pas',
  Minerva.Treinamento.ImpressaoEtiqueta in 'Minerva.Treinamento.ImpressaoEtiqueta.pas',
  Minerva.Treinamento.Generic in 'Minerva.Treinamento.Generic.pas',
  Minerva.Treinamento.Proxy.ExecutorMetodoServidor in 'Minerva.Treinamento.Proxy.ExecutorMetodoServidor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
