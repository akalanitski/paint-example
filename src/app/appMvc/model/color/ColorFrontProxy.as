package app.appMvc.model.color {

public class ColorFrontProxy extends ColorProxy{
    public static const NAME:String = "ColorFrontProxy";
    public function ColorFrontProxy() {
        proxyName = NAME;
        color.rgb = 0x000000;
        color.alpha = 1.0;
    }
}
}
