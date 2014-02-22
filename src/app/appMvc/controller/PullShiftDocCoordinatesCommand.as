package app.appMvc.controller {
import app.appMvc.model.tool.Tool;
import app.appMvc.model.tool.ToolProxy;
import app.appMvc.view.mainWindow.MainWindow;
import app.appMvc.view.mainWindow.MainWindowMediator;

import flash.display.NativeMenu;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class PullShiftDocCoordinatesCommand extends SimpleCommand {
    public function PullShiftDocCoordinatesCommand() {}
    override public function execute(note:INotification):void {
        var mainWindowMediator:MainWindowMediator = facade.retrieveMediator(MainWindowMediator.NAME) as MainWindowMediator;
            switch(note.getType()){
                case ToolProxy.NAME:
                    var toolProxy:ToolProxy = facade.retrieveProxy(ToolProxy.NAME) as ToolProxy;
                    toolProxy.currentTool.shiftDocX = mainWindowMediator.mainWindow.shiftDocX;
                    toolProxy.currentTool.shiftDocY = mainWindowMediator.mainWindow.shiftDocY;
                    break;
                default :
                    trace("No destination for shiftDoc coordinates specified.");
        }
    }
}
}