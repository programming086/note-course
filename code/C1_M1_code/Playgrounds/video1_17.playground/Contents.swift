import Foundation
import UIKit

let now1 = Date()
let ts = now1.timeIntervalSince1970
let now2 = Date(timeIntervalSince1970: ts)

let fmt = DateFormatter()
fmt.dateFormat = "yyyy-MM-dd HH:mm:ss"
let str = fmt.string(from: now1)
let now3 = fmt.date(from: str)

let nd = Calendar.current.date(byAdding: .hour, value: 1, to: now1)

let red = UIColor.red
let green = UIColor.green
let custom = UIColor(red: 34.0 / 255.0, green: 45.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)

var r: CGFloat = 0
var g: CGFloat = 0
var b: CGFloat = 0
var a: CGFloat = 0

custom.getRed(&r, green: &g, blue: &b, alpha: &a)

let jsx: [String: Any] = ["one": 1, "two": 2.0, "three": "3"]
do {
    let jsdata = try JSONSerialization.data(withJSONObject: jsx, options: [])
    let jsdict = try JSONSerialization.jsonObject(with: jsdata, options: [])
    print(jsdict)
} catch {
}

let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!

var isDir: ObjCBool = false
let dirurl = path.appendingPathComponent("caches")
if FileManager.default.fileExists(atPath: dirurl.path, isDirectory: &isDir), isDir.boolValue {
}

try? FileManager.default.createDirectory(at: dirurl, withIntermediateDirectories: true, attributes: nil)

try? FileManager.default.removeItem(at: dirurl)
