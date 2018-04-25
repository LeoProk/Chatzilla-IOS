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
    var firebaseData : Array<ChatMessage> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assign the messagekit to thew 
        messagesCollectionView.messagesDataSource = self as? MessagesDataSource
        messagesCollectionView.messagesLayoutDelegate = self as? MessagesLayoutDelegate
        messagesCollectionView.messagesDisplayDelegate = self as? MessagesDisplayDelegate
        //create dispatch group to update the tab view when done fetching all the
        //data from firebase
        let dispatchGroup = DispatchGroup()
        //populate the array with parks from firebase
        let ref = Database.database().reference(fromURL: "https://chatzilla-ad20b.firebaseio.com/")
        dispatchGroup.enter()
        ref.observe(DataEventType.value, with: { (snapshot) in
            _ = snapshot.value as? [String : AnyObject] ?? [:]
            //for loop that loops over snapshot data to poulate new park
            //add the park to parks array
            for fireObj in snapshot.children{
                //create new park from the firebase info
                let parkSnap = ChatMessage(dataSnap : fireObj as! DataSnapshot)
                //adds the park to the park list
                //if there still parks left continue to loop otherwise
                //end the dispatch
                if self.firebaseData.count < snapshot.childrenCount - 1{
                    self.firebaseData.append(parkSnap)
                    //self.messages.append(parkSnap)
                }else {
                    dispatchGroup.leave()
                }
            }
        })
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
