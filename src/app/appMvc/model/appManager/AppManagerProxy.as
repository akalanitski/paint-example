/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 10.01.14
 * Time: 15:49
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.appManager {
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.document.Document;
import app.appMvc.model.document.DocumentProxy;
import app.appMvc.model.document.Layer;
import app.appMvc.model.tool.Tool;
import app.appMvc.model.tool.ToolMediator;
import app.appMvc.model.tool.ToolProxy;

import flash.display.Stage;

import org.puremvc.as3.patterns.proxy.Proxy;

public class AppManagerProxy extends Proxy {
    public static const NAME:String = "AppManagerProxy";
    private var _applicationSettingsProxy:ApplicationSettingsProxy;
    private var _toolProxy:ToolProxy;
    private var _documentProxy:DocumentProxy;

    public function AppManagerProxy() {
        super(NAME);
    }

    override public function onRegister():void {
        _applicationSettingsProxy = new ApplicationSettingsProxy();
        _toolProxy = new ToolProxy();
        _documentProxy = new DocumentProxy();

        facade.registerProxy(_applicationSettingsProxy);
        facade.registerProxy(_toolProxy);
        facade.registerProxy(_documentProxy);

        // set active layer
        setActiveLayer(_documentProxy.documents[0].layers[0]);
        setActiveDocument(_documentProxy.documents[0]);
    }

    public function setActiveDocument(doc:Document):void{_applicationSettingsProxy.settings.activeDocument = doc;}
    public function setActiveLayer(layer:Layer):void {_applicationSettingsProxy.settings.activeLayer = layer;}
    public function get currentTool():Tool {return _toolProxy.currentTool;}
}
}