//
//  Type+.swift
//
//
//  Created by MEGA_Mac on 2024/06/20.
//

import Foundation

extension CustomStringConvertible where Self: ChanLoggable {
    public var description: String {
        return String(describing: self)
    }
}

extension String: ChanLoggable {}
extension Int: ChanLoggable {}
extension Int8: ChanLoggable {}
extension Int16: ChanLoggable {}
extension Int32: ChanLoggable {}
extension Int64: ChanLoggable {}
extension Double: ChanLoggable {}
extension Float: ChanLoggable {}
extension Bool: ChanLoggable {}
extension Array: ChanLoggable where Element: CustomStringConvertible {}
extension NSObject: ChanLoggable {}

#if canImport(UIKit)
    extension UIView: ChanLoggable {}
#endif
