/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 11.01.14
 * Time: 13:51
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.appManager {
import app.appMvc.Notes;

import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;

public class AppManagerMediator extends Mediator {
    public static const NAME:String = "AppManagerMediator";
    public function AppManagerMediator() {super(NAME);}

    override public function listNotificationInterests():Array {
        return [
            Notes.KEY_UP
        ]
    }

    override public function handleNotification(note:INotification):void {
        var keyEvent:KeyboardEvent = note.getBody() as KeyboardEvent;
        switch (keyEvent.keyCode) {
            case Keyboard.S:
                trace("pressed S");
                break;
            case Keyboard.O:
                trace("pressed O");
                break;
        }
    }
}
}
