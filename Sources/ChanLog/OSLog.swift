//
//  OSLog.swift
//  
//
//  Created by MEGA_Mac on 2024/06/20.
//

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
