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
    public static const CLICKED_BUTTON_1:String = "clickedButton1";
    public static const CLICKED_BUTTON_2:String = "clickedButton2";
    public static const CLICKED_BUTTON_3:String = "clickedButton3";
    private var button1:Sprite;
    private var button2:Sprite;
    private var button3:Sprite;

    public function Toolbar(stage:Stage) {
        graphics.beginFill(0x444444);
        graphics.drawRect(0, 0, 300, 30);
        graphics.endFill();

        // button1
        button1 = newButton(5, 5, 40, 20, "first");
        addChild(button1);
        button1.addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);
        // button2
        button2 = newButton(50, 5, 40, 20, "second");
        addChild(button2);
        button2.addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);
        // button3
        button3 = newButton(95, 5, 40, 20, "third");
        addChild(button3);
        button3.addEventListener(MouseEvent.CLICK, handleClick, false, 0, true);

        stage.addChild(this);
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
            case button1:
                button1.dispatchEvent(new Event(CLICKED_BUTTON_1, true));
                break;

            case button2:
                button2.dispatchEvent(new Event(CLICKED_BUTTON_2, true));
                break;

            case button3:
                button3.dispatchEvent(new Event(CLICKED_BUTTON_3, true));
                break;

            default:
                trace("unknown button");
                break;

        }
    }
}
}
