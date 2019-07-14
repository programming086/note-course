import Foundation

let a = 1
switch a {
case 1: print("1")
case 2: fallthrough
case 3: print("More than one")
default: break
}

let ab: Bool = true
let bb: Bool = false

switch (ab, bb) {
case (false, false): print("0")
case (false, true): print("1")
case (true, false): print("2")
case (true, true): print("3")
}

let p: String? = "Hello, World"

switch p {
case _?: print("Value!")
case nil: print("No Value!")
}

switch p {
case .some: print("Value!")
case .none: print("No Value!")
}

let val = (15, "example", 3.14)
switch val {
case (_, _, let pi): print("pi: \(pi)")
}

switch (4, 5) {
case let (x, y): print("We are at \(x) \(y)")
}

let age = 13
let job: String? = "Worker"
let userInfo: AnyObject = NSDictionary()

switch (age, job, userInfo) {
case (let age, _?, _ as NSDictionary): print("OK, age: ", age)
default: break
}

enum Entities {
    case soldier(x: Int, y: Int)
    case player(x: Int, y: Int)
    case tank(x: Int, y: Int)
}

let entities: [Entities] = [
    .tank(x: 1, y: 1),
    .player(x: 2, y: 3)
]

for e in entities {
    switch e {
    case let .soldier(x, y): print("S at \(x) \(y)")
    case .player(let x, let y): print("P at \(x) \(y)")
    default: break
    }
}

let ax: Any = 5

switch ax {
case is Int: print("Hurray, Int!")
default: break
}

switch ax {
case let n as Int: print("Int: \(n)")
default: break
}

switch 5 {
case 0...10: print("0-10")
default: break
}

struct Soldier {
    let hp: Int
    let x: Int
    let y: Int
}

func ~= (pattern: Int, value: Soldier) -> Bool {
    return pattern == value.hp
}

let soldier = Soldier(hp: 0, x: 0, y: 0)
switch soldier {
case 0: print("Dead soldier")
default: break
}

func fibonacci(_ i: Int) -> Int {
    switch(i) {
    case let n where n <= 0: return 0
    case 0, 1: return 1
    case let n: return fibonacci(n - 1) + fibonacci(n - 2)
    }
}
print(fibonacci(10))
