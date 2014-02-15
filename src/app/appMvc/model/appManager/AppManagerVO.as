/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 10.01.14
 * Time: 15:50
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.appManager {
import app.appMvc.model.tool.Tool;
import app.appMvc.model.tool.ToolPencil;
import app.appMvc.model.tool.ToolSquare;
import app.appMvc.model.tool.ToolStencilBrush;

import flash.display.Sprite;
import flash.display.Stage;
import flash.events.MouseEvent;
import flash.geom.Rectangle;

public class AppManagerVO {

    private var _currentTool:Tool;
    private var _layer:Sprite = new Sprite();
    private var blockToolChange:Boolean = false;
    private var _fileLoader:FileLoader;
    public function get fileLoader():FileLoader {
        return _fileLoader;
    }

    public function AppManagerVO(stage:Stage) {

        _layer.graphics.lineStyle(1, 0);
        _layer.graphics.endFill();
        _layer.graphics.drawRect(0, 0, 550 - 1, 400 - 1);

        _layer.scrollRect = new Rectangle(0, 0, 550, 400);

        stage.addChild(_layer);
        _currentTool = new ToolPencil(_layer.graphics);
        _fileLoader = new FileLoader(_layer);
    }

    public function addListeners():void {
        _layer.stage.addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
        _layer.stage.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
        _layer.stage.addEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
    }

    public function removeListeners():void {
        _layer.stage.removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
        _layer.stage.removeEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
        _layer.stage.removeEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
    }

    public function handleMouseMove(e:MouseEvent):void {

        _currentTool.handleMouseMove(e);
    }

    public function handleMouseDown(e:MouseEvent):void {
        blockToolChange = true;
        _currentTool.handleMouseDown(e);//initTool(e);
//        _layer.graphics.moveTo(e.stageX, e.stageY);
        trace("mouseDown");
    }

    public function setTool(toolName:String):void {
        if (toolName != _currentTool.getName() && !blockToolChange)
            switch (toolName) {
                case ToolPencil.NAME:
                    _currentTool = new ToolPencil(_layer.graphics);
                    trace(_currentTool.getName());
                    break;
                case ToolStencilBrush.NAME:
                    _currentTool = new ToolStencilBrush(_layer.graphics);
                    trace(_currentTool.getName());
                    break;
                case ToolSquare.NAME:
                    _currentTool = new ToolSquare(_layer.graphics);
                    break;
            }
    }

    public function handleMouseUp(e:MouseEvent):void {
        blockToolChange = false;
        _currentTool.handleMouseUp(e);
        trace("mouseUp");
    }


    public function clearCanvas():void {
        _layer.graphics.clear();
    }
}
}