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
    private var _prevMouseX:Number = 0.0;
    private var _prevMouseY:Number = 0.0;
    private var _prevShiftX:Number = 0.0;
    private var _prevShiftY:Number = 0.0;

    override protected function updateSettings():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.PULL_SHIFT_DOC_COORDINATES, true));
    }
    override protected function postMouseDown(e:MouseEvent):void {
        isInUse = true;
        _prevShiftX = shiftDocX;
        _prevShiftY = shiftDocY;
        _prevMouseX = e.stageX;
        _prevMouseY = e.stageY;
    }
    override public function handleMouseMove(e:MouseEvent):void {if (isInUse) {useTool(e);}}
    private function useTool(e:MouseEvent):void {
        shiftDocX = e.stageX - _prevMouseX + _prevShiftX;
        shiftDocY = e.stageY - _prevMouseY + _prevShiftY;
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.PUSH_SHIFT_DOC_COORDINATES, true));
    }
    override public function handleMouseUp(e:MouseEvent):void {isInUse = false;}
}
}
