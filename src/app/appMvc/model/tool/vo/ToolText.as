/**
 * Created by cfe on 08.02.14.
 */
package app.appMvc.model.tool.vo {
import app.appMvc.model.tool.*;

import app.S;

import flash.events.Event;
import flash.events.MouseEvent;

public class ToolText extends Tool {
    public static const NAME:String = "ToolText";
    public function ToolText() {super(NAME);}

    private var _state:State = new StateNone();

    private function setState(e:Event):void {
        if (e.type != _state.name) {
            switch (e.type) {

                case StateNone.NAME:
                    _state = new StateNone();
                    break;

                case StateTyping.NAME:
                    _state = new StateTyping(this);
                    break;
            }
            _state.onActivate();
        }
    }

    override public function init():void {
        setState(new Event(StateNone.NAME, true));
        S.stage.addEventListener(StateNone.NAME, setState, false, 0, true);
        S.stage.addEventListener(StateTyping.NAME, setState, false, 0, true);
    }

    override public function cleanup():void {
        setState(new Event(StateNone.NAME, true));
        S.stage.removeEventListener(StateNone.NAME, setState);
        S.stage.removeEventListener(StateTyping.NAME, setState);
    }

    override protected function updateSettings():void {_state.updateSettings();}
    override protected function validateSettings():void {_state.validateSettings();}
    override protected function postMouseDown(e:MouseEvent):void {_state.postMouseDown();}
    override public function handleMouseMove(e:MouseEvent):void {_state.handleMouseMove();}
    override public function handleMouseUp(e:MouseEvent):void {_state.handleMouseUp();}
}
}

import app.S;
import app.appMvc.model.tool.vo.ToolEvent;
import app.appMvc.model.tool.vo.ToolText;

import flash.events.Event;
import flash.text.TextField;

class State {
    private var _stateName:String;
    public function get name():String {return _stateName;}
    function State(stateName:String) {this._stateName = stateName;}
    public function updateSettings():void {}
    public function validateSettings():void {}
    public function postMouseDown():void {}
    public function handleMouseMove():void {}
    public function handleMouseUp():void {}
    public function onActivate():void {}
    public function onDeactivate():void {}
}

class StateNone extends State {
    public static const NAME:String = "ToolStateNone";
    function StateNone():void {super(NAME);}
    override public function updateSettings():void {}
    override public function validateSettings():void {}
    override public function postMouseDown():void {S.stage.dispatchEvent(new Event(StateTyping.NAME, true));}
    override public function handleMouseMove():void {}
    override public function handleMouseUp():void {}
}

class StateTyping extends State {
    public static const NAME:String = "ToolStateTyping";
    function StateTyping(toolText:ToolText):void {
        super(NAME);
        this.currentTool = toolText;
    }
    private var currentTool:ToolText;

    private var _tempTf:TextField = new TextField();

    override public function onActivate():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_ACTIVE_LAYER, true));
    }
    override public function onDeactivate():void {

    }
    override public function updateSettings():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_ACTIVE_LAYER, true));
    }
    override public function validateSettings():void {
        if (!currentTool.activeLayer) {
            throw(new Error(ToolEvent.ERROR_NULL_ACTIVE_LAYER));
        }
    }
    override public function postMouseDown():void {
        trace("started Text");
        currentTool.activeLayer.addChild(_tempTf);
        currentTool.isInUse = true;
    }
    override public function handleMouseMove():void {}
    override public function handleMouseUp():void {}
}
