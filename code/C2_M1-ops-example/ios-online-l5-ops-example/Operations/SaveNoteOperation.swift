import Foundation

class SaveNoteOperation: AsyncOperation {
    private let saveToDb: SaveNoteDBOperation
    private let dbQueue: OperationQueue
    
    private(set) var result: Bool = false
    
    init(note: Note,
         notebook: FileNotebook,
         backendQueue: OperationQueue,
         dbQueue: OperationQueue) {
        
        log("")

        saveToDb = SaveNoteDBOperation(note: note, notebook: notebook)
        self.dbQueue = dbQueue

        super.init()
        
        saveToDb.completionBlock = {
            log("")

            let saveToBackend = SaveNotesBackendOperation(notes: notebook.notes)
            saveToBackend.completionBlock = {
                log("")

                switch saveToBackend.result! {
                case .success:
                    self.result = true
                case .failure:
                    self.result = false
                }
                self.finish()
            }
            backendQueue.addOperation(saveToBackend)
        }
    }
    
    override func main() {
        log("")

        dbQueue.addOperation(saveToDb)
    }
}
