import Foundation
import CoreGraphics // для структуры CGPoint

protocol Vehicle {
    var isMoving: Bool { get }
    var name: String { get set }
    func move(to pos: CGPoint) -> Bool
}

class Car : Vehicle {
    var isMoving: Bool = true
    var name: String = "basic car"
    var position: CGPoint = .zero

    func move(to pos: CGPoint) -> Bool {
        self.position = pos
        return true
    }
}

protocol Soldier {
    associatedtype Weapon
    var weapon: Weapon { get }
}

class Machinegun {}
class Trooper : Soldier {
    var weapon: Machinegun = Machinegun()
}

class SnipperRiffle {}
class Sniper : Soldier {
    typealias Weapon = SnipperRiffle

    var weapon: SnipperRiffle = SnipperRiffle()
}

extension String {
    func md5() -> String {
        // реализация md5
        return "" // реализация md5 не входит сюда, можете написать самостоятельно
    }
}

enum Planets {
    case mercury
    case venus
    case earth
    case mars
    case jupyter
    case saturn
    case neptune
    case uranus
    // no Pluto :(
}

private extension Planets {
    var diameter: Double {
        switch self {
        case .mercury: return 12432
        case .venus: return 2452
        case .earth: return 292394
        case .mars: return 2324
        case .jupyter: return 2984208428
        case .saturn: return 244245
        case .neptune: return 2342
        case .uranus: return 28488
        }
    }
}

protocol Packable {}
struct Pack<Obj: Packable> {
    //
}
extension String: Packable {}





