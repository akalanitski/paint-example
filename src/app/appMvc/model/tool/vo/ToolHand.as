/**
 * Created by cfe on 15.02.14.
 */
package app.appMvc.model.tool.vo {
import app.appMvc.model.tool.*;
import app.S;

import flash.events.Event;

import flash.events.MouseEvent;

public class ToolHand extends Tool {
    public static const NAME:String = "ToolHand";
    public function ToolHand() {super(NAME);}
    private var _prevMouseX:Number = 0.0;
    private var _prevMouseY:Number = 0.0;
    private var _prevDocOx:Number = 0.0;
    private var _prevDocOy:Number = 0.0;

    override protected function updateSettings():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.PULL_DOC_ORIGIN_COORDINATES, true));
    }
    override protected function postMouseDown(e:MouseEvent):void {
        isInUse = true;
        _prevDocOx = docOx;
        _prevDocOy = docOy;
        _prevMouseX = e.stageX;
        _prevMouseY = e.stageY;
    }
    override public function handleMouseMove(e:MouseEvent):void {if (isInUse) {useTool(e);}}
    private function useTool(e:MouseEvent):void {
        docOx = e.stageX - _prevMouseX + _prevDocOx;
        docOy = e.stageY - _prevMouseY + _prevDocOy;
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.PUSH_DOC_ORIGIN_COORDINATES, true));
    }
    override public function handleMouseUp(e:MouseEvent):void {isInUse = false;}
}
}
