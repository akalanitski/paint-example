/**
 * Created by cfe on 08.02.14.
 */
package app.appMvc.model.tool {

import flash.display.Graphics;
import flash.events.MouseEvent;

public class ToolSquare extends Tool {
    public static const NAME:String = "ToolSquare";

    override public function getName():String {
        return NAME;
    }

    public function ToolSquare(graphics:Graphics) {
        super(graphics);
    }


    private const StateNone:String = "none";
    private const StateClicked:String = "clicked";
    private var _state:String;
    private function set state(newState:String):void {
        _state = newState;
    }

    private var isDrawing:Boolean = false;
    override public function handleMouseDown(e:MouseEvent):void {
        trace("SquareDown");
        isDrawing = true;
    }

    override public function handleMouseUp(e:MouseEvent) :void{
        trace("SquareUp");
        isDrawing = false;
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (isDrawing){
            trace("SquareMove");
        }
    }
}
}
