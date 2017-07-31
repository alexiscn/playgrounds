# Gradient Text Color to UILabel

There are serval ways to add gradient color to a label.

![](gradient.png)

# method 1

custom UILabel, override `draw(_ rect:)` method to apply gradient color.

```
class GradientLabel: UILabel {

    var startColor: UIColor = UIColor.white

    var endColor: UIColor = UIColor.white

    override func draw(_ rect: CGRect) {

        if let ctx = UIGraphicsGetCurrentContext() {
            UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
            ctx.scaleBy(x: 1, y: -1)
            ctx.translateBy(x: 0, y: -bounds.size.height)
            super.draw(rect)
        }

        guard let img = UIGraphicsGetImageFromCurrentImageContext() else {
            return
        }
        UIGraphicsEndImageContext()
        if let ctx = UIGraphicsGetCurrentContext() {
            ctx.clip(to: bounds, mask: img.cgImage!)
            let colors = [startColor.cgColor, endColor.cgColor]
            let locs:[CGFloat] = [0.0, 1.0]
            if let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors as CFArray, locations: locs) {
                ctx.drawLinearGradient(gradient, start: CGPoint(x: 0, y: bounds.size.height*0.5), end: CGPoint(x: bounds.size.width, y: bounds.size.height*0.5), options: CGGradientDrawingOptions.init(rawValue: 0))
            }
        }
    }
}
```

# method 2

use mask

define the container view

```
let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
view.backgroundColor = .black
```

add a gradient layer as background layer

```
let gradient = CAGradientLayer()
gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
gradient.startPoint = CGPoint(x: 0, y: 0.5)
gradient.endPoint = CGPoint(x: 1, y: 0.5)
gradient.frame = view.bounds
view.layer.addSublayer(gradient)
```

add a label as the mask

```
let label = UILabel()
label.font = UIFont.systemFont(ofSize: 30, weight: UIFontWeightBold)
label.text = "Hello world"
label.textAlignment = .center
view.addSubview(label)
label.frame = view.bounds
view.mask = label
```
