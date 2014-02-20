/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 09.01.14
 * Time: 12:52
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.controller {
import app.appMvc.model.appManager.AppManagerMediator;
import app.appMvc.model.appManager.AppManagerProxy;
import app.appMvc.view.KeyMediator;
import app.appMvc.view.MouseMediator;
import app.appMvc.view.toolbar.ToolbarMediator;

import flash.display.Stage;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class StartupCommand extends SimpleCommand {
    override public function execute(note:INotification):void {
        var stage:Stage = note.getBody() as Stage;

        // insert registerCommand()s here

        // insert registerProxy()s here

        // insert registerMediator()s here
        facade.registerMediator(new KeyMediator());
        facade.registerMediator(new MouseMediator());
        facade.registerMediator(new ToolbarMediator());
        // ...

        // insert post actions here
        facade.registerProxy(new AppManagerProxy(stage));
        facade.registerMediator(new AppManagerMediator());
        // ...

        trace("executed StartupCommand");
    }
}
}
