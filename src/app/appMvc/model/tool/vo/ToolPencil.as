/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 10:56
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.tool.vo {
import app.appMvc.model.tool.*;
import app.S;

import flash.display.Stage;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;

public class ToolPencil extends Tool {
    public static const NAME:String = "ToolPencil";
    public function ToolPencil() {super(NAME);}

    private var _prevX:Number;
    private var _prevY:Number;

    override protected function postMouseDown(e:MouseEvent):void {
        trace("pencil start");
        isInUse = true;
        _prevX = relX ;
        _prevY = relY;
    }

    override protected function updateSettings():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_ACTIVE_LAYER, true));
    }

    override protected function validateSettings():void {
        if (!activeLayer) {
            throw (ToolEvent.ERROR_NULL_ACTIVE_LAYER);
        }
    }

    override public function handleMouseUp(e:MouseEvent):void {
        trace("pencil finish");
        isInUse = false;
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (isInUse) {
            useTool(e);
        }
    }
    private function useTool(e:MouseEvent):void {
        activeLayer.graphics.beginFill(0x000000, 1.0);
        activeLayer.graphics.lineStyle(5, 0x000000, 1.0);
            activeLayer.graphics.moveTo(_prevX, _prevY);
            activeLayer.graphics.lineTo(relX, relY);
            _prevX = relX;
            _prevY = relY;
            activeLayer.graphics.endFill();
    }
}
}