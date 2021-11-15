//
//  Mocks.swift
//  ExChat
//
//  Created by 김종권 on 2021/11/16.
//

import Foundation

func getChannelMocks() -> [Channel] {
    return (0...3).map { Channel(id: String($0), name: "name " + String($0)) }
}

func getMessagesMock() -> [Message] {
    return (0...3).map { Message(content: "message content \($0)") }
}
