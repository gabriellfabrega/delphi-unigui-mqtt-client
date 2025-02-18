unit MqttClient.js.scripts;

interface

uses
  System.SysUtils,
  MqttClient.consts.eventos,
  MqttClient.enums.qos;

type
  TMqttJsScripts = class
  public
    class function IniciarConexao(AUrl, AClientId: string): string; static;
    class function Inscrever(ATopico: string; AQos: TMqttQos): string; static;
    class function Publicar(ATopico, APayload: string; AQos: TMqttQos): string; static;
  end;

implementation

{ TJsIniciarConexao }

class function TMqttJsScripts.IniciarConexao(AUrl, AClientId: string): string;
begin
  result :=
    'window.client = new Paho.Client("'+ AUrl +'", "' + AClientId +'");' +

    'window.client.onMessageArrived = function (message) {' +
    '  ajaxRequest(MainForm.form, "'+ MESSAGE_ARRIVED + '", { msg: message.payloadString, qos: message.qos, topic: message.topic });' +
    '};' +
    'window.client.onMessageDelivered = function (message) { ' +
    '  ajaxRequest(MainForm.form, "'+ MESSAGE_DELIVERED +'", {}); ' +
    '}; ' +
    'window.client.connect({' +
    '  onSuccess: function () {' +
    '    ajaxRequest(MainForm.form, "' + CLIENT_CONNECT_SUCCESS + '", {});' +
    '  },' +
    '  onFailure: function (e) {' +
    '    ajaxRequest(MainForm.form, "' + CLIENT_CONNECT_FAILURE + '", {});' +
    '  }' +
    '});';
end;

class function TMqttJsScripts.Inscrever(ATopico: string; AQos: TMqttQos): string;
begin
  result :=
    'if (window.client && window.client.isConnected()) { ' +
    '   window.client.subscribe("'+ ATopico +'",{qos:'+ Ord(AQos).ToString +'}); ' +
    '   ajaxRequest(MainForm.form, "'+ TOPIC_SUBSCRIBE_SUCESS + '", {}); '+
    '} else { ' +
    '   ajaxRequest(MainForm.form, "' + CLIENT_NOT_CONNECTED +'", {}); '+
    '} ';
end;

class function TMqttJsScripts.Publicar(ATopico, APayload: string; AQos: TMqttQos): string;
begin
  APayload := StringReplace(APayload,#$D#$A,EmptyStr,[rfReplaceAll,rfIgnoreCase]);
  result :=
    'if (window.client && window.client.isConnected()) { ' +
    '  var message = new Paho.Message("' + APayload + '"); ' +
    '  message.destinationName = "'+ ATopico +'"; ' +
    '  message.qos = ' + Ord(AQos).ToString +'; ' +
    '  window.client.send(message); ' +
    '} else { ' +
    '   ajaxRequest(MainForm.form, "' + CLIENT_NOT_CONNECTED +'", {}); '+
    '} ';
end;

end.
