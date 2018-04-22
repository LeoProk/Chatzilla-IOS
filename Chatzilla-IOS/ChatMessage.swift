//
//  ChatMessage.swift
//  Chatzilla-IOS
//
//  Created by user on 4/22/18.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation
import Firebase

class ChatMessage {
    //name of the user that send the message
    var userName : String
    //id of the user that send the message
    var userId : String
    //message that the user send
    var message : String
    
    init(dataSnap : DataSnapshot) {
        let userDict = dataSnap.value as! [String:Any]
        userName = userDict["user"] as! String
        userId = userDict["title"] as! String
        message = userDict["title"] as! String
    }
}
