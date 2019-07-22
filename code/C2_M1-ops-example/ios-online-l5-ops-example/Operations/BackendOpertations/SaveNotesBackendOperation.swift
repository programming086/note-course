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
        super.init()
    }
    
    override func main() {
        result = .failure(.unreachable)
        finish()
    }
}
