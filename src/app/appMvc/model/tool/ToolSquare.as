/**
 * Created by cfe on 08.02.14.
 */
package app.appMvc.model.tool {

import flash.display.Graphics;
import flash.events.MouseEvent;

public class ToolSquare extends Tool {
    public static const NAME:String = "ToolSquare";
    public function ToolSquare() {
        super(NAME);
    }

    private const StateNone:String = "none";
    private const StateClicked:String = "clicked";
    private var _state:String;
    private function set state(newState:String):void {
        _state = newState;
    }

    override public function handleMouseDown(e:MouseEvent):void {
        trace("SquareDown");
        _isInUse = true;
    }

    override public function handleMouseUp(e:MouseEvent) :void{
        trace("SquareUp");
        _isInUse = false;
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (_isInUse){
            trace("SquareMove");
        }
    }
}
}
