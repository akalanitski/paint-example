/**
 * Created by cfe on 11.12.13.
 */
package app {
import flash.display.Bitmap;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.MouseEvent;
import flash.text.GridFitType;
import flash.text.TextField;

public class DocumentClass extends MovieClip {
    [Embed(source="cute_image.jpg")]
    public static var AnImage:Class;

    private var canvas:Sprite;
    private var isDrawing:Boolean = false;

    public function DocumentClass() {
        // init stage
        this.stage.align = StageAlign.TOP_LEFT;
        this.stage.scaleMode = StageScaleMode.NO_SCALE;

        // add image
        var anImage:Bitmap = new AnImage() as Bitmap;
        this.addChild(anImage);

        // init canvas for drawing
        this.canvas = new Sprite();
        addChild(canvas);
        this.canvas.graphics.beginFill(0);
        this.stage.addEventListener(MouseEvent.MOUSE_DOWN, this.beginDraw);
        this.stage.addEventListener(MouseEvent.MOUSE_MOVE, this.draw);
        this.stage.addEventListener(MouseEvent.MOUSE_UP, this.endDraw);

        // clearCanvas button
        var clearBtnSprite:Sprite = new Sprite();
        clearBtnSprite.buttonMode = true;
        clearBtnSprite.graphics.beginFill(0xff0000,1);
        clearBtnSprite.graphics.drawRect(0, 0, 70, 30);
        clearBtnSprite.graphics.endFill();
        clearBtnSprite.addEventListener(MouseEvent.CLICK, this.clearCanvas);
        // adding text to button
        var clearBtnText:TextField = new TextField();
        clearBtnText.text = "Clear";
        clearBtnText.mouseEnabled = false;
        // buttonContainer
        var clearBtnContainer:Sprite = new Sprite();
        clearBtnContainer.x = 20;
        clearBtnContainer.y = 20;
        clearBtnContainer.addChild(clearBtnSprite);
        clearBtnContainer.addChild(clearBtnText);
        this.addChild(clearBtnContainer);

        // trace to console
        var sample:String = "Hello World";
        trace(sample);
    }

    public function beginDraw(event):void {
        this.isDrawing = true;
    }

    public function endDraw(event):void {
        this.isDrawing = false;
    }

    public function clearCanvas(event:MouseEvent):void {
        this.canvas.graphics.clear();
        this.canvas.graphics.beginFill(0);
    }

    public function draw(event:MouseEvent):void {
        if (isDrawing) {
            this.canvas.graphics.beginFill(0);
//            this.canvas.graphics.lineTo(event.stageX,event.stageY);
            this.canvas.graphics.drawCircle(event.stageX, event.stageY, 5);
            this.canvas.graphics.endFill();
        }
    }

}
}