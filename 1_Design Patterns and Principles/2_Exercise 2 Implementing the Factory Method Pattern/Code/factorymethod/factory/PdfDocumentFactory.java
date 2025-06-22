package factorymethod.factory;

import factorymethod.document.Document;
import factorymethod.document.PdfDocument;

public class PdfDocumentFactory extends DocumentFactory {
    public Document createDocument() {
        return new PdfDocument();
    }
}
