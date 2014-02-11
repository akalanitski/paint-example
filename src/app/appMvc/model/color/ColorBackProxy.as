package app.appMvc.model.color {

public class ColorBackProxy extends ColorProxy{
    public static const NAME:String = "ColorBackProxy";
    public function ColorBackProxy() {
        proxyName = NAME;
        color.rgb = 0xFFFFFF;
        color.alpha = 1.0;
    }
}
}
