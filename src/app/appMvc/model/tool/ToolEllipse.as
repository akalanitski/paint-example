/**
 * Created by cfe on 08.02.14.
 */
package app.appMvc.model.tool {

import app.S;

import flash.display.Graphics;
import flash.display.Stage;
import flash.events.MouseEvent;

public class ToolEllipse extends Tool {
    public static const NAME:String = "ToolEllipse";
    public function ToolEllipse() {super(NAME);}

    private var _state:String;
    private function set state(newState:String):void {
        _state = newState;
    }

    override protected function updateSettings():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_ACTIVE_LAYER, true));
    }
    override protected function postMouseDown(e:MouseEvent):void {
        isInUse = true;
    }

    override public function handleMouseUp(e:MouseEvent):void {
        isInUse = false;
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (isInUse) {
        }
    }
}
}
