import Foundation

class SaveNoteDBOperation: BaseDBOperation {
    private let note: Note
    
    init(note: Note,
         notebook: FileNotebook) {
        log("")
        self.note = note
        super.init(notebook: notebook)
    }
    
    override func main() {
        log("")
        notebook.add(note: note)
        finish()
    }
}
