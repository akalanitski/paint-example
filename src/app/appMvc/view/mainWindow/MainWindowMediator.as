package app.appMvc.view.mainWindow {
import app.S;
import app.appMvc.Notes;
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.tool.ToolProxy;
import app.appMvc.view.mainWindow.vc.MainWindow;
import app.appMvc.view.mainWindow.vc.MainWindowEvent;

import flash.events.MouseEvent;

import org.puremvc.as3.interfaces.INotification;

import org.puremvc.as3.patterns.mediator.Mediator;

public class MainWindowMediator extends Mediator {
    public static const NAME:String = "MainWindowMediator";
    private function get _mainWindow():MainWindow {return viewComponent as MainWindow;}
    public function MainWindowMediator() {
        super(NAME);
        var mainWindowProxy:MainWindowProxy = facade.retrieveProxy(MainWindowProxy.NAME) as MainWindowProxy;
        setViewComponent(mainWindowProxy.getData() as MainWindow);
    }

    override public function listNotificationInterests():Array {
        return [
        ]
    }

    override public function handleNotification(note:INotification):void {
    }
    override public function onRegister():void {
        S.stage.addChildAt(_mainWindow, 0);
        _mainWindow.addListeners();

        _mainWindow.addEventListener(MainWindowEvent.MOUSE_DOWN, handleMouseDown, false, 0, true);
        _mainWindow.addEventListener(MainWindowEvent.MOUSE_MOVE, handleMouseMove, false, 0, true);
        _mainWindow.addEventListener(MainWindowEvent.MOUSE_UP, handleMouseUp, false, 0, true);
    }
    override public function onRemove():void {
        S.stage.removeChild(_mainWindow);
        _mainWindow.removeListeners();

        _mainWindow.removeEventListener(MainWindowEvent.MOUSE_DOWN, handleMouseDown);
        _mainWindow.removeEventListener(MainWindowEvent.MOUSE_MOVE, handleMouseMove);
        _mainWindow.removeEventListener(MainWindowEvent.MOUSE_UP, handleMouseUp);
    }

    private function handleMouseDown(e:MainWindowEvent):void {
        sendNotification(Notes.MAIN_WINDOW_MOUSE_DOWN, e.data as MouseEvent);
    }

    private function handleMouseMove(e:MainWindowEvent):void {
        var mE:MouseEvent = e.data as MouseEvent;
        sendNotification(Notes.RELATIVE_MOUSE_COORDINATES_CHANGED,{
                             relX: mE.stageX - _mainWindow.docOx,
                             relY: mE.stageY - _mainWindow.docOy});
        sendNotification(Notes.MAIN_WINDOW_MOUSE_MOVE, e.data as MouseEvent);
    }
    private function handleMouseUp(e:MainWindowEvent):void {
        sendNotification(Notes.MAIN_WINDOW_MOUSE_UP, e.data as MouseEvent);
    }
}
}
