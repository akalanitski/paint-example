/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 10:56
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.tool {
import flash.display.Graphics;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;

public class ToolPencil extends Tool {
    public static const NAME:String = "ToolPencil";
    override public function getName():String {
        return NAME;
    }
    public function ToolPencil() {
        super(NAME);
    }
    private var _prevX:Number;
    private var _prevY:Number;
    override public function handleMouseDown(e:MouseEvent):void {
        var dispatcher:EventDispatcher = e.target as EventDispatcher;
        dispatcher.dispatchEvent(new ToolSettingsEvent(ToolSettingsEvent.UPDATE_ACTIVE_LAYER,true));

        if(!activeLayer) {
            trace("No active layer");
            dispatcher.dispatchEvent(new ToolSettingsEvent(ToolSettingsEvent.NULL_ACTIVE_LAYER,true));
            return;
        }
        trace("pencil start");
        _isInUse = true;
        _prevX = e.stageX;
        _prevY = e.stageY;
    }

    override public function handleMouseUp(e:MouseEvent):void {
        trace("pencil finish");
        _isInUse = false;
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (_isInUse) {
            useTool(e);
        }

        function useTool(e:MouseEvent):void {
            activeLayer.graphics.beginFill(0x000000, 1.0);
            activeLayer.graphics.lineStyle(5, 0x000000, 1.0);
            activeLayer.graphics.moveTo(_prevX, _prevY);
            activeLayer.graphics.lineTo(e.stageX, e.stageY);
            _prevX = e.stageX;
            _prevY = e.stageY;
            activeLayer.graphics.endFill();
        }
    }
}
}
