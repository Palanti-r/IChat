//
//  ModelChat.swift
//  IChat
//
//  Created by Commander on 04.10.2023.
//

import UIKit

struct Chat: Hashable, Decodable {
    var username: String
    var userImageString: String
    var lastMessage: String
    let id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.id == rhs.id
    }
    
   
}
