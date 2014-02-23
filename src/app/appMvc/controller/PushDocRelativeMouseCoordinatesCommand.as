package app.appMvc.controller {
import app.appMvc.model.tool.ToolProxy;
import app.appMvc.view.mainWindow.MainWindowMediator;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class PushDocRelativeMouseCoordinatesCommand extends SimpleCommand {
    public function PushDocRelativeMouseCoordinatesCommand() {}
    override public function execute(note:INotification):void {
        var relX:Number = note.getBody().relX as Number;
        var relY:Number = note.getBody().relY as Number;

        switch (note.getType()) {
            case ToolProxy.NAME:
                var toolProxy:ToolProxy = facade.retrieveProxy(ToolProxy.NAME) as ToolProxy;
                toolProxy.currentTool.relX = relX;
                toolProxy.currentTool.relY = relY;
                break;

            case MainWindowMediator.NAME:
                var docOx:Number = note.getBody().docOx as Number;
                var docOy:Number = note.getBody().docOy as Number;

                var mainWindowMediator:MainWindowMediator = facade.retrieveMediator(MainWindowMediator.NAME) as MainWindowMediator;
                mainWindowMediator.mainWindow.docOx = docOx;
                mainWindowMediator.mainWindow.docOy = docOy;
                break;

            default :
                trace("No destination specified for relDocCoordinates.");
                break;
        }
    }
}
}
