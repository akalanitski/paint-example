/**
 * Created by cfe on 20.02.14.
 */
package app.appMvc.view {
import app.S;
import app.appMvc.Notes;

import flash.events.MouseEvent;

import org.puremvc.as3.patterns.mediator.Mediator;

/**
 * Sends flash mouseEvents as pureMVC Notifications
 */
public class MouseNotifierMediator extends Mediator {
    private static const NAME:String = "MouseNotifierMediator";
    public function MouseNotifierMediator() {super(NAME);}

    private function handleMouseDown(event:MouseEvent):void {sendNotification(Notes.MOUSE_DOWN, event);}
    private function handleMouseUp(event:MouseEvent):void {sendNotification(Notes.MOUSE_UP, event);}
    private function handleMouseMove(event:MouseEvent):void {sendNotification(Notes.MOUSE_MOVE, event);}

    override public function onRegister():void {
        S.stage.addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
        S.stage.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
        S.stage.addEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
    }
    override public function onRemove():void {
        S.stage.removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
        S.stage.removeEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
        S.stage.removeEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
    }
}
}
