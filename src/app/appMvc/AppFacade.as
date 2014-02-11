/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 09.01.14
 * Time: 13:04
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc {
import app.appMvc.controller.StartupCommand;

import org.puremvc.as3.patterns.facade.Facade;

public class AppFacade extends Facade {
    public static function getInstance():AppFacade {
        if (instance == null) instance = new AppFacade();
        return instance as AppFacade;
    }

    override protected function initializeFacade():void {
        super.initializeFacade();
        registerCommand(Notes.STARTUP, StartupCommand);
    }
}
}
