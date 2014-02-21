/**
 * Created by cfe on 20.02.14.
 */
package app.appMvc.view.mainWindow {
import app.S;
import app.appMvc.model.document.Document;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

// displays document contents on checker pattern with border, on top of one colored background
// sends events for using tool on mouse clicks.
public class MainWindow extends Sprite {
    private var _docBack:Sprite = new Sprite();
    private var _shiftDocX:int = 0;
    private var _shiftDocY:int = 0;
    private var _document:Document = null;
    function MainWindow(doc:Document) {
        addChildAt(_docBack, 0);
        updateWindowBack();
        setDocument(doc);
    }

    public function addListeners():void {
        S.stage.addEventListener(Event.RESIZE, handleResize, false, 0, true);

        S.stage.addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown, false, 0, true);
        S.stage.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp, false, 0, true);
        S.stage.addEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove, false, 0, true);
    }
    public function removeListeners():void {
        S.stage.removeEventListener(Event.RESIZE, handleResize);

        S.stage.removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
        S.stage.removeEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
        S.stage.removeEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
    }
    private function handleMouseDown(e:MouseEvent):void {
        // TODO: additionally send localDocX, localDocY
        S.stage.dispatchEvent(new MainWindowEvent(MainWindowEvent.MOUSE_DOWN, e, true));
    }
    private function handleMouseMove(e:MouseEvent):void {
        S.stage.dispatchEvent(new MainWindowEvent(MainWindowEvent.MOUSE_MOVE, e, true));
    }
    private function handleMouseUp(e:MouseEvent):void {
        S.stage.dispatchEvent(new MainWindowEvent(MainWindowEvent.MOUSE_UP, e, true))
    }
    private function handleResize(e:Event):void {
        updateWindowBack();
        updateDocumentBack();
    }

    public function setDocument(doc:Document):void {
        if (_document != doc) {
            if (_document) {
                _docBack.removeChild(_document);
            }
            if (doc) {
                _docBack.addChild(doc);
            }
            _document = doc;
            updateDocumentBack();
        }
    }

    public function updateWindowBack(backColor:uint = 0x777777):void {
        graphics.clear();
        graphics.beginFill(backColor);
        graphics.drawRect(0, 0, S.stage.stageWidth, S.stage.stageHeight);
        graphics.endFill();
    }

    public function updateDocumentBack(documentBorderColor:uint = 0x022222):void {
        if (!_document) {
            _docBack.graphics.clear();
            return;
        }
        _docBack.graphics.clear();
        _docBack.graphics.beginFill(documentBorderColor);
        _docBack.graphics.drawRect(-1, -1, _document.docWidth + 2, _document.docHeight + 2);
        _docBack.graphics.beginFill(0xFFFFFF);
        _docBack.graphics.drawRect(0, 0, _document.docWidth, _document.docHeight);
        _docBack.graphics.endFill();

        _docBack.x = Math.round(S.stage.stageWidth / 2.0 - _docBack.width / 2.0 + _shiftDocX);
        _docBack.y = Math.round(S.stage.stageHeight / 2.0 - _docBack.height / 2.0 + _shiftDocY);
    }

    public function get shiftDocX():int {return _shiftDocX;}
    public function set shiftDocX(value:int):void {_shiftDocX = value;}
    public function get shiftDocY():int {return _shiftDocY;}
    public function set shiftDocY(value:int):void {_shiftDocY = value;}
}
}