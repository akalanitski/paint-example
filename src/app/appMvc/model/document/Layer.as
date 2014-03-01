/**
 * Created by cfe on 16.02.14.
 */
package app.appMvc.model.document {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Graphics;
import flash.display.Sprite;

public class Layer extends Sprite{
    private var _sprite:Sprite = new Sprite();
    public function get sprite():Sprite {
        return _sprite;
    }
    override public function get graphics():Graphics{
        return _sprite.graphics;
    }
    private var bitmap:Bitmap = new Bitmap();
    public function get bitmapData():BitmapData{return bitmap.bitmapData;}
    public function Layer() {
        bitmap.bitmapData = new BitmapData(200,200);
        addChild(bitmap);
        addChild(_sprite);
    }
    public function clear():void {
        graphics.clear();
        bitmapData.dispose();
        bitmap.bitmapData = new BitmapData(200,200);
    }
}
}
