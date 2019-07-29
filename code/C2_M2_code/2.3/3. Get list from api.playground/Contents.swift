//: Playground - noun: a place where people can play

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct SpaceInfo: Decodable {
    let message: String
    let number: Int
    let astronauts: [Astronaut] // тип данных 'Astronaut' должен также соотвествовать протоколу Decodable

    private enum CodingKeys: String, CodingKey { // задает соответствие между именами полей текущего типа и декодируемого объекта
        case message
        case number
        case astronauts = "people" // ключ 'people' используется в JSON, но мы хотим положить это значение в поле 'astronauts'
    }
}

struct Astronaut: Decodable { // структура соответствует протоколу Decodable
    let craft: String
    let name: String
}


func loadData() {
    let stringUrl = "http://api.open-notify.org/astros.json"
    guard let url = URL(string: stringUrl) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard error == nil else {
            print("Error: \(error?.localizedDescription ?? "no description")")
            return
        }
        guard let data = data else {
            print("No data")
            return
        }
        // для парсинга используется объект JSONDecoder, который позволяет получить объект указанного типа из сериализованного JSON
        guard let spaceInfo = try? JSONDecoder().decode(SpaceInfo.self, from: data) else {
            print("Error while parsing SpaceInfo")
            return
        }
        print("There are currently \(spaceInfo.number) humans in space")
        let uniqueSpacecrafts = Set(spaceInfo.astronauts.map({ $0.craft }))
        print("Spacecrafts: \(uniqueSpacecrafts.joined(separator: ",")) ")
    }.resume()
}

loadData()
