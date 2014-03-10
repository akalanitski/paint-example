package app.appMvc.view.mainWindow {
import app.appMvc.Notes;
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.view.mainWindow.vc.MainWindow;

import flash.events.Event;

import org.puremvc.as3.patterns.proxy.Proxy;

public class MainWindowProxy extends Proxy {
    public static const NAME:String = "MainWindowProxy";
    public function MainWindowProxy() {
        super(NAME);
        var appSettingsProxy:ApplicationSettingsProxy = facade.retrieveProxy(ApplicationSettingsProxy.NAME) as ApplicationSettingsProxy;
        setData(new MainWindow(appSettingsProxy.getActiveDocument()));
    }

    private function get _mainWindow():MainWindow {return data as MainWindow;}

    override public function onRegister():void {
        _mainWindow.addEventListener(MainWindow.DOC_OX_CHANGED, onDocOxChanged);
        _mainWindow.addEventListener(MainWindow.DOC_OY_CHANGED, onDocOyChanged);
    }
    override public function onRemove():void {
        _mainWindow.removeEventListener(MainWindow.DOC_OX_CHANGED, onDocOxChanged);
        _mainWindow.removeEventListener(MainWindow.DOC_OY_CHANGED, onDocOyChanged);
    }

    private function onDocOxChanged(e:Event):void {
        sendNotification(Notes.DOCUMENT_OX_CHANGED, docOx);
    }
    private function onDocOyChanged(e:Event):void {
        sendNotification(Notes.DOCUMENT_OY_CHANGED, docOy);
    }

    public function get docOx():Number {return _mainWindow.docOx;}
    public function set docOx(value:Number):void {
        _mainWindow.docOx = value;
        sendNotification(Notes.DOCUMENT_OX_CHANGED, docOx);
    }

    public function get docOy():Number {return _mainWindow.docOy;}
    public function set docOy(value:Number):void {
        _mainWindow.docOy = value;
        sendNotification(Notes.DOCUMENT_OY_CHANGED, docOy);
    }
}
}
