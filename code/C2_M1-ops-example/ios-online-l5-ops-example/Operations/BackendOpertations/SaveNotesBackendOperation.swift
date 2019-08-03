import Foundation

enum NetworkError {
    case unreachable
}

enum SaveNotesBackendResult {
    case success
    case failure(NetworkError)
}

class SaveNotesBackendOperation: BaseBackendOperation {
    var result: SaveNotesBackendResult?
    
    init(notes: [Note]) {
        log("")
        super.init()
    }
    
    override func main() {
        log("")
        result = .failure(.unreachable)
        finish()
    }
}
