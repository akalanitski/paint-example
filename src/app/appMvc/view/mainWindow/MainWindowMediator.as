package app.appMvc.view.mainWindow {
import app.S;
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;

import org.puremvc.as3.patterns.mediator.Mediator;

public class MainWindowMediator extends Mediator {
    public static const NAME:String = "MainWindowMediator";
    public function get mainWindow():MainWindow {return viewComponent as MainWindow;}
    public function MainWindowMediator() {
        super(NAME);
        var appSettingsProxy:ApplicationSettingsProxy = facade.retrieveProxy(ApplicationSettingsProxy.NAME) as ApplicationSettingsProxy;
        setViewComponent(new MainWindow(appSettingsProxy.settings.activeDocument));
        S.stage.addChildAt(mainWindow, 0);
    }
}
}