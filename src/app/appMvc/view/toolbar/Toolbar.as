/**
 * Created by cfe on 11.02.14.
 */
package app.appMvc.view.toolbar {
import app.S;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

public class Toolbar extends Sprite {
    public static const CLICKED_BUTTON:String = "Clicked_Button";
    public var buttons:Vector.<Sprite> = new <Sprite>[];

    public function Toolbar() {
        //draws toolbar's background
        graphics.beginFill(0x444444);
        graphics.drawRect(0, 0, 360, 30);
        graphics.endFill();

        addButtons();

        function addButtons():void{
            const xInitPos:int = 5;
            const yInitPos:int = 5;
            var xPos:int = xInitPos;
            var yPos:int = yInitPos;
            const xGap:int = 4;
            var buttonWidth:int = 40;
            var buttonHeight:int = 20;

            addButton(xPos, yPos, buttonWidth, buttonHeight, "Pencil");
            xPos += xGap + buttonWidth;
            addButton(xPos, yPos, buttonWidth, buttonHeight, "Brush");
            xPos += xGap + buttonWidth;
            addButton(xPos, yPos, buttonWidth, buttonHeight, "Square");
            xPos += xGap + buttonWidth;
            addButton(xPos, yPos, buttonWidth, buttonHeight, "Hand");
            xPos += xGap + buttonWidth;
            addButton(xPos, yPos, buttonWidth, buttonHeight, "Line");
            xPos += xGap + buttonWidth;
            addButton(xPos, yPos, buttonWidth, buttonHeight, "Ellipse");
            xPos += xGap + buttonWidth;
            addButton(xPos, yPos, buttonWidth, buttonHeight, "Eraser");
            xPos += xGap + buttonWidth;
            addButton(xPos, yPos, buttonWidth, buttonHeight, "Clear");
        }
    }


    public function toggleVisibility():void{
        visible = !visible;
    }
    // should be called for proper garbage collection
    public function onRemove():void {
        removeListeners();
        // removeChildren
        while (numChildren > 0) {
            // remove TextField
            while ((getChildAt(0) as Sprite).numChildren > 0) {
                removeChildAt(0);
            }
            removeChildAt(0);
        }
    }

    private function removeListeners():void {
        for (var i:int = 0; i < buttons.length; i++) {
            buttons[i].addEventListener(MouseEvent.CLICK, handleButtonClick, false, 0, true); // false, 0 /default values
        }
    }
    private function addButton(x:Number, y:Number, width:Number, height:Number, text:String):void {
        var buttonSprite:Sprite = new Sprite();
        buttonSprite.x = x;
        buttonSprite.y = y;
        buttonSprite.graphics.beginFill(0x999999);
        buttonSprite.graphics.drawRect(0, 0, width, height);
        buttonSprite.graphics.endFill();
        buttonSprite.buttonMode = true;
        buttonSprite.useHandCursor = true;
        var tf:TextField = new TextField();
        tf.selectable = false;
        tf.text = text;
        buttonSprite.addChild(tf);

        addChild(buttonSprite);
        buttonSprite.addEventListener(MouseEvent.CLICK, handleButtonClick, false, 0, true);
        buttons.push(buttonSprite);
    }

    private function handleButtonClick(e:MouseEvent):void {
        var clickedButton:Sprite = e.currentTarget as Sprite;
        clickedButton.dispatchEvent(new Event(CLICKED_BUTTON, true));
    }
}
}
