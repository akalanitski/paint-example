/**
 * Created by cfe on 23.02.14.
 */
package app.appMvc.view.layersWindow {
import app.S;
import app.appMvc.model.document.Document;
import app.appMvc.model.document.Layer;

import flash.display.Sprite;
import flash.geom.Rectangle;
import flash.text.TextField;

// shows list of layers on top of background
public class LayersWindow extends Sprite {
    private var _doc:Document;
    private var _back:Sprite = new Sprite();
    private var _scrollView:Sprite = new Sprite();
    private var _listSprites:Vector.<Sprite> = new Vector.<Sprite>();
    public function LayersWindow() {
        x = 100;
        y = 100;
        updateBackground();
        addChild(_back);

        _scrollView.scrollRect = new Rectangle(0, 0, 60, 200);
        addChild(_scrollView);

        S.stage.addChild(this);
    }

    public function updateBackground():void {
        _back.graphics.beginFill(0x222222);
        _back.graphics.drawRect(0, 0, 100, 50);
        _back.graphics.endFill();
    }

    public function updateLayers():void {
        for (var i:int = 0; i < _doc.layers.length; i++) {
            var layer:Layer = _doc.layers[i];
            drawLayer(layer);
        }
        updateBackground();
    }

    public function drawLayer(layer:Layer, color:uint):void {
        var gapX:int = 4;
        var gapY:int = 4;
        var thumbWidth:int = 40;
        var thumbHeight:int = 40;
        var tfWidth:int = 70;

        var layerBack:Sprite = new Sprite();
        layerBack.graphics.beginFill(color);
        layerBack.graphics.drawRect(0, 0,
                                    gapX + thumbWidth + gapX + tfWidth + gapX,
                                    gapY + thumbHeight + gapY);
        _scrollView.graphics.endFill();

        var thumb:Sprite = new Sprite();
        thumb.x = gapX;
        thumb.y = gapY;
        thumb.graphics.copyFrom(layer.graphics);
        _scrollView.addChild(thumb);

        var scale:Number = ((thumbHeight/thumbWidth) > (layer.height/layer.width)) ? (thumbWidth/layer.width) : (thumbHeight/layer.height);
        thumb.scaleX = scale;
        thumb.scaleY = scale;

        var layerName:TextField = new TextField();
        layerName.text = layer.name;
        layerName.x = gapX + thumbWidth + gapX;
        layerName.y = gapY;
        _scrollView.addChild(layerName);
    }
}
}
