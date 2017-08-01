//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let semaphore = DispatchSemaphore(value: 0)

let url: URL = URL(string: "https://www.baidu.com")!
let session = URLSession(configuration: .default)

for i in 0...9 {
    session.dataTask(with: url, completionHandler: { (data, response, error) in
        print(i)
        semaphore.signal()
    }).resume()
    semaphore.wait()
}
