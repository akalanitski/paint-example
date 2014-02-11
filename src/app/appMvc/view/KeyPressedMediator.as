/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 12:52
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.view {
import appMvc.Notes;

import flash.events.KeyboardEvent;

import org.puremvc.as3.interfaces.INotification;

import org.puremvc.as3.patterns.mediator.Mediator;

public class KeyPressedMediator extends Mediator{
    public static const NAME:String = "KeyPressedMediator";
    public function KeyPressedMediator() {
        super(NAME);
    }

    override public function listNotificationInterests():Array {
        return [
                Notes.KEY_DOWN,
                Notes.KEY_UP
        ]
    }

    override public function handleNotification(note:INotification):void {
        var keyEvent:KeyboardEvent = note.getBody() as KeyboardEvent;
        switch (note.getName()){

        }
    }
}
}
