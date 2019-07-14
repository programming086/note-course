import Foundation
import UIKit

print("Hello, World")
print("Hello") ; print("World")

let a1 = 10

var b1 = UIView()
b1 = UIView()

let a2: Int = 10
var b2: UIView = UIView()

var something = true
if something {
    // делаем что-нибудь
} else {
    // делаем что-то другое
}

var something2 = false
if something {
    // делаем что-нибудь
} else if something2 {
    // делаем что-нибудь не то
} else {
    // делаем что-то другое
}

for i in 0..<10 {
    print("i: ", i)
}

for i in 0...10 {
    print("i: ", i)
}


var i1 = 0
while i1 < 10 {
    print("i1: ", i1)
    i1 += 1 // в Swift нет конструкции i1++
}

var a3 = 1
// нет a3++
a3 += 1

var i2 = 0
repeat {
    print("i2: ", i2)
    i2 += 1
} while i2 < 10

var array = [1, 2, 3, 4, 10, 100]
for item in array {
    print("item: ", item)
}

// Эта конструкция будет рассматриваться дальше, тут дано лишь для примера и для иллюстрации материала из лекции
enum Errors: Error {
    case anyError
}
func doSomething() throws {
    throw Errors.anyError
}
do {
    try doSomething()
} catch {
    print("e: \(error)") // тут конструкция \() подставляет значение переменной в строку, известная как "строковоая интерполяция"
}




