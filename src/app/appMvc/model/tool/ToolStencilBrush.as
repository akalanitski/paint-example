/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 12:13
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.tool {
import app.S;

import flash.events.MouseEvent;

public class ToolStencilBrush extends Tool {
    public static const NAME:String = "ToolStencilBrush";
    public function ToolStencilBrush() {
        super(NAME);
    }


    override protected function updateSettings():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_ACTIVE_LAYER,true));
    }
    override protected function postMouseDown(e:MouseEvent):void {
        isInUse = true;
    }

    override public function handleMouseUp(e:MouseEvent):void {
        isInUse = false;
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (isInUse) {
            useTool(e);
        }
        function useTool(e:MouseEvent):void {
            activeLayer.graphics.beginFill(0x000000, 1.0);
            activeLayer.graphics.lineStyle();
            activeLayer.graphics.drawCircle(relX, relY, 5);
            activeLayer.graphics.endFill();
        }
    }
}
}
