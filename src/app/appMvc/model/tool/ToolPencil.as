/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 10:56
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.tool {
import flash.display.Graphics;
import flash.events.MouseEvent;

public class ToolPencil extends Tool {
    public static const NAME:String = "ToolPencil";

    override public function getName():String {
        return NAME;
    }

    public function ToolPencil(graphics:Graphics) {
        super(graphics);
    }

    private var _prevX:Number;
    private var _prevY:Number;

    private function initTool(e:MouseEvent):void {
        _prevX = e.stageX;
        _prevY = e.stageY;
    }

    private var isDrawing:Boolean;

    override public function handleMouseDown(e:MouseEvent):void {
        isDrawing = true;
        initTool(e);
    }

    override public function handleMouseUp(e:MouseEvent):void {
        isDrawing = false;
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (isDrawing) {
            useTool(e);
        }
    }

    private function useTool(e:MouseEvent):void {
        _graphics.beginFill(0x000000, 1.0);
        _graphics.lineStyle(5, 0x000000, 1.0);
        _graphics.moveTo(_prevX, _prevY);
        _graphics.lineTo(e.stageX, e.stageY);
        _prevX = e.stageX;
        _prevY = e.stageY;
        _graphics.endFill();
    }
}
}
