/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 10.01.14
 * Time: 15:49
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.appManager {
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.tool.ToolProxy;

import flash.display.Stage;

import org.puremvc.as3.patterns.proxy.Proxy;

public class AppManagerProxy extends Proxy {
    public static const NAME:String = "AppManagerProxy";

    public function AppManagerProxy(stage:Stage) {
        super(NAME, new AppManagerVO(stage));
    }

    public function get appManager():AppManagerVO {
        return data as AppManagerVO;
    }

    override public function onRegister():void {
        facade.registerProxy(new ApplicationSettingsProxy());
        facade.registerProxy(new ToolProxy());
        appManager.addListeners();
    }

    override public function onRemove():void {
        appManager.removeListeners();
    }
}
}