package app.appMvc.controller {
import app.appMvc.model.tool.ToolProxy;
import app.appMvc.view.mainWindow.MainWindowMediator;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class PushShiftDocCoordinatesCommand extends SimpleCommand {
    public function PushShiftDocCoordinatesCommand() {}
    override public function execute(note:INotification):void {
        var shiftDocX:Number = note.getBody().shiftDocX as Number;
        var shiftDocY:Number = note.getBody().shiftDocY as Number;

        var mainWindowMediator:MainWindowMediator = facade.retrieveMediator(MainWindowMediator.NAME) as MainWindowMediator;
        mainWindowMediator.mainWindow.shiftDocX = shiftDocX;
        mainWindowMediator.mainWindow.shiftDocY = shiftDocY;
    }
}
}
