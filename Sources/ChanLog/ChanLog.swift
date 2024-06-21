//
//
// ChanLog.swift
//

import Foundation
import os.log

public struct ChanLog {
    @frozen
    enum LogType {
        case error
        case info
        case debug
        case custom(name: String)
        
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
    
    static internal func log(_ message: Any,
                             _ arguments: [Any],
                             type: LogType,
                             file: String = #file,
                             function: String = #function,
                             line: Int = #line,
                             debugMode: DebugMode) {
        let date = ChanLog().getCurrentKSTDateString()
        let extraMessage: String = arguments.map({ String(describing: $0) }).joined(separator: " ")
        let fileName = (file as NSString).lastPathComponent
        let logMessage = debugMode == .on ?
            """
            time: \(date)
            message: \(message)
            value: \(extraMessage)
            fileName: \(fileName) function: \(function) \(line)lines
            """
        :
            """
            message: \(message)
            value: \(extraMessage)
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
