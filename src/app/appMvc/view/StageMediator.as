/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 10.01.14
 * Time: 15:13
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.view {
import app.appMvc.Notes;

import flash.display.DisplayObject;
import flash.display.Stage;
import flash.display.StageScaleMode;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;

public class StageMediator extends Mediator {
    public static const NAME:String = "StageMediator";

    public function get stage():Stage {
        return viewComponent as Stage;
    }

    public function StageMediator(stage:Stage) {
        super(NAME, stage);
        stage.scaleMode = StageScaleMode.NO_SCALE;
    }

    override public function listNotificationInterests():Array {
        return [
            Notes.ADD_CHILD,
            Notes.REMOVE_CHILD
        ]
    }

    override public function onRegister():void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
        stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
        stage.addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
        stage.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
        stage.addEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
    }
    override public function onRemove():void {
        stage.removeEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
        stage.removeEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
        stage.removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
        stage.removeEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
        stage.removeEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
    }

    private function handleMouseDown(event:MouseEvent):void {sendNotification(Notes.MOUSE_DOWN, event);}
    private function handleMouseUp(event:MouseEvent):void {sendNotification(Notes.MOUSE_UP, event);}
    private function handleMouseMove(event:MouseEvent):void {sendNotification(Notes.MOUSE_MOVE, event);}
    private function handleKeyDown(keyEvent:KeyboardEvent):void {sendNotification(Notes.KEY_DOWN, keyEvent);}
    private function handleKeyUp(keyEvent:KeyboardEvent):void {sendNotification(Notes.KEY_UP, keyEvent);}

    override public function handleNotification(note:INotification):void {
        switch (note.getName()) {
            case Notes.ADD_CHILD:
                stage.addChild(note.getBody() as DisplayObject);
                break;

            case Notes.REMOVE_CHILD:
                stage.removeChild(note.getBody() as DisplayObject);
                break;
            default :
                break;
        }
    }
}
}