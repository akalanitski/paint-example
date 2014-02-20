/**
 * Created by cfe on 20.02.14.
 */
package app.appMvc.view.mainWindow {
import app.S;
import app.appMvc.model.document.Document;

import flash.display.Sprite;
import flash.events.Event;

public class MainWindow extends Sprite {
    private var _docBack:Sprite = new Sprite();
    private var _shiftDocX:int = 0;
    private var _shiftDocY:int = 0;
    private var _document:Document = null;
    function MainWindow(doc:Document) {
        addChildAt(_docBack, 0);
        setDocument(doc);
        updateWindowBack();
        addListeners();
    }

    public function addListeners():void {
        S.stage.addEventListener(Event.RESIZE, handleResize, false, 0, true);
    }
    public function removeListeners():void {
        S.stage.removeEventListener(Event.RESIZE, handleResize);
    }
    private function handleResize(e:Event):void {
        updateWindowBack();
        updateDocumentBack();
    }

    public function setDocument(doc:Document):void {
        if (_document != doc) {
            if (_document) {
                removeChild(_document);
            }
            if (doc) {
                addChildAt(doc, 1);
            }
            _document = doc;
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

        _docBack.x = S.stage.stageWidth / 2.0 - _docBack.width / 2.0 + _shiftDocX;
        _docBack.y = S.stage.stageHeight / 2.0 - _docBack.height / 2.0 + _shiftDocY;
    }

    public function get shiftDocX():int {return _shiftDocX;}
    public function set shiftDocX(value:int):void {_shiftDocX = value;}
    public function get shiftDocY():int {return _shiftDocY;}
    public function set shiftDocY(value:int):void {_shiftDocY = value;}
}
}