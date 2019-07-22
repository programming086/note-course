import Foundation

class BaseDBOperation: AsyncOperation {
    let notebook: FileNotebook
    
    init(notebook: FileNotebook) {
        self.notebook = notebook
        super.init()
    }
}
