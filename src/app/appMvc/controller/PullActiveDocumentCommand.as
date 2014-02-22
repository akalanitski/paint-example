package app.appMvc.controller {
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.tool.ToolProxy;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

// pulls activeDocument from appSettings to destination
public class PullActiveDocumentCommand extends SimpleCommand {
    public function PullActiveDocumentCommand() {}
    override public function execute(note:INotification):void {
        var appSettingsProxy:ApplicationSettingsProxy = facade.retrieveProxy(ApplicationSettingsProxy.NAME) as ApplicationSettingsProxy;
        switch (note.getType()){
            case ToolProxy.NAME:

                break;
            default:
                trace("No destination for activeDocument specified.");
                break;
        }
    }
}
}
