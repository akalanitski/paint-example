/**
 * Created by cfe on 08.02.14.
 */
package app.appMvc.model.tool.vo {
public class ToolEraser extends Tool {
    public static const NAME:String = "ToolEraser";
    public function ToolEraser() {super(NAME);}

    override public function initTool():void {
        setState(StateNone.NAME);
    }
    override public function cleanupTool():void {
        setState(StateNone.NAME);
    }

    override public function setState(stateName:String):void {
        if (stateName == state.name) {
            return;
        }
        state.cleanupState();
        switch (stateName) {
            case StateNone.NAME:
                _state = new StateNone(this);
                break;
            case StateDrawing.NAME:
                _state = new StateDrawing(this);
                break;
        }
        state.initState();
    }
}
}

import app.appMvc.model.tool.vo.Tool;
import app.appMvc.model.tool.vo.ToolState;

import flash.display.BlendMode;
import flash.display.Sprite;
import flash.events.MouseEvent;

class StateNone extends ToolState {
    public static const NAME:String = "StateNone";
    function StateNone(curTool:Tool) {super(NAME, curTool);}

    override public function initState():void {
        tool.isInUse = false;
    }
    override public function handleMouseDown(e:MouseEvent):void {
        tool.setState(StateDrawing.NAME);
        tool.state.handleMouseDown(e);
    }
}

class StateDrawing extends ToolState {
    public static const NAME:String = "StateDrawing";
    function StateDrawing(curTool:Tool) {super(NAME, curTool);}

    private var _eraser:Sprite = new Sprite();
    private var _prevX:Number;
    private var _prevY:Number;

    override public function handleMouseDown(e:MouseEvent):void {
        tool.isInUse = true;
        _prevX = tool.relX;
        _prevY = tool.relY;
        tool.activeLayer.bitmapData.draw(tool.activeLayer.sprite);
        tool.activeLayer.graphics.clear();
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (tool.isInUse) {
            _eraser.graphics.beginFill(0x000000, 1.0);
            _eraser.graphics.lineStyle(5, 0x000000, 1.0);
            _eraser.graphics.moveTo(_prevX, _prevY);
            _eraser.graphics.lineTo(tool.relX, tool.relY);
            _eraser.graphics.endFill();
            _eraser.cacheAsBitmap = true;
            _prevX = tool.relX;
            _prevY = tool.relY;
            // apply to bitmapData
            tool.activeLayer.bitmapData.draw(_eraser, null, null, BlendMode.ERASE);
            _eraser.graphics.clear();
        }
    }

    override public function handleMouseUp(e:MouseEvent):void {
        tool.isInUse = false;
        tool.setState(StateNone.NAME);
    }
}
