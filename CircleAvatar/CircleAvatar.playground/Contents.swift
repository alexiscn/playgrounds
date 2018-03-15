//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let container = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
container.backgroundColor = .white

// method 1

let avatarButton = UIButton(type: .custom)
avatarButton.frame = CGRect(x: 100, y: 20, width: 90, height: 90)
avatarButton.setImage(UIImage(named: "avatar.jpg"), for: .normal)
avatarButton.layer.cornerRadius = avatarButton.frame.size.width/2
avatarButton.clipsToBounds = true

container.addSubview(avatarButton)

// method 2


// method 3

let avatarButton3 = UIButton(type: .custom)
avatarButton3.frame = CGRect(x: 0, y: 300, width: 90, height: 90)
avatarButton3.setImage(UIImage(named: "avatar.jpg"), for: .normal)

let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
imageView.image = UIImage(named: "corner_circle")
imageView.center = avatarButton3.center
container.addSubview(avatarButton3)
container.addSubview(imageView)

PlaygroundPage.current.liveView = container


