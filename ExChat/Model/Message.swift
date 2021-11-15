//
//  Message.swift
//  ExChat
//
//  Created by 김종권 on 2021/11/16.
//

import Foundation
import MessageKit
import UIKit

struct Message: MessageType {
    
    let id: String?
    var messageId: String {
        return id ?? UUID().uuidString
    }
    let content: String
    let sentDate: Date
    let sender: SenderType
    var kind: MessageKind {
        if let image = image {
            let mediaItem = ImageMediaItem(image: image)
            return .photo(mediaItem)
        } else {
            return .text(content)
        }
    }
    
    var image: UIImage?
    var downloadURL: URL?
    
    init(content: String) {
        sender = Sender(senderId: "id(TODO...)", displayName: "displayName(TODO...)")
        self.content = content
        sentDate = Date()
        id = nil
    }
    
    init(image: UIImage) {
        sender = Sender(senderId: "id(TODO...)", displayName: "displayName(TODO...)")
        self.image = image
        sentDate = Date()
        content = ""
        id = nil
    }
    
}

extension Message: Comparable {
  static func == (lhs: Message, rhs: Message) -> Bool {
    return lhs.id == rhs.id
  }

  static func < (lhs: Message, rhs: Message) -> Bool {
    return lhs.sentDate < rhs.sentDate
  }
}
