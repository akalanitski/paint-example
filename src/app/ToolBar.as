/**
 * Created by cfe on 18.12.13.
 */
package app {
import flash.display.Graphics;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.MouseEvent;

public class ToolBar extends Sprite {
    // Background
    public function ToolBar() {
        this.x = 100;
        this.y = 100;
        // init pullRect
        this.pullRect = new Sprite();
        this.addChild(this.pullRect);

        this.pullRect.graphics.beginFill(0xFF55AA, 0.3);
        this.pullRect.graphics.drawRect(0, 0, 100, 10);
        this.pullRect.graphics.endFill();

        this.pullRect.addEventListener(MouseEvent.MOUSE_DOWN, stickToCursor);
        this.pullRect.addEventListener(MouseEvent.MOUSE_UP, unStickFromCursor);
//        this.pullRect.addEventListener(MouseEvent.MOUSE_OUT, unStickFromCursor);
    }

    // header rect to move toolbar
    private var bg:Sprite;
    // stick toolbar to cursor
    private var pullRect:Sprite;

    // buttons to switch tool
    private var isMoving:Boolean = false;
    private var stageStickX:int;
    private var stageStickY:int;
    private var previousX:int;
    private var previousY:int;

    // reference to canvas.graphics
    private var Buttons:Sprite;
    private var canvasGraphics:Graphics;

    public function stickToCursor(event:MouseEvent):void {
        this.isMoving = true;
        stageStickX = event.stageX;
        stageStickY = event.stageY;
        this.previousX = this.x;
        this.previousY = this.y;
        trace("stick");
    }

    public function unStickFromCursor(event:MouseEvent):void {
        this.isMoving = false;
        this.stageStickX = 0;
        this.stageStickY = 0;
        trace("unStick");
    }

    public function move(event:MouseEvent):void {
        if (this.isMoving) {
            this.x = this.previousX - this.stageStickX + event.stageX;
            this.y = this.previousY - this.stageStickY + event.stageY;
        }
    }
}
}
