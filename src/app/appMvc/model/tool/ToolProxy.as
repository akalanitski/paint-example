package app.appMvc.model.tool {
import app.S;
import app.appMvc.Notes;
import app.appMvc.view.mainWindow.MainWindowMediator;

import org.puremvc.as3.patterns.proxy.Proxy;

public class ToolProxy extends Proxy {
    public static const NAME:String = "ToolProxy";
    public function ToolProxy() {super(NAME, new ToolPencil());}
    public function get currentTool():Tool {return data as Tool;}
    public function set currentTool(tool:Tool):void {data = tool;}

    override public function onRegister():void {
        S.stage.addEventListener(ToolEvent.PULL_DOC_ORIGIN_COORDINATES, handlePullDocOriginCoordinates,false, 0, true);
        S.stage.addEventListener(ToolEvent.PUSH_DOC_ORIGIN_COORDINATES, handlePushDocOriginCoordinates, false, 0 , true);
    }

    override public function onRemove():void {
        S.stage.removeEventListener(ToolEvent.PULL_DOC_ORIGIN_COORDINATES, handlePullDocOriginCoordinates);
        S.stage.removeEventListener(ToolEvent.PUSH_DOC_ORIGIN_COORDINATES, handlePushDocOriginCoordinates);
    }
    private function handlePushDocOriginCoordinates(e:ToolEvent):void {
        sendNotification(Notes.PUSH_DOC_ORIGIN_COORDINATES_COMMAND,{docOx:currentTool.docOx,docOy:currentTool.docOy},MainWindowMediator.NAME);
    }
    private function handlePullDocOriginCoordinates(e:ToolEvent):void {
        sendNotification(Notes.PUSH_DOC_ORIGIN_COORDINATES_COMMAND, null, ToolProxy.NAME);
    }
}
}
