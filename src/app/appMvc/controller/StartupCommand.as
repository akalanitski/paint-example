/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 09.01.14
 * Time: 12:52
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.controller {
import app.appMvc.model.canvas.CanvasProxy;
import app.appMvc.model.color.ColorBackProxy;
import app.appMvc.model.color.ColorFrontProxy;
import app.appMvc.view.CanvasMediator;
import app.appMvc.view.StageMediator;
import app.appMvc.view.toolbar.ToolbarMediator;

import flash.display.Stage;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class StartupCommand extends SimpleCommand{
    override public function execute(note:INotification):void {
        var stage:Stage = note.getBody() as Stage;

        // insert registerCommand()s here
        // ...

        // insert registerProxy()s here
        facade.registerProxy(new CanvasProxy(stage));
        facade.registerProxy(new ColorFrontProxy());
        facade.registerProxy(new ColorBackProxy());

        // insert registerMediator()s here
        facade.registerMediator(new StageMediator(stage));
        facade.registerMediator(new CanvasMediator());
        facade.registerMediator(new ToolbarMediator(stage));

        // insert post actions here
        // ...

        trace("executed StartupCommand");
    }
}
}
