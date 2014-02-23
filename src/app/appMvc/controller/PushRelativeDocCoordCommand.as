package app.appMvc.controller {
import app.appMvc.model.tool.ToolProxy;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class PushRelativeDocCoordCommand extends SimpleCommand {
    public function PushRelativeDocCoordCommand() {}
    override public function execute(note:INotification):void {
        var relX:Number = note.getBody().relX as Number;
        var relY:Number = note.getBody().relY as Number;

        switch (note.getType()) {
            case ToolProxy.NAME:
                var toolProxy:ToolProxy = facade.retrieveProxy(ToolProxy.NAME) as ToolProxy;
                toolProxy.currentTool.relX = relX;
                toolProxy.currentTool.relY = relY;
                break;
            default :
                trace("No destination specified for relDocCoordinates.");
                break;
        }
    }
}
}
