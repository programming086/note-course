import Foundation

let notebook = FileNotebook()
let backendQueue = OperationQueue()
let dbQueue = OperationQueue()
let commonQueue = OperationQueue()

let newNote = Note(uid: "1", title: "Hello", content: "World")

let saveNoteOperation = SaveNoteOperation(
    note: newNote,
    notebook: notebook,
    backendQueue: backendQueue,
    dbQueue: dbQueue
)
commonQueue.addOperation(saveNoteOperation)

let updateUI = BlockOperation {
    print(saveNoteOperation.result)
    print(notebook.notes)
}
OperationQueue.main.addOperation(updateUI)

while RunLoop.current.run(mode: .default, before: .distantFuture) {}
