unit uWM;

interface

uses
   System.SysUtils,
   System.Classes,
   Web.HTTPApp,
   Datasnap.DSHTTPCommon,
   Datasnap.DSHTTPWebBroker,
   Datasnap.DSServer,
   Web.WebFileDispatcher,
   Web.HTTPProd,
   Datasnap.DSAuth,
   Datasnap.DSProxyDispatcher,
   Datasnap.DSProxyJavaAndroid,
   Datasnap.DSProxyJavaBlackBerry,
   Datasnap.DSProxyObjectiveCiOS,
   Datasnap.DSProxyCsharpSilverlight,
   Datasnap.DSProxyFreePascal_iOS,
   Datasnap.DSProxyJavaScript,
   IPPeerServer,
   Datasnap.DSMetadata,
   Datasnap.DSServerMetadata,
   Datasnap.DSClientMetadata,
   Datasnap.DSCommonServer,
   Datasnap.DSHTTP,
   uSM,
   uSC,
   Web.WebReq,
   IdCustomHTTPServer;

type
   TWM = class(TWebModule)
      DSRESTWebDispatcher1: TDSRESTWebDispatcher;
      ServerFunctionInvoker: TPageProducer;
      ReverseString: TPageProducer;
      WebFileDispatcher1: TWebFileDispatcher;
      DSProxyGenerator1: TDSProxyGenerator;
      DSServerMetaDataProvider1: TDSServerMetaDataProvider;
      DSProxyDispatcher1: TDSProxyDispatcher;
      procedure ServerFunctionInvokerHTMLTag(Sender: TObject; Tag: TTag; const TagString: string; TagParams: TStrings; var ReplaceText: string);
      procedure WebModuleDefaultAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
      procedure WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
      procedure WebFileDispatcher1BeforeDispatch(Sender: TObject; const AFileName: string; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
      procedure WebModuleCreate(Sender: TObject);
      procedure WebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
   private
      { Private declarations }
      FServerFunctionInvokerAction: TWebActionItem;
      function AllowServerFunctionInvoker: Boolean;
   public
      { Public declarations }
   end;

var
   WebModuleClass: TComponentClass = TWM;

implementation

{ %CLASSGROUP 'FMX.Controls.TControl' }

{$R *.dfm}

procedure TWM.ServerFunctionInvokerHTMLTag(Sender: TObject; Tag: TTag; const TagString: string; TagParams: TStrings; var ReplaceText: string);
begin
   if SameText(TagString, 'urlpath') then
      ReplaceText := string(Request.InternalScriptName)
   else if SameText(TagString, 'port') then
      ReplaceText := IntToStr(Request.ServerPort)
   else if SameText(TagString, 'host') then
      ReplaceText := string(Request.Host)
   else if SameText(TagString, 'classname') then
      ReplaceText := uSM.TSM.ClassName
   else if SameText(TagString, 'loginrequired') then
      if DSRESTWebDispatcher1.AuthenticationManager <> nil then
         ReplaceText := 'true'
      else
         ReplaceText := 'false'
   else if SameText(TagString, 'serverfunctionsjs') then
      ReplaceText := string(Request.InternalScriptName) + '/js/serverfunctions.js'
   else if SameText(TagString, 'servertime') then
      ReplaceText := DateTimeToStr(Now)
   else if SameText(TagString, 'serverfunctioninvoker') then
      if AllowServerFunctionInvoker then
         ReplaceText := '<div><a href="' + string(Request.InternalScriptName) + '/ServerFunctionInvoker" target="_blank">Server Functions</a></div>'
      else
         ReplaceText := '';
end;

procedure TWM.WebModuleDefaultAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
   if (Request.InternalPathInfo = '') or (Request.InternalPathInfo = '/') then
      Response.Content := ReverseString.Content
   else
      Response.SendRedirect(Request.InternalScriptName + '/');
end;

procedure TWM.WebModuleAfterDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
   //Response.ContentType := 'application/json';
end;

procedure TWM.WebModuleBeforeDispatch(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
   if FServerFunctionInvokerAction <> nil then
      FServerFunctionInvokerAction.Enabled := AllowServerFunctionInvoker;
end;

function TWM.AllowServerFunctionInvoker: Boolean;
begin
   Result := (Request.RemoteAddr = '127.0.0.1') or (Request.RemoteAddr = '0:0:0:0:0:0:0:1') or (Request.RemoteAddr = '::1');
end;

procedure TWM.WebFileDispatcher1BeforeDispatch(Sender: TObject; const AFileName: string; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
   D1, D2: TDateTime;
begin
   Handled := False;
   if SameFileName(ExtractFileName(AFileName), 'serverfunctions.js') then
      if not FileExists(AFileName) or (FileAge(AFileName, D1) and FileAge(WebApplicationFileName, D2) and (D1 < D2)) then
      begin
         DSProxyGenerator1.TargetDirectory := ExtractFilePath(AFileName);
         DSProxyGenerator1.TargetUnitName := ExtractFileName(AFileName);
         DSProxyGenerator1.Write;
      end;
end;

procedure TWM.WebModuleCreate(Sender: TObject);
begin
   FServerFunctionInvokerAction := ActionByName('ServerFunctionInvokerAction');
   DSServerMetaDataProvider1.Server := DSServer;
   DSRESTWebDispatcher1.Server := DSServer;
   if DSServer.Started then
   begin
      DSRESTWebDispatcher1.DbxContext := DSServer.DbxContext;
      DSRESTWebDispatcher1.Start;
   end;
   DSRESTWebDispatcher1.AuthenticationManager := DSAuthenticationManager;
end;

initialization

finalization

Web.WebReq.FreeWebModules;

end.
