package app.appMvc.model.tool {
import app.S;
import app.appMvc.Notes;
import app.appMvc.view.mainWindow.MainWindowMediator;

import org.puremvc.as3.patterns.proxy.Proxy;

public class ToolProxy extends Proxy {
    public static const NAME:String = "ToolProxy";
    public function ToolProxy() {super(NAME, new ToolPencil());}
    public function get currentTool():Tool {return data as Tool;}

    override public function onRegister():void {
        S.stage.addEventListener(ToolEvent.PULL_SHIFT_DOC_COORDINATES, handlePullShiftDocCoordinates,false, 0, true);
        S.stage.addEventListener(ToolEvent.PUSH_SHIFT_DOC_COORDINATES, handlePushShiftDocCoordinates, false, 0 , true);
    }

    override public function onRemove():void {
        S.stage.removeEventListener(ToolEvent.PULL_SHIFT_DOC_COORDINATES, handlePullShiftDocCoordinates);
        S.stage.removeEventListener(ToolEvent.PUSH_SHIFT_DOC_COORDINATES, handlePushShiftDocCoordinates);
    }
    private function handlePushShiftDocCoordinates(e:ToolEvent):void {
        sendNotification(Notes.PUSH_SHIFT_DOC_COORDINATES_COMMAND,{shiftDocX:currentTool.docOx,shiftDocY:currentTool.docOy},MainWindowMediator.NAME);
    }
    private function handlePullShiftDocCoordinates(e:ToolEvent):void {
        sendNotification(Notes.PULL_SHIFT_DOC_COORDINATES_COMMAND, null, ToolProxy.NAME);
    }

    public function setCurrentTool(toolName:String):void {
        if (currentTool.getName() == toolName || currentTool.isInUse) {
            return;
        }
        switch (toolName) {
            case ToolHand.NAME:
                data = new ToolHand();
                break;
            case ToolPencil.NAME:
                data = new ToolPencil();
                break;
            case ToolStencilBrush.NAME:
                data = new ToolStencilBrush();
                break;
            case ToolSquare.NAME:
                data = new ToolSquare();
                break;
        }
    }
}
}
