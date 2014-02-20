/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 11.01.14
 * Time: 13:51
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.appManager {
import app.appMvc.Notes;
import app.appMvc.model.tool.ToolSettingsEvent;

import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.ui.Keyboard;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;

public class AppManagerMediator extends Mediator {
    public static const NAME:String = "AppManagerMediator";
    private var _appManagerProxy:AppManagerProxy;
    public function AppManagerMediator() {super(NAME);}

    override public function onRegister():void {_appManagerProxy = facade.retrieveProxy(AppManagerProxy.NAME) as AppManagerProxy;}
    override public function onRemove():void {}

    override public function listNotificationInterests():Array {
        return [
            Notes.KEY_UP,
            Notes.MOUSE_DOWN,
            Notes.MOUSE_UP,
            Notes.MOUSE_MOVE
        ]
    }

    override public function handleNotification(note:INotification):void {
        switch (note.getName()) {
            case Notes.MOUSE_UP:
                _appManagerProxy.currentTool.handleMouseUp(note.getBody() as MouseEvent);
                break;

            case Notes.MOUSE_DOWN:
                try{
                    _appManagerProxy.currentTool.handleMouseDown(note.getBody() as MouseEvent);
                }catch(error:Error){
                    if (error.message == ToolSettingsEvent.ERROR_NULL_ACTIVE_LAYER) {
                        trace("No active layer.")
                    }
                }
                break;

            case Notes.MOUSE_MOVE:
                _appManagerProxy.currentTool.handleMouseMove(note.getBody() as MouseEvent);
                break;

            case Notes.KEY_UP:
                var keyEvent:KeyboardEvent = note.getBody() as KeyboardEvent;
                switch (keyEvent.keyCode) {

                    case Keyboard.S:
                        trace("pressed S");
                        break;
                    case Keyboard.O:
                        trace("pressed O");
                        break;
                }
                break;
        }
    }
}
}
