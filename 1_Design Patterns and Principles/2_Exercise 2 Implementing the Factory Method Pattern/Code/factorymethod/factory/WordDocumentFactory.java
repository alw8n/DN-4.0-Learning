package factorymethod.factory;

import factorymethod.document.Document;
import factorymethod.document.WordDocument;

public class WordDocumentFactory extends DocumentFactory {
    public Document createDocument() {
        return new WordDocument();
    }
}
