//
//this viewcontroller use messagekit's MessageViewController to dissplay bubble messages
//that taken from firebase
//

import UIKit
import MessageKit
import Firebase

class ViewController: MessagesViewController {

    //array of empty messages
    var messages : [MessageType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assign the messagekit
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
