/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 11.01.14
 * Time: 16:17
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.view.components {
import appMvc.model.color.ColorVO;

import flash.display.Shape;
import flash.display.Sprite;

public class ToolColor extends Sprite{
    private var _color:ColorVO = new ColorVO();
    private var _square:Shape;
    public function ToolColor() {
    }
    public function update(color:ColorVO):void{
        _color.setColor(color);
    }
    public function draw(x:Number,y:Number):void{
        if(_square != null) removeChild(_square);

        _square.graphics.clear();
        _square.graphics.beginFill(0x000000);
        _square.graphics.drawRect(x-1,y-1,102,102);
        _square.graphics.beginFill(_color.rgb);
        _square.graphics.drawRect(x,y,100,100);
        _square.graphics.endFill();

        addChild(_square);
    }
}
}
