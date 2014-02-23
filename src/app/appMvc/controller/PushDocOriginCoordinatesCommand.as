package app.appMvc.controller {
import app.appMvc.model.tool.ToolProxy;
import app.appMvc.view.mainWindow.MainWindowMediator;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class PushDocOriginCoordinatesCommand extends SimpleCommand {
    public function PushDocOriginCoordinatesCommand() {}
    override public function execute(note:INotification):void {

        var mainWindowMediator:MainWindowMediator = facade.retrieveMediator(MainWindowMediator.NAME) as MainWindowMediator;

        switch (note.getType()) {

            case ToolProxy.NAME:
                var toolProxy:ToolProxy = facade.retrieveProxy(ToolProxy.NAME) as ToolProxy;
                toolProxy.currentTool.docOx = mainWindowMediator.mainWindow.docOx;
                toolProxy.currentTool.docOy = mainWindowMediator.mainWindow.docOy;
                break;

            case MainWindowMediator.NAME:
                mainWindowMediator.mainWindow.docOx = note.getBody().docOx;
                mainWindowMediator.mainWindow.docOy = note.getBody().docOy;
                break;

            default :
                trace("No destination for docOx docOy specified.");
        }
    }
}
}
