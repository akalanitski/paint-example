/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 09.01.14
 * Time: 12:52
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.controller {
import app.appMvc.Notes;
import app.appMvc.model.appManager.AppManagerMediator;
import app.appMvc.model.appManager.AppManagerProxy;
import app.appMvc.model.tool.ToolMediator;
import app.appMvc.view.KeyMediator;
import app.appMvc.view.MouseMediator;
import app.appMvc.view.mainWindow.MainWindowMediator;
import app.appMvc.view.toolbar.ToolbarMediator;

import flash.display.Stage;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class StartupCommand extends SimpleCommand {
    override public function execute(note:INotification):void {
        // insert registerCommand()s here
        facade.registerCommand(Notes.PULL_SHIFT_DOC_COORDINATES_COMMAND, PullShiftDocCoordinatesCommand);
        facade.registerCommand(Notes.PUSH_SHIFT_DOC_COORDINATES_COMMAND, PushShiftDocCoordinatesCommand);
        //...

        // insert registerProxy()s here
        facade.registerProxy(new AppManagerProxy());
        //...

        // insert registerMediator()s here
        facade.registerMediator(new AppManagerMediator());
        facade.registerMediator(new KeyMediator());
        facade.registerMediator(new MouseMediator());
        facade.registerMediator(new ToolMediator());
        facade.registerMediator(new ToolbarMediator());
        facade.registerMediator(new MainWindowMediator());
        // ...

        // insert post actions here
        // ...

        trace("executed StartupCommand");
    }
}
}
