package app.appMvc.controller {
import app.appMvc.model.appManager.AppManagerMediator;
import app.appMvc.model.appManager.AppManagerProxy;
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.document.Document;
import app.appMvc.model.tool.ToolProxy;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

// pushes activeDocument to appSettings
public class PushActiveDocumentCommand extends SimpleCommand {
    public function PushActiveDocumentCommand() {}
    override public function execute(note:INotification):void {
        var switchDocument:Document = note.getBody().document as Document;
        var appSettingsProxy:ApplicationSettingsProxy = facade.retrieveProxy(ApplicationSettingsProxy.NAME) as ApplicationSettingsProxy;
        appSettingsProxy.settings.activeDocument = switchDocument;
    }
}
}
