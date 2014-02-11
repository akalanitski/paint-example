/**
 * Created by cfe on 11.02.14.
 */
package app.appMvc.view.toolbar {
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.text.TextField;

import org.puremvc.as3.patterns.mediator.Mediator;

public class ToolbarMediator extends Mediator {
    public static const NAME:String = "ToolbarMediator";
    private var _stage:Stage;

    public function ToolbarMediator(stage:Stage) {
        super(NAME, new Toolbar(stage));
        _stage = stage;
        trace("toolbarConstructor");
    }

    override public function onRegister():void {
        trace("toolbarOnRegister");
        _stage.addEventListener(Toolbar.CLICKED_BUTTON_1, handleClickedToolbarButton);
        _stage.addEventListener(Toolbar.CLICKED_BUTTON_2, handleClickedToolbarButton);
        _stage.addEventListener(Toolbar.CLICKED_BUTTON_3, handleClickedToolbarButton);
    }

    override public function onRemove():void {
        _stage.removeEventListener(Toolbar.CLICKED_BUTTON_1, handleClickedToolbarButton);
        _stage.removeEventListener(Toolbar.CLICKED_BUTTON_2, handleClickedToolbarButton);
        _stage.removeEventListener(Toolbar.CLICKED_BUTTON_3, handleClickedToolbarButton);
    }

    private function handleClickedToolbarButton(e:Event):void {
        var tf:TextField = (e.target as Sprite).getChildAt(0) as TextField;
        trace("sending note to activate tool " + tf.text);
//        sendNotification();
    }

}
}
