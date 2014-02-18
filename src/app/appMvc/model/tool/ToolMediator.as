package app.appMvc.model.tool {
import app.appMvc.Notes;
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.document.Layer;
import app.appMvc.view.StageMediator;

import flash.display.Stage;
import flash.events.Event;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;

public class ToolMediator extends Mediator {
    public static const NAME:String = "ToolMediator";
    private var _toolProxy:ToolProxy;
    private var _stage:Stage;
    public function ToolMediator() {super(NAME);}

    override public function onRegister():void {
        _toolProxy = facade.retrieveProxy(ToolProxy.NAME) as ToolProxy;
        _stage = (facade.retrieveMediator(StageMediator.NAME) as StageMediator).stage;

        _stage.addEventListener(ToolSettingsEvent.UPDATE_ACTIVE_LAYER, handleUpdateActiveLayer);
        _stage.addEventListener(ToolSettingsEvent.NULL_ACTIVE_LAYER, handleNullActiveLayer);
    }
    private function handleNullActiveLayer(e:Event):void {

    }
    private function handleUpdateActiveLayer(e:Event):void {
        var appSettingsProxy:ApplicationSettingsProxy = facade.retrieveProxy(ApplicationSettingsProxy.NAME) as ApplicationSettingsProxy;
        _toolProxy.currentTool.activeLayer = appSettingsProxy.settings.activeLayer;
    }

    override public function listNotificationInterests():Array {
        return [
            Notes.SET_TOOL
        ]
    }
    override public function handleNotification(note:INotification):void {
        switch (note.getName()) {
            case Notes.SET_TOOL:
                _toolProxy.setCurrentTool(note.getBody() as String);
                break;
        }
    }
}
}