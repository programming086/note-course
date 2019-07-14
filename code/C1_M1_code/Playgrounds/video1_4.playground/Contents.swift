import Foundation

func foo1() {
    // не делаем ничего :(
}

func foo2() -> Int {
    return 1
}
print(foo2())

func say1(p: String) {
    print(p)
}
say1(p: "Hello, World")

func say2(phrase p: String) {
    print(p)
}
say2(phrase: "Hello, World")

func say3(_ p: String) {
    print(p)
}
say3("Hello, World")

func sum(lhs: Int, rhs: Int) -> Int {
    return lhs + rhs
}
print(sum(lhs: 1, rhs: 1))

func sub(lhs: Int = 0, rhs: Int = 0) -> Int {
    return lhs - rhs
}
print(sub())
print(sub(lhs: 1))
print(sub(rhs: 1))
print(sub(lhs: 1, rhs: 1))

func two(a: Int) -> String? { // тут String? со знаком вопроса это правильно, это Optional которые будут рассмотрены позднее
    guard a == 2 else {
        return nil
    }
    return "two"
}

// Этот класс тут для того, чтобы код собирался, классы будут рассмотрены позднее
class Door {
    func open() {
        //
    }

    func close() {
        //
    }
}

func openTheDoor_bad(condition1: Bool, condition2: Bool) {
    let door = Door()
    door.open()

    if condition1 {
        door.close()
        return
    }

    // тут много разного кода

    if condition2 {
        // тут забыли сделать door.close()
        return
    }

    // тут много разного кода

    door.close()
}

func openTheDoor_good(condition1: Bool, condition2: Bool) {
    let door = Door()
    door.open()
    defer { door.close() }

    if condition1 {
        // тут не надо door.close()
        return
    }

    // тут много разного кода

    if condition2 {
        // тут не надо door.close()
        return
    }

    // тут много разного кода

    // тут не надо door.close()
}

// Перечисления (enum) будут детально рассмотрены позднее
enum OurErrors: Error {
    case somethingBadHappened
}
func doSomething() throws -> Void {
    throw OurErrors.somethingBadHappened
}

