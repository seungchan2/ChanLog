//
//  ChanLoggable.swift
//
//
//  Created by MEGA_Mac on 2024/06/20.
//

import Foundation

public protocol ChanLoggable {}

public extension ChanLoggable {
    func debug(_ message: Any,
               _ arguments: Any...,
               file: String = #file,
               function: String = #function,
               line: Int = #line) {
        ChanLog.log(message, [self] + arguments, type: .debug, file: file, function: function, line: line)
    }
    
    func info(_ message: Any, _ arguments: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        ChanLog.log(message, [self] + arguments, type: .info, file: file, function: function, line: line)
    }
    
    func error(_ message: Any, _ arguments: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        ChanLog.log(message, [self] + arguments, type: .error, file: file, function: function, line: line)
    }
    
    func custom(category: String, _ message: Any, _ arguments: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        ChanLog.log(message, [self] + arguments, type: .custom(name: category), file: file, function: function, line: line)
    }
}