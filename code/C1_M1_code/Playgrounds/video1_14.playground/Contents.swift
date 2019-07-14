import Foundation

let arr1 = [1, 2, 3, 4]
let res1 = arr1.map { $0 + 1 }

let arr2 = [[1, 2], [3, 4]]
let flat2 = arr2.flatMap { $0 }

let arr3 = [1, 2, nil, 3, nil, 4, nil, 5]
let res3 = arr3.compactMap { $0 }

let arr4 = [1, 2, 3, 4]
let sum4 = arr4.reduce(into: 0) { (res, val) in
    res += val
}

let arr5 = [1, 2, 3, 4]
let dict5 = arr5.reduce(into: [:]) { (res, val) in
    res[val] = "\(val)"
}

let res5 = arr5.filter { $0 > 2 }

let index = arr5.index(of: 3)

let element = arr5.first { $0 > 2 }

arr5.forEach { val in
    print(val)
}
