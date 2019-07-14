import Foundation
import UIKit

var thing: String = "Hello"

var maybeThing: String? = nil
maybeThing = "Hello"

var view1 = UIView()
print(view1.frame)

var view2: UIView?
var view3: Optional<UIView>

var frame2 = view2?.frame
var frame3 = view3?.frame

// var frame2fo = view2!.frame // раскомментируйте чтобы увидеть крэш
// var frame3fo = view3!.frame // раскомментируйте чтобы увидеть крэш

var view4: UIView? = nil
var view5: UIView? = UIView()

var f4 = view4?.frame // nil
var f5 = view5?.frame // Optional<frame>

// var f4fo = view4!.frame // раскомментируйте чтобы увидеть крэш
var f5fo = view5!.frame // frame

if let view = view2 {
    print("view: ", view)
}

if let v4 = view4 {
    print("v4: ", v4)
} else {
    print("no v4")
}
if let v5 = view5 {
    print("v5: ", v5)
} else {
    print("no v5")
}

func wrap() {
    guard let v = view4 else {
        print("We are in guard else clause")
        return
    }
    print("v: ", v)
}
wrap()

enum Errors: Error {
    case noView
}

func getFrame(_ view: UIView?) throws -> CGRect {
    guard let v = view else {
        throw Errors.noView
    }
    return v.frame
}

do {
    try print("v4 frame: ", getFrame(view4))
} catch {
    print("v4 no frame")
}

do {
    try print("v5 frame: ", getFrame(view5))
} catch {
    print("v5 no frame")
}

func getFrame_bad(_ view: UIView?) throws -> CGRect {
    if let v = view {
        return v.frame
    } else {
        throw Errors.noView
    }
}
