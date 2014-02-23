package app.appMvc.controller {
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.tool.ToolProxy;
import app.appMvc.view.mainWindow.MainWindowMediator;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class PushActiveLayerCommand extends SimpleCommand {
    public function PushActiveLayerCommand() {}
    override public function execute(note:INotification):void {

        var appSettingsProxy:ApplicationSettingsProxy = facade.retrieveProxy(ApplicationSettingsProxy.NAME) as ApplicationSettingsProxy;

        switch (note.getType()) {

            case MainWindowMediator.NAME:
                var mainWindowMediator:MainWindowMediator = facade.retrieveMediator(MainWindowMediator.NAME) as MainWindowMediator;
                mainWindowMediator.mainWindow.setDocument(appSettingsProxy.settings.activeDocument);
                break;

            case ApplicationSettingsProxy.NAME:
                appSettingsProxy.settings.activeLayer = note.getBody().layer;
                break;

            default:
                trace("No destination for activeLayer specified.");
                break;
        }
    }
}
}
