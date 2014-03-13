/**
 * Created by cfe on 11.02.14.
 */
package app.appMvc.view.toolbar.vc {

import app.appMvc.model.tool.vo.ToolEllipse;
import app.appMvc.model.tool.vo.ToolEraser;
import app.appMvc.model.tool.vo.ToolHand;
import app.appMvc.model.tool.vo.ToolLine;
import app.appMvc.model.tool.vo.ToolPencil;
import app.appMvc.model.tool.vo.ToolRectangle;
import app.appMvc.model.tool.vo.ToolStencilBrush;
import app.appMvc.model.tool.vo.ToolText;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;

public class Toolbar extends Sprite {

    public static const CLICKED_BUTTON:String = "Clicked_Button";

    public var buttons:Vector.<Sprite> = new <Sprite>[];

    private var _selectedTool:String;
    public static const BUTTON_CLEAR:String = "BUTTON_CLEAR";

    public function get selectedTool():String {
        return _selectedTool;
    }

    public function Toolbar() {
        //draws toolbar's background
        graphics.beginFill(0x444444);
        graphics.drawRect(0, 0, 410, 30);
        graphics.endFill();

        addButtons();
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
            buttons[i].removeEventListener(MouseEvent.CLICK, handleButtonClick);
        }
    }
    private function addButton(x:Number, y:Number, width:Number, height:Number, text:String, name:String):void {
        var buttonSprite:Sprite = new Sprite();

        buttonSprite.x = x;
        buttonSprite.y = y;

        buttonSprite.graphics.beginFill(0x999999);
        buttonSprite.graphics.drawRect(0, 0, width, height);
        buttonSprite.graphics.endFill();

        buttonSprite.buttonMode = true;
        buttonSprite.useHandCursor = true;
        buttonSprite.mouseChildren = false;

        buttonSprite.name = name;

        var tf:TextField = new TextField();
        tf.defaultTextFormat = new TextFormat("Arial", 11, 0x000000, "bold");
        tf.selectable = false;
        tf.text = text;
        tf.height = 24;
        buttonSprite.addChild(tf);

        addChild(buttonSprite);
        buttonSprite.addEventListener(MouseEvent.CLICK, handleButtonClick, false, 1, true);
        buttons.push(buttonSprite);
    }

    private function handleButtonClick(e:MouseEvent):void {
        var clickedButton:Sprite = e.currentTarget as Sprite;
        clickedButton.dispatchEvent(new Event(CLICKED_BUTTON, true, true));
    }

    private function addButtons():void{
        const xInitPos:int = 5;
        const yInitPos:int = 5;
        var xPos:int = xInitPos;
        var yPos:int = yInitPos;
        const xGap:int = 4;
        var buttonWidth:int = 40;
        var buttonHeight:int = 20;

        addButton(xPos, yPos, buttonWidth, buttonHeight, "Pencil", ToolPencil.NAME);
        xPos += xGap + buttonWidth;
        addButton(xPos, yPos, buttonWidth, buttonHeight, "Brush", ToolStencilBrush.NAME);
        xPos += xGap + buttonWidth;
        addButton(xPos, yPos, buttonWidth, buttonHeight, "Rectangle", ToolRectangle.NAME);
        xPos += xGap + buttonWidth;
        addButton(xPos, yPos, buttonWidth, buttonHeight, "Hand", ToolHand.NAME);
        xPos += xGap + buttonWidth;
        addButton(xPos, yPos, buttonWidth, buttonHeight, "Line", ToolLine.NAME);
        xPos += xGap + buttonWidth;
        addButton(xPos, yPos, buttonWidth, buttonHeight, "Ellipse", ToolEllipse.NAME);
        xPos += xGap + buttonWidth;
        addButton(xPos, yPos, buttonWidth, buttonHeight, "Text", ToolText.NAME);
        xPos += xGap + buttonWidth;
        addButton(xPos, yPos, buttonWidth, buttonHeight, "Eraser", ToolEraser.NAME);
        xPos += xGap + buttonWidth;
        addButton(xPos, yPos, buttonWidth, buttonHeight, "Clear", BUTTON_CLEAR);
    }

}
}
