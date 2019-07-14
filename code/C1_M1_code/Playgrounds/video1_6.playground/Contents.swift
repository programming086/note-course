import Foundation

// Дано для иллюстрации
struct Location {
    let lat: Double
    let lon: Double
}

// Дано для иллюстрации, не пытайтесь понять смысл :)
class Press {
    static func crash(_ obj: Any) {
        // разделить на ноль !
    }
}

class Car {
    let mark: String
    let model: String
    public var mileage: Int
    static let steelType: Int = 25
    class var productionAmount: Int {
        return 100500
    }
    private var owner: String = "Pupkin"
    private(set) var guardian: String = "Sentinel"
    fileprivate var uid: String = UUID().uuidString

    var buyDate: Date = Date()
    var buyTimestamp: TimeInterval {
        set { buyDate = Date(timeIntervalSince1970: newValue) }
        get { return buyDate.timeIntervalSince1970 }
    }

    var sellDate: Date = Date()
    var ownTime: TimeInterval {
        return sellDate.timeIntervalSince(buyDate)
    }

    func drive(to: Location) -> Bool {
        guard abs(to.lat) > 0 && abs(to.lon) > 0 else {
            return false
        }

        // едем в to

        return true
    }

    static func search(model: String) -> Car {
        if model == "Tuzik" {
            return Car(mark: "Bobik Motors", model: model)
        }

        return Car()
    }

    init(mark: String, model: String, mileage: Int = 0) {
        self.mark = mark
        self.model = model
        self.mileage = mileage
        // super.init() // эта конструкция нужна, если у вас есть суперкласс, для корневых классов не надо
    }

    convenience init() {
        self.init(mark: "Bobik Motors", model: "Tuzik")
    }

    deinit {
        Press.crash(self) // =]
    }
}

let car: Car = Car()
print(car.model)
car.mileage += 1

