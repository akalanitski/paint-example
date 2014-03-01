/**
 * Created by cfe on 08.02.14.
 */
package app.appMvc.model.tool {

import app.S;

import flash.display.BlendMode;

import flash.display.Graphics;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.MouseEvent;

public class ToolEraser extends Tool {
    public static const NAME:String = "ToolEraser";
    public function ToolEraser() {super(NAME);}

    private var _eraser:Sprite = new Sprite();
    private var _prevX:Number;
    private var _prevY:Number;

    override protected function updateSettings():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_ACTIVE_LAYER, true));
    }
    override protected function validateSettings():void {
        if (!activeLayer) {
            throw (ToolEvent.ERROR_NULL_ACTIVE_LAYER);
        }
    }

    override protected function postMouseDown(e:MouseEvent):void {
        isInUse = true;
        _prevX = relX;
        _prevY = relY;
        activeLayer.bitmapData.draw(activeLayer.sprite);
//        activeLayer.bitmapData. = activeLayer.sprite.width;
        activeLayer.graphics.clear();
    }
    override public function handleMouseMove(e:MouseEvent):void {
        if (isInUse) {
            useTool(e);
        }
    }
    override public function handleMouseUp(e:MouseEvent):void {
        isInUse = false;
    }

    function useTool(e:MouseEvent):void {
        trace("eraser");
        _eraser.graphics.beginFill(0x000000, 1.0);
        _eraser.graphics.lineStyle(5, 0x000000, 1.0);
        _eraser.graphics.moveTo(_prevX, _prevY);
        _eraser.graphics.lineTo(relX, relY);
        _eraser.graphics.endFill();
        _eraser.cacheAsBitmap = true;
        _prevX = relX;
        _prevY = relY;
        // apply to bitmapData
        activeLayer.bitmapData.draw(_eraser,null,null,BlendMode.ERASE);
    }
}
}
