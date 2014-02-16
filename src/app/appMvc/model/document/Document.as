/**
 * Created by cfe on 16.02.14.
 */
package app.appMvc.model.document {
public class Document {
    private var _name:String;
    private var _layers:Vector.<Layer>;
    private var _activeLayer:Layer;
    public function Document() {
    }

    public function get name():String {
        return _name;
    }
    public function set name(newName:String):void {
        _name = newName;
    }


    public function get layers():Vector.<Layer> {
        return _layers;
    }
    public function set layers(value:Vector.<Layer>):void {
        _layers = value;
    }
}
}