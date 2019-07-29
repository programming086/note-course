//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func loadImage() {
    let string = "https://avatars.mds.yandex.net/get-bunker/60661/5ec62cb755193c37a6ec19a826b3891780eead2a/orig"
    guard let url = URL(string: string) else { return }
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else { return }
        print("Done!")
        DispatchQueue.main.async {
            let image = UIImage(data: data)
            imageView.image = image
        }
    }
    task.resume()
}

let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
loadImage()
