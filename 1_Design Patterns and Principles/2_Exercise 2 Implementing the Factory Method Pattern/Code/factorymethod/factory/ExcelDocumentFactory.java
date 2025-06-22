package factorymethod.factory;

import factorymethod.document.Document;
import factorymethod.document.ExcelDocument;

public class ExcelDocumentFactory extends DocumentFactory {
    public Document createDocument() {
        return new ExcelDocument();
    }
}
