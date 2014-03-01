/**
 * Created by cfe on 08.02.14.
 */
package app.appMvc.model.tool {

import app.S;

import flash.display.Graphics;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.ui.Keyboard;

public class ToolLine extends Tool {
    public static const NAME:String = "ToolLine";
    public function ToolLine() {super(NAME);}

    private var _state:String = STATE_NONE;
    public static const STATE_NONE:String = "STATE_NONE";
    public static const STATE_DRAWING:String = "STATE_DRAWING";

    private var _line:Sprite = new Sprite();
    private var  _prevX:Number;
    private var  _prevY:Number;

    private function get state():String {return _state;}
    private function set state(newState:String):void {
        if (newState == STATE_NONE){isInUse = false;}
        else {isInUse = true;}
        _state = newState;
    }

    override public function onRegister():void {
        S.stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_ACTIVE_LAYER, true));
        activeLayer.addChild(_line);
    }
    override public function onRemove():void {
        S.stage.removeEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
        activeLayer.removeChild(_line);
    }
    private function handleKeyUp(e:KeyboardEvent):void {
        switch (e.keyCode) {
            case Keyboard.ESCAPE:
                _line.graphics.clear();
                state = STATE_NONE;
                break;
        }
    }
    override protected function updateSettings():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_ACTIVE_LAYER, true));
    }
    override protected function validateSettings():void {
        if (!activeLayer) {
            S.stage.dispatchEvent(new ToolEvent(ToolEvent.ERROR_NULL_ACTIVE_LAYER, true));
        }
    }
    override protected function postMouseDown(e:MouseEvent):void {
        _prevX = relX;
        _prevY = relY;

        switch (_state) {
            case STATE_NONE:
                break;
            case STATE_DRAWING:
                trace("lineDown");
                // apply visual line to active layer
                activeLayer.graphics.drawGraphicsData(_line.graphics.readGraphicsData(true));
                break;
        }
        _state = STATE_DRAWING;
    }

    override public function handleMouseUp(e:MouseEvent):void {
    }

    override public function handleMouseMove(e:MouseEvent):void {
        switch (_state) {
            case STATE_NONE:
                break;
            case STATE_DRAWING:
                // draw visual line from mouseDown to mouseMove
                _line.graphics.clear();
                _line.graphics.beginFill(0x000000, 1.0);
                _line.graphics.lineStyle(3, 0x000000, 1.0);
                _line.graphics.moveTo(_prevX, _prevY);
                _line.graphics.lineTo(relX, relY);
                _line.graphics.endFill();
                break;
        }
    }
}
}
