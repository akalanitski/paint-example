/**
 * Created by cfe on 11.02.14.
 */
package app.appMvc.view.toolbar {
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

public class Toolbar extends Sprite {
//    public static const CLICKED_BUTTON_1:String = "clickedButton1";
//    public static const CLICKED_BUTTON_2:String = "clickedButton2";
//    public static const CLICKED_BUTTON_3:String = "clickedButton3";
    public static const CLICKED_BUTTON:String = "Clicked_Button";
    public var button_1:Sprite;
    public var button_2:Sprite;
    public var button_3:Sprite;
    public var button_clear:Sprite;
    public var button_hand:Sprite;

    public function Toolbar(stage:Stage) {
        graphics.beginFill(0x444444);
        graphics.drawRect(0, 0, 300, 30);
        graphics.endFill();

        var xPosition:int = 5;
        const xGap:int = 5;
        // button_1
        button_1 = newButton(xPosition, 5, 40, 20, "Pencil");
        addChild(button_1);
        button_1.addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);
        xPosition += button_1.width + xGap;

        // button_2
        button_2 = newButton(xPosition, 5, 40, 20, "Brush");
        addChild(button_2);
        button_2.addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);
        xPosition += button_2.width + xGap;

        // button_3
        button_3 = newButton(xPosition, 5, 40, 20, "Square");
        addChild(button_3);
        button_3.addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);
        xPosition += button_3.width + xGap;

        // button_clear
        button_clear = newButton(xPosition, 5, 40, 20, "Clear");
        addChild(button_clear);
        button_clear.addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);
        xPosition += button_clear.width + xGap;

        // button_clear
        button_hand = newButton(xPosition, 5, 40, 20, "Hand");
        addChild(button_hand);
        button_hand.addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);
        xPosition += button_hand.width + xGap;

        stage.addChild(this);
    }

    public function toggleVisibility(){
        visible = !visible;
    }
    // should be called for proper garbage collection
    public function onRemove():void {
        // removeChildren
        while (numChildren > 0) {
            // remove TextField
            while ((getChildAt(0) as Sprite).numChildren > 0) {
                removeChildAt(0);
            }
            removeChildAt(0);
        }
    }

    private function addListeners():void {
        for (var i:int = 0; i < numChildren; i++) {
            getChildAt(i).addEventListener(MouseEvent.CLICK, handleClick, false, 0, true); // false, 0 /default values
        }
    }

    private function newButton(x:Number, y:Number, width:Number, height:Number, text:String):Sprite {
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
        return buttonSprite;
    }

    private function handleClick(e:MouseEvent):void {
        switch (e.currentTarget as Sprite) {
            case button_1:
                button_1.dispatchEvent(new Event(CLICKED_BUTTON, true));
                break;

            case button_2:
                button_2.dispatchEvent(new Event(CLICKED_BUTTON, true));
                break;

            case button_3:
                button_3.dispatchEvent(new Event(CLICKED_BUTTON, true));
                break;

            case button_clear:
                button_clear.dispatchEvent(new Event(CLICKED_BUTTON,true));
                break;

            default:
                trace("unknown button");
                break;

        }
    }
}
}
