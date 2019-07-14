import Foundation

func sumi(lhs: Int, rhs: Int) -> Int {
    return lhs + rhs
}

func sumf(lhs: Float, rhs: Float) -> Float {
    return lhs + rhs
}

func sum<T: Numeric>(lhs: T, rhs: T) -> T {
    return lhs + rhs
}

print(sum(lhs: 1, rhs: 2)) // 3
print(sum(lhs: 1.5, rhs: 3.5)) // 5.0

protocol Packable {}
extension String: Packable {}

struct Pack<Obj: Packable> {
    private var storage: [Obj] = []

    mutating func pack(_ obj: Obj) {
        storage.append(obj)
    }

    mutating func unpack() -> Obj? {
        guard !storage.isEmpty else {
            return nil
        }

        return storage.remove(at: 0)
    }
}

var pack = Pack<String>()

pack.pack("Drill")
pack.pack("Bolt")
pack.pack("Bolt")

print(pack.unpack()) // Optional<Drill>
print(pack.unpack()) // Optional<Bolt>
print(pack.unpack()) // Optional<Bolt>
print(pack.unpack()) // nil

protocol PackingContainer {
    associatedtype Element
    mutating func pack(_ obj: Element)
    mutating func unpack() -> Element?
}

struct IntPack: PackingContainer {
    typealias Element = Int

    mutating func pack(_ obj: Int) {
        //
    }

    mutating func unpack() -> Int? {
        //
        return nil
    }
}

struct FloatPack: PackingContainer {
    // typealias Element будет выведен автоматически
    
    mutating func pack(_ obj: Float) {
        //
    }

    mutating func unpack() -> Float? {
        //
        return nil
    }
}
