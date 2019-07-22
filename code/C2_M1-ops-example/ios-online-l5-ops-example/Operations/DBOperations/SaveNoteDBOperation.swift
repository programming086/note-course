import Foundation

class SaveNoteDBOperation: BaseDBOperation {
    private let note: Note
    
    init(note: Note,
         notebook: FileNotebook) {
        self.note = note
        super.init(notebook: notebook)
    }
    
    override func main() {
        notebook.add(note: note)
        finish()
    }
}
