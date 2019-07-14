import Foundation

let sayHello = {
    print("Hello")
}

sayHello()

let greetings1 = { (_ name: String) in
    print("Hello, \(name)")
}

greetings1("Me")

let greetings2: (String) -> Void = { name in
    print("Hello, \(name)")
}

greetings2("Me")

let rndUUID = { () -> String in
    return UUID().uuidString
}

class Printer {
    func print(_ p: String) {
        print(p)
    }
}

var printer = Printer()
let greetings3 = {
    printer.print("Hello")
}

let greetings4 = { [printer] in
    printer.print("Hello")
}

let greetings5 = { [weak printer] in
    printer?.print("Hello")
}

let greetings6 = { [unowned printer] in
    printer.print("Hello")
}
