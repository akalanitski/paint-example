/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 09.01.14
 * Time: 12:52
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.controller {
import app.appMvc.Notes;
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.document.DocumentProxy;
import app.appMvc.model.tool.ToolMediator;
import app.appMvc.model.tool.ToolProxy;
import app.appMvc.view.KeyNotifierMediator;
import app.appMvc.view.MouseNotifierMediator;
import app.appMvc.view.mainWindow.MainWindowMediator;
import app.appMvc.view.mainWindow.MainWindowProxy;
import app.appMvc.view.toolbar.ToolbarMediator;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class StartupCommand extends SimpleCommand {
    override public function execute(note:INotification):void {
        // insert registerCommand()s here
        facade.registerCommand(Notes.SET_TOOL_COMMAND, SetToolCommand);
        //...

        // insert registerProxy()s here
        facade.registerProxy(new DocumentProxy());
        facade.registerProxy(new ApplicationSettingsProxy());
        facade.registerProxy(new ToolProxy());
        facade.registerProxy(new MainWindowProxy());
        //...

        // insert registerMediator()s here
//        facade.registerMediator(new AppManagerMediator());
        facade.registerMediator(new KeyNotifierMediator());
        facade.registerMediator(new MouseNotifierMediator());
        facade.registerMediator(new ToolMediator());
        facade.registerMediator(new ToolbarMediator());
        facade.registerMediator(new MainWindowMediator());
        // ...

        // insert post actions here
        var applicationSettingsProxy:ApplicationSettingsProxy = facade.retrieveProxy(ApplicationSettingsProxy.NAME) as ApplicationSettingsProxy;
        sendNotification(Notes.ACTIVE_LAYER_CHANGED, applicationSettingsProxy.getActiveLayer());
        // ...


        trace("executed StartupCommand");
    }
}
}
