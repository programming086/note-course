import Foundation

enum Planets {
    case mercury
    case venus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
    // NOTE: sadly, but no Pluto

    var isInnerSolarSystem: Bool {
        switch self {
        case .mercury, .venus, .earth, .mars: return true
        default: return false
        }
    }

    func distance(to other: Planets) -> Double {
        return Double(arc4random())
    }
}

let p1: Planets = .jupiter

enum Planets_typed: Int {
    case mercury = 1
    case venus = 2
    case earth = 3
    case mars = 4
    case jupiter = 5
    case saturn = 6
    case uranus = 7
    case neptune = 8
}

print(Planets_typed.mercury.rawValue)

enum Result {
    case success(data: Data, headers: [String: Any])
    case failure(error: Error)

    var rawValue: String {
        switch self {
        case .success: return "success"
        case .failure: return "failure"
        }
    }
}

print(Planets.earth.isInnerSolarSystem)
print(Planets.mars.distance(to: .jupiter))

let res1: Result = .success(data: Data(), headers: [:])
switch res1 {
case let .success(data, headers): print(data, " ", headers)
case let .failure(error): print(error)
}

enum Errors: Error {
    case anyError
}

let res2: Result = .failure(error: Errors.anyError)
switch res2 {
case let .success(data, headers): print(data, " ", headers)
case let .failure(error): print(error)
}
