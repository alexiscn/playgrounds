//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
view.backgroundColor = .black
PlaygroundPage.current.liveView = view
PlaygroundPage.current.needsIndefiniteExecution = true

let gradient = CAGradientLayer()
gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
gradient.startPoint = CGPoint(x: 0, y: 0.5)
gradient.endPoint = CGPoint(x: 1, y: 0.5)
gradient.frame = view.bounds
view.layer.addSublayer(gradient)

let label = UILabel()
label.font = UIFont.systemFont(ofSize: 30, weight: UIFontWeightBold)
label.text = "Hello world"
label.textAlignment = .center
view.addSubview(label)
label.frame = view.bounds
view.mask = label