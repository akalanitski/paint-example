/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 10.01.14
 * Time: 15:49
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.appManager {
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.document.DocumentProxy;
import app.appMvc.model.tool.ToolMediator;
import app.appMvc.model.tool.ToolProxy;

import flash.display.Stage;

import org.puremvc.as3.patterns.proxy.Proxy;

public class AppManagerProxy extends Proxy {
    public static const NAME:String = "AppManagerProxy";
    private var _applicationSettingsProxy:ApplicationSettingsProxy;
    private var _toolProxy:ToolProxy;
    private var _documentProxy:DocumentProxy;

    private var _stage:Stage;
    public function AppManagerProxy(stage:Stage) {
        super(NAME);
        _stage = stage;
    }

    override public function onRegister():void {
        _applicationSettingsProxy = new ApplicationSettingsProxy();
        _toolProxy = new ToolProxy();
        _documentProxy = new DocumentProxy();

        facade.registerProxy(_applicationSettingsProxy);
        facade.registerProxy(_toolProxy);
        facade.registerProxy(_documentProxy);

        facade.registerMediator(new ToolMediator());
    }
    override public function onRemove():void {}

}
}