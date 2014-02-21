package app.appMvc.view.mainWindow {
import app.S;
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;

import org.puremvc.as3.patterns.mediator.Mediator;

public class MainWindowMediator extends Mediator {
    public static const NAME:String = "MainWindowMediator";
    private const MAIN_WINDOW_MOUSE_DOWN:String = "MAIN_WINDOW_MOUSE_DOWN";
    private const MAIN_WINDOW_MOUSE_MOVE:String = "MAIN_WINDOW_MOUSE_MOVE";
    private const MAIN_WINDOW_MOUSE_UP:String = "MAIN_WINDOW_MOUSE_UP";

    public function get mainWindow():MainWindow {return viewComponent as MainWindow;}
    public function MainWindowMediator() {
        super(NAME);
        var appSettingsProxy:ApplicationSettingsProxy = facade.retrieveProxy(ApplicationSettingsProxy.NAME) as ApplicationSettingsProxy;
        setViewComponent(new MainWindow(appSettingsProxy.settings.activeDocument));
    }

    override public function onRegister():void {
        S.stage.addChildAt(mainWindow, 0);
        mainWindow.addListeners();

        S.stage.addEventListener(MainWindowEvent.MOUSE_DOWN, handleMouseDown, false, 0, true);
        S.stage.addEventListener(MainWindowEvent.MOUSE_MOVE, handleMouseMove, false, 0, true);
        S.stage.addEventListener(MainWindowEvent.MOUSE_UP, handleMouseUp, false, 0, true);
    }
    override public function onRemove():void {
        S.stage.removeChild(mainWindow);
        mainWindow.removeListeners();

        S.stage.removeEventListener(MainWindowEvent.MOUSE_DOWN, handleMouseDown);
        S.stage.removeEventListener(MainWindowEvent.MOUSE_MOVE, handleMouseMove);
        S.stage.removeEventListener(MainWindowEvent.MOUSE_UP, handleMouseUp);
    }
    private function handleMouseDown(e:MainWindowEvent):void {
        sendNotification(MAIN_WINDOW_MOUSE_DOWN, e);
    }
    private function handleMouseMove(e:MainWindowEvent):void {
        sendNotification(MAIN_WINDOW_MOUSE_MOVE, e);
    }
    private function handleMouseUp(e:MainWindowEvent):void {
        sendNotification(MAIN_WINDOW_MOUSE_UP, e);
    }
}
}