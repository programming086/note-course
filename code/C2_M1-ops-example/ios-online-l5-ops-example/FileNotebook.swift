import Foundation

class FileNotebook {
    private(set) var notes = [Note]()
    
    func add(note: Note) {
        if let index = notes.firstIndex(where: { $0.uid == note.uid }) {
            notes[index] = note
        } else {
            notes.append(note)
        }
    }
}
