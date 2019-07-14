import Foundation

let array1 = [1, 2, 3, 4]
let array2 = [Int]()
let array3 = Array<Int>()

let array4: [Int] = [1, 2, 3, 4]
let array5: [Int] = [Int]()

print(array1[0])

var arraym = [1, 2, 3]
arraym.append(1)
arraym.insert(2, at: 3)
arraym.remove(at: 2)
arraym.removeAll()

for element in array4 {
    print(element)
}

for (index, element) in arraym.enumerated() {
    print(index, " => ", element)
}

let dict1 = [1: "One", 2: "Two"]
let dict2 = [Int: String]()
let dict3 = Dictionary<Int, String>()

let dict4: [Int: String] = [1: "One", 2: "Two"]
let dict5: [Int: String] = [Int: String]()

print(dict1[1])

var dictm = [1: "One", 2: "Two"]
dictm[3] = "Three"
dictm[3] = nil

for (key, value) in dictm {
    print(key, " => ", value)
}
