//
//  NSObject.swift
//  ExChat
//
//  Created by 김종권 on 2021/11/16.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
