//
//  ViewController.swift
//  Chatzilla-IOS
//
//  Created by user on 4/15/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit
import MessageKit
import Firebase

class ViewController: MessagesViewController {

    var messages : [MessageType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self as? MessagesDataSource
        messagesCollectionView.messagesLayoutDelegate = self as? MessagesLayoutDelegate
        messagesCollectionView.messagesDisplayDelegate = self as? MessagesDisplayDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
extension ViewController: MessagesDataSource {
    
    func currentSender() -> Sender {
        return Sender(id: "any_unique_id", displayName: "Steven")
    }
    
    func numberOfMessages(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
}
