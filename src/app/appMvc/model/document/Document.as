/**
 * Created by cfe on 16.02.14.
 */
package app.appMvc.model.document {
import flash.display.Sprite;
import flash.geom.Rectangle;

public class Document extends Sprite {
    private var _docWidth:uint=350;
    private var _docHeight:uint=220;
    private var _layers:Vector.<Layer> = new <Layer>[new Layer()];
    public function Document() {
        scrollRect = (new Rectangle(0, 0, docWidth, docHeight));
        addChild(_layers[0]);
    }

    public function get docWidth():uint {return _docWidth;}
    public function set docWidth(value:uint):void {_docWidth = value;}
    public function get docHeight():uint {return _docHeight;}
    public function set docHeight(value:uint):void {_docHeight = value;}

    public function get layers():Vector.<Layer> {return _layers;}
}
}