/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 15:53
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.fileLoader {
import com.adobe.images.PNGEncoder;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.net.FileReference;

public class FileLoader {
    private var _sprite:Sprite;
    public function FileLoader(sprite:Sprite) {
        _sprite = sprite;
    }
    private var file:FileReference = new FileReference();
    public function saveToPng():void{
        var bitmapData: BitmapData = new BitmapData(_sprite.stage.stageWidth,_sprite.stage.stageHeight);
        bitmapData.draw(_sprite);
        file.save(PNGEncoder.encode(bitmapData),"");
    }
    public function loadFile():void{
        file.addEventListener(Event.SELECT,handleSelect);
        file.addEventListener(ProgressEvent.PROGRESS, handleProgress);
        file.addEventListener(Event.COMPLETE, handleComplete);
        file.browse();
    }
    private function handleProgress(e:ProgressEvent):void { // progress event
        trace("progressHandler: loaded="+e.bytesLoaded+" total="+e.bytesTotal);
    }
    private function handleSelect(e:Event):void{
        file.load();
    }

    private var loader:Loader = new Loader();
    private function handleComplete(e:Event):void
    {
        loader.contentLoaderInfo.addEventListener(Event.INIT, handleInit);
        loader.loadBytes(file.data);
    }

    private function handleInit(e:Event):void {
        var bm:Bitmap = e.currentTarget.loader.content as Bitmap;
        _sprite.graphics.beginBitmapFill(bm.bitmapData);
        _sprite.graphics.lineStyle();
        _sprite.graphics.drawRect(0,0,bm.width,bm.height);
        _sprite.graphics.endFill();
    }
}
}
