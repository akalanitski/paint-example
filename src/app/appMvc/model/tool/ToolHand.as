/**
 * Created by cfe on 15.02.14.
 */
package app.appMvc.model.tool {
import app.S;

import flash.events.Event;

import flash.events.MouseEvent;

public class ToolHand extends Tool {
    public static const NAME:String = "ToolHand";
    public function ToolHand() {super(NAME);}
    private var _prevX:Number = 0.0;
    private var _prevY:Number = 0.0;

    override protected function updateSettings():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.PULL_SHIFT_DOC_COORDINATES, true));
    }
    override protected function postMouseDown(e:MouseEvent):void {
        isInUse = true;
        _prevX = e.stageX;
        _prevY = e.stageY;
    }
    override public function handleMouseMove(e:MouseEvent):void {if (isInUse) {useTool(e);}}
    private function useTool(e:MouseEvent):void {
        shiftDocX = e.stageX - _prevX;
        shiftDocY = e.stageY - _prevY;
//        trace(shiftDocX, shiftDocY);
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.PUSH_SHIFT_DOC_COORDINATES, true));
    }
    override public function handleMouseUp(e:MouseEvent):void {isInUse = false;}
}
}
