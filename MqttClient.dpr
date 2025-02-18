program MqttClient;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  MqttClient.js.scripts in 'js\MqttClient.js.scripts.pas',
  MqttClient.consts.eventos in 'consts\MqttClient.consts.eventos.pas',
  MqttClient.enums.qos in 'enums\MqttClient.enums.qos.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
end.
