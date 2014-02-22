package app.appMvc.controller {
import app.appMvc.model.tool.ToolProxy;
import app.appMvc.view.mainWindow.MainWindowMediator;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class PushShiftDocCoordinatesCommand extends SimpleCommand {
    public function PushShiftDocCoordinatesCommand() {}
    override public function execute(note:INotification):void {
        var mainWindowMediator:MainWindowMediator = facade.retrieveMediator(MainWindowMediator.NAME) as MainWindowMediator;
        var toolProxy:ToolProxy = facade.retrieveProxy(ToolProxy.NAME) as ToolProxy;
        trace(mainWindowMediator.mainWindow.shiftDocX, mainWindowMediator.mainWindow.shiftDocY);
//        trace(toolProxy.currentTool.shiftDocX, toolProxy.currentTool.shiftDocY);
        trace("push");
        var shiftDocX:Number = note.getBody().shiftDocX;
        var shiftDocY:Number = note.getBody().shiftDocY;
        mainWindowMediator.mainWindow.shiftDocX = shiftDocX; // toolProxy.currentTool.shiftDocX;
        mainWindowMediator.mainWindow.shiftDocY = shiftDocY; // toolProxy.currentTool.shiftDocY;
    }
}
}