/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 11:25
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.applicationSettings {
import app.appMvc.Notes;
import app.appMvc.model.document.Document;
import app.appMvc.model.document.DocumentProxy;
import app.appMvc.model.document.Layer;

import org.puremvc.as3.patterns.proxy.Proxy;

public class ApplicationSettingsProxy extends Proxy {
    public static const NAME:String = "ApplicationSettingsProxy";
    public function ApplicationSettingsProxy() {
        super(NAME, new ApplicationSettingsVO());
        var documentProxy:DocumentProxy = facade.retrieveProxy(DocumentProxy.NAME) as DocumentProxy;
        setActiveDocument(documentProxy.documents[0]);
        setActiveLayer(documentProxy.documents[0].layers[0]);
    }

    private function get _settings():ApplicationSettingsVO {return data as ApplicationSettingsVO;}

    public function setActiveDocument(doc:Document):void {
        if (doc != _settings.activeDocument) {
            _settings.activeDocument = doc;
            sendNotification(Notes.ACTIVE_DOCUMENT_CHANGED, _settings.activeDocument);
        }
    }
    public function getActiveDocument():Document {
        return _settings.activeDocument;
    }

    public function setActiveLayer(layer:Layer):void {
        if (layer != _settings.activeLayer) {
            _settings.activeLayer = layer;
            sendNotification(Notes.ACTIVE_LAYER_CHANGED, _settings.activeLayer)
        }
    }
    public function getActiveLayer():Layer {
        return _settings.activeLayer;
    }

    public function getFrontColor():uint {
        return _settings.frontColor;
    }
    public function setFrontColor(rgb:uint):void {
        if (rgb != _settings.frontColor) {
            _settings.frontColor = rgb;
            sendNotification(Notes.FRONT_COLOR_CHANGED, _settings.frontColor)
        }
    }

    public function getBackColor():uint {
        return _settings.backColor;
    }
    public function setBackColor(rgb:uint):void {
        if (rgb != _settings.backColor) {
            _settings.backColor = rgb;
            sendNotification(Notes.FRONT_COLOR_CHANGED, _settings.backColor)
        }
    }

    public function swapFrontBackColors():void {
        if (_settings.backColor != _settings.frontColor) {
            _settings.swapFrontBackColors();
            sendNotification(Notes.FRONT_COLOR_CHANGED, _settings.frontColor);
            sendNotification(Notes.BACK_COLOR_CHANGED, _settings.backColor);
        }
    }

}
}
