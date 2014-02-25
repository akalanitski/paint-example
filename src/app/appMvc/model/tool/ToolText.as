/**
 * Created by cfe on 08.02.14.
 */
package app.appMvc.model.tool {

import app.S;

import flash.events.MouseEvent;

public class ToolText extends Tool {
    public static const NAME:String = "ToolLine";
    public function ToolText() {super(NAME);}

    private var _state:String;
    private function set state(newState:String):void {
        _state = newState;
    }

    override protected function updateSettings():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_ACTIVE_LAYER, true));
    }
    override protected function postMouseDown(e:MouseEvent):void {
        _isInUse = true;
    }

    override public function handleMouseUp(e:MouseEvent):void {
        _isInUse = false;
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (_isInUse) {
        }
    }
}
}
