ChanLog
===============
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/seungchan2/ChanLog?label=version&sort=semver)


**✨ChanLog** is managed in a thread-safe manner, ensuring stable and reliable logging


## How to get started

First, install **ChanLog** via [Swift Package Manager](https://swift.org/package-manager/) or manually.

Then use `ChanLog` to utilize `Logger` for iOS 14 and above, and `os_log` for iOS 13 and below.



## Swift Usage
you can `import ChanLog`
```swift
let array: [Int] = [1, 2, 3]
array.debug("숫자 정보를 담은 배열", array) // debug
array.info("This is an info message", "Additional info") // info
array.error("This is an error message", "Additional info") // error
array.custom(category: "CustomCategory", "This is a custom message", "Additional info") // custom

let label: UILabel = {
  let label = UILabel()
  label.text = "chanLog"
  return label
}()

label.info("ChanLog Info Label", self.label.text) // info

...
// currentTime, message, value, fileName, function, lines
time: 2024-06-19 16:53:54
message: 숫자 정보를 담은 배열
value: [1, 2, 3]
fileName: ViewController.swift function: viewDidLoad() 22lines

time: 2024-06-20 16:12:19
message: ChanLog Info Label
value: <UILabel: 0x103e08a90; frame = (0 0; 0 0); text = '1...1' (length = 3); userInteractionEnabled = NO; backgroundColor = UIExtendedGrayColorSpace 0 0; layer = <_UILabelLayer: 0x600002614a80>> Optional("chanLog")
fileName: ViewController.swift function: viewDidLoad() 28lines
```

## More information
### debug
Simple logging in the development environment (not shown in the 'Console' app on Mac, only displayed in Xcode console)
### info
Similar to error cases but with a longer error description
### error
Similar to Info cases but for simple errors
### custom
You can make Custom logEvent

