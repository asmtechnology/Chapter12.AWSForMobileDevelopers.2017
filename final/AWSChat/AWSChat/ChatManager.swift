//
//  ChatManager.swift
//  AWSChat
//
//  Created by Abhishek Mishra on 09/04/2017.
//  Copyright © 2017 ASM Technology Ltd. All rights reserved.
//

import Foundation

class ChatManager {
    
    var friendList:[User]?
    
    static let sharedInstance: ChatManager = ChatManager()
    
    private init() {
        friendList =  [User]()
    }
    
    func clearFriendList() {
        friendList?.removeAll()
    }
    
    func addFriend(user:User) {
        friendList?.append(user)
    }
    
}
