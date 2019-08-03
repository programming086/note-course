import Foundation

#if DEBUG
func log(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
    let fileString = NSString(string: file)
    let string = ">> \(fileString.lastPathComponent):\(line) \(function) \(message)"
    print(string)
}

#else
func log(_ string: String, file: String = #file, function: String = #function, line: Int = #line) {}
#endif


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
    log("")
    print(saveNoteOperation.result)
    print(notebook.notes)
}

updateUI.addDependency(saveNoteOperation)

OperationQueue.main.addOperation(updateUI)

while RunLoop.current.run(mode: .default, before: .distantFuture) {}
