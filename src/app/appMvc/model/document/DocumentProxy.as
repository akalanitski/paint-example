package app.appMvc.model.document {
import app.appMvc.model.document.vo.Document;

import org.puremvc.as3.patterns.proxy.Proxy;

public class DocumentProxy extends Proxy {
    public static const NAME:String = "DocumentProxy";
    public var documents:Vector.<Document> = new <Document>[new Document()];
    public function DocumentProxy() {super(NAME);}
}
}
