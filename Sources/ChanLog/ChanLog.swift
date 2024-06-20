import Foundation
import os.log

extension OSLog {
    static let subsystem = Bundle.main.bundleIdentifier!
    /// Simple logging in the development environment (not shown in the 'Console' app on Mac, only displayed in Xcode console)
    static let debug = OSLog(subsystem: subsystem, category: "Debug")
    /// iSimilar to error cases but with a longer error description
    static let info = OSLog(subsystem: subsystem, category: "Info")
    /// Similar to Info cases but for simple errors
    static let error = OSLog(subsystem: subsystem, category: "Error")
}

public struct ChanLog {
    @frozen
    enum LogType {
        case error
        case info
        case debug
        case custom(categoryName: String)
        
        fileprivate var category: String {
            switch self {
            case .error:
                return "error"
            case .info:
                return "info"
            case .debug:
                return "debug"
            case .custom(let categoryName):
                return categoryName
            }
        }
        
        fileprivate var osLog: OSLog {
            switch self {
            case .error:
                return OSLog.error
            case .info:
                return OSLog.info
            case .debug:
                return OSLog.debug
            case .custom:
                return OSLog.error
            }
        }
        
        fileprivate var osLogType: OSLogType {
            switch self {
            case .debug:
                return .debug
            case .info:
                return .info
            case .error:
                return .error
            case .custom:
                return .debug
            }
        }
    }
    
    static private func log(_ message: Any,
                            _ arguments: [Any],
                            type: LogType,
                            file: String = #file,
                            function: String = #function,
                            line: Int = #line) {
        let date = ChanLog().getCurrentKSTDateString()
        let extraMessage: String = arguments.map({ String(describing: $0) }).joined(separator: " ")
        let fileName = (file as NSString).lastPathComponent
        let logMessage = """
            time: \(date)
            message: \(message)
            value: \(extraMessage)
            fileName: \(fileName) function: \(function) \(line)lines
            """
        if #available(iOS 14.0, *, macOS 11.0) {
            let logger = Logger(subsystem: OSLog.subsystem, category: type.category)
            switch type {
            case .debug, .custom:
                logger.debug("\(logMessage, privacy: .public)")
            case .info:
                logger.info("\(logMessage, privacy: .public)")
            case .error:
                logger.error("\(logMessage, privacy: .public)")
            }
        } else {
            os_log("%{public}@", log: type.osLog, type: type.osLogType, logMessage)
        }
    }
    
    private func getCurrentKSTDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: Date())
    }
}

public extension ChanLog {
    static func debug(_ message: Any,
                      _ arguments: Any...,
                      file: String = #file,
                      function: String = #function,
                      line: Int = #line) {
        log(message, arguments, type: .debug, file: file, function: function, line: line)
    }
    
    static func info(_ message: Any,
                     _ arguments: Any...,
                     file: String = #file,
                     function: String = #function,
                     line: Int = #line) {
        log(message, arguments, type: .info, file: file, function: function, line: line)
    }
    
    static func error(_ message: Any,
                      _ arguments: Any...,
                      file: String = #file,
                      function: String = #function,
                      line: Int = #line) {
        log(message, arguments, type: .error, file: file, function: function, line: line)
    }
    
    static func custom(category: String,
                       _ message: Any,
                       _ arguments: Any...,
                       file: String = #file,
                       function: String = #function,
                       line: Int = #line) {
        log(message, arguments, type: .custom(categoryName: category), file: file, function: function, line: line)
    }
}
