ChanLog
===============
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/seungchan2/ChanLog?label=version&sort=semver)


**✨ChanLog** is managed in a thread-safe manner, ensuring stable and reliable logging


## How to get started

First, install **ChanLog** via [Swift Package Manager](https://swift.org/package-manager/) or manually.

Then use `ChanLog` to utilize `Logger` for iOS 14 and above, and `os_log` for iOS 13 and below.

You can use `ChanLog` with collection types and UI properties.

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

> Xcode 11+ is required to build SnapKit using Swift Package Manager.

To integrate `ChanLog` into your Xcode project using Swift Package Manager, add it to the dependencies value of your `Package.swift`

```swift
dependencies: [
    .package(url: "https://github.com/seungchan2/ChanLog.git", branch: "main"))
]
```

## Swift Usage
you can `import ChanLog`
```swift
let array: [Int] = [1, 2, 3]

array.debug("숫자를 담은 배열", array) // debug
array.debug("숫자를 담은 배열") // simple debug

array.info("This is an info message", "Additional info") // info
array.info("This is an info message") // simple info

array.error("This is an error message", "Additional info") // error
array.error("This is an error message") // simple error

array.custom(category: "CustomCategory", "This is a custom message", "Additional info") // custom
array.custom(category: "CustomCategory", "This is a custom message") // simpel custom

// expected array value 
// currentTime, message, value, fileName, function, lines
time: 2024-06-19 16:53:54
message: 숫자 정보를 담은 배열
value: [1, 2, 3]
fileName: ViewController.swift function: viewDidLoad() 22lines

// expected more simply array value
// If you don't type argument, you can get simpler results
message: 숫자 정보를 담은 배열
value: [1, 2, 3]

```
```swift
let label: UILabel = {
    let label = UILabel()
    label.text = "chanLog"
    return label
}()

label.info("ChanLog Info Label", self.label.text) // info
label.text?.info("ChanLog Info Label") // simply info

// expected label value 
time: 2024-06-20 16:12:19
message: ChanLog Info Label
value: Optional("chanLog")
fileName: ViewController.swift function: viewDidLoad() 28lines

// expected more simply label value 
// If you don't type argument, you can get simpler results
message: ChanLog Info Label
value: Optional("chanLog")
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

