//
//  ChanLoggable.swift
//
//
//  Created by MEGA_Mac on 2024/06/20.
//

import Foundation

public protocol ChanLoggable {}

@frozen
public enum DebugMode {
    case on
    case off
}

public extension ChanLoggable {
    func debug(_ message: Any,
               _ arguments: Any...,
               file: String = #file,
               function: String = #function,
               line: Int = #line) {
        ChanLog.log(message, arguments, type: .debug, file: file, function: function, line: line, debugMode: .on)
    }
    
    func debug(_ message: Any) {
        ChanLog.log(message, [self], type: .debug, debugMode: .off)
    }
    
    func info(_ message: Any,
              _ arguments: Any...,
              file: String = #file,
              function: String = #function,
              line: Int = #line) {
        ChanLog.log(message, arguments, type: .info, file: file, function: function, line: line, debugMode: .on)
    }
    
    func info(_ message: Any) {
        ChanLog.log(message, [self], type: .info, debugMode: .off)
    }
    
    func error(_ message: Any,
               _ arguments: Any...,
               file: String = #file,
               function: String = #function,
               line: Int = #line) {
        ChanLog.log(message, arguments, type: .error, file: file, function: function, line: line, debugMode: .on)
    }
    
    func error(_ message: Any) {
        ChanLog.log(message, [self], type: .error, debugMode: .off)
    }
    
    func custom(category: String,
                _ message: Any,
                _ arguments: Any...,
                file: String = #file,
                function: String = #function,
                line: Int = #line) {
        ChanLog.log(message, arguments, type: .custom(name: category), file: file, function: function, line: line, debugMode: .on)
    }
    
    func custom(category: String,
                _ message: Any) {
        ChanLog.log(message, [self], type: .custom(name: category), debugMode: .off)
    }
}
