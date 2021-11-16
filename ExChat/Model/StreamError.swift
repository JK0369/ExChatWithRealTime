//
//  StreamError.swift
//  ExChat
//
//  Created by 김종권 on 2021/11/16.
//

import Foundation

enum StreamError: Error {
    case firestoreError(Error?)
    case decodedError(Error?)
}
