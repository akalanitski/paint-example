package app.appMvc.model.tool {
import app.S;
import app.appMvc.Notes;
import app.appMvc.model.document.vo.Layer;
import app.appMvc.model.tool.vo.Tool;
import app.appMvc.model.tool.vo.ToolEllipse;
import app.appMvc.model.tool.vo.ToolEraser;
import app.appMvc.model.tool.vo.ToolEvent;
import app.appMvc.model.tool.vo.ToolHand;
import app.appMvc.model.tool.vo.ToolLine;
import app.appMvc.model.tool.vo.ToolNone;
import app.appMvc.model.tool.vo.ToolPencil;
import app.appMvc.model.tool.vo.ToolRectangle;
import app.appMvc.model.tool.vo.ToolStencilBrush;
import app.appMvc.model.tool.vo.ToolText;
import app.appMvc.view.mainWindow.MainWindowProxy;

import flash.events.MouseEvent;

import org.puremvc.as3.patterns.proxy.Proxy;

public class ToolProxy extends Proxy {
    public static const NAME:String = "ToolProxy";
    public function ToolProxy() {
        super(NAME, new ToolNone());
        setCurrentTool(ToolPencil.NAME);
    }
    public function set activeLayer(layer:Layer):void {_currentTool.activeLayer = layer;}
    public function get currentToolName():String {return _currentTool.name;}
    public function set docOx(value:Number):void{_currentTool.docOx = value;}
    public function set docOy(value:Number):void{_currentTool.docOy = value;}
    public function set relX(relX:Number):void {_currentTool.relX = relX;}
    public function set relY(relY:Number):void {_currentTool.relY = relY;}
    private function get _currentTool():Tool {return data as Tool;}

    override public function onRegister():void {
        S.stage.addEventListener(ToolEvent.UPDATE_DOC_ORIGIN_COORDINATES, handleChangeDocOxy, false, 0, true);
    }

    override public function onRemove():void {
        S.stage.removeEventListener(ToolEvent.UPDATE_DOC_ORIGIN_COORDINATES, handleChangeDocOxy);
    }
    private function handleChangeDocOxy(e:ToolEvent):void {
        var mainWindowProxy:MainWindowProxy = facade.retrieveProxy(MainWindowProxy.NAME) as MainWindowProxy;
        mainWindowProxy.docOx = _currentTool.docOx;
        mainWindowProxy.docOy = _currentTool.docOy;
    }

    public function handleMouseDown(e:MouseEvent):void {
        _currentTool.handleMouseDown(e);
    }
    public function handleMouseMove(e:MouseEvent):void {
        _currentTool.handleMouseMove(e);
    }
    public function handleMouseUp(e:MouseEvent):void {
        _currentTool.handleMouseUp(e);
    }
    public function setCurrentTool(toolName:String):void {
        if (_currentTool.name == toolName || _currentTool.isInUse) {
            return;
        }
        _currentTool.cleanupTool();
        switch (toolName) {
            case ToolHand.NAME:
                data = new ToolHand();
                break;
            case ToolPencil.NAME:
                data = new ToolPencil();
                break;
            case ToolStencilBrush.NAME:
                data = new ToolStencilBrush();
                break;
            case ToolRectangle.NAME:
                data = new ToolRectangle();
                break;
            case ToolLine.NAME:
                data = new ToolLine();
                break;
            case ToolEraser.NAME:
                data = new ToolEraser();
                break;
            case ToolEllipse.NAME:
                data = new ToolEllipse();
                break;
            case ToolText.NAME:
                data = new ToolText();
                break;
            default:
                trace("no such tool.");
                break;
        }
        _currentTool.initTool();
        sendNotification(Notes.CURRENT_TOOL_CHANGED,currentToolName);
    }
}
}
