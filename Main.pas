unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton,
  uniMemo, uniLabel, uniEdit, uniGroupBox, uniMultiItem, uniComboBox;

type
  TMainForm = class(TUniForm)
    UniMemo1: TUniMemo;
    gpConsumir: TUniGroupBox;
    edtTopicoInscricao: TUniEdit;
    btnInscrever: TUniButton;
    gpProduzir: TUniGroupBox;
    edTopicoPublicacao: TUniEdit;
    btnEnviar: TUniButton;
    mmMsg: TUniMemo;
    cbQosEnvio: TUniComboBox;
    cbQosConsumo: TUniComboBox;
    cbConexao: TUniGroupBox;
    edBroker: TUniEdit;
    btnConectar: TUniButton;
    edClient: TUniEdit;
    procedure UniFormAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure btnInscreverClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
  private
    procedure CarregaComboQos;
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars,
  MainModule,
  uniGUIApplication,
  System.TypInfo,
  MqttClient.js.scripts,
  MqttClient.consts.eventos,
  MqttClient.enums.qos;


function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.btnConectarClick(Sender: TObject);
begin
  UniSession.AddJS(
    TMqttJsScripts.IniciarConexao(
      edBroker.Text,
      edClient.Text))
end;

procedure TMainForm.btnEnviarClick(Sender: TObject);
begin
  UniSession.AddJS(
    TMqttJsScripts.Publicar(
      edTopicoPublicacao.Text,
      mmMsg.Text,
      TMqttQos(cbQosEnvio.ItemIndex)));
end;

procedure TMainForm.btnInscreverClick(Sender: TObject);
begin
  UniSession.AddJS(
    TMqttJsScripts.Inscrever(
      edtTopicoInscricao.Text,
      TMqttQos(cbQosConsumo.ItemIndex)));
end;

procedure TMainForm.CarregaComboQos;
begin
  cbQosEnvio.Items.Clear;
  cbQosConsumo.Items.Clear;
  for var E := Low(TMqttQos) to High(TMqttQos) do
  begin
    cbQosEnvio.Items.Add(GetEnumName(TypeInfo(TMqttQos), Ord(E)));
    cbQosConsumo.Items.Add(GetEnumName(TypeInfo(TMqttQos), Ord(E)));
  end;
  cbQosEnvio.ItemIndex := 0;
  cbQosConsumo.ItemIndex := 0;
end;

procedure TMainForm.UniFormAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
begin
  if EventName.Equals(MESSAGE_ARRIVED) then
  begin
    UniMemo1.Lines.Add('Mensagem recebida -------------------');
    UniMemo1.Lines.Add('Payload : ' + Params.Values['msg']);
    UniMemo1.Lines.Add('Qos : ' + Params.Values['qos']);
    UniMemo1.Lines.Add('Topic : ' + Params.Values['topic']);
    UniMemo1.Lines.Add('-------------------------------------------');
  end;

  if EventName.Equals(MESSAGE_DELIVERED) then
  begin
    UniMemo1.Lines.Add('Mensagem publicada com sucesso');
    exit;
  end;

  if EventName.Equals(CLIENT_CONNECT_SUCCESS) then
  begin
    UniMemo1.Lines.Add('Conexão com o Broker MQTT bem sucedida');
    exit;
  end;

  if EventName.Equals(CLIENT_CONNECT_FAILURE) then
  begin
    UniMemo1.Lines.Add('Falha na conexão com o Broker MQTT');
    exit;
  end;

  if EventName.Equals(CLIENT_NOT_CONNECTED) then
  begin
    UniMemo1.Lines.Add('Cliente não conectado');
    exit;
  end;

  if EventName.Equals(TOPIC_SUBSCRIBE_SUCESS) then
  begin
    UniMemo1.Lines.Add('Inscrição bem sucedida');
    exit;
  end;

  UniMemo1.Refresh;
end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
  CarregaComboQos;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
