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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - create message from firebase
    //create dispatch group to update the messages collection view when done fetching all the
    //data from firebase and greating past messages from it
    func populateMessages(){
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
                let chatSnap = ChatMessage(dataSnap : fireObj as! DataSnapshot)
                //adds the park to the park list
                //if there still parks left continue to loop otherwise
                //end the dispatch
                if self.firebaseData.count < snapshot.childrenCount - 1{
                    self.firebaseData.append(chatSnap)
                    //create new message from firebase using message text sender info and populate it
                    //TODO: change user id
                    let message = MockMessage(data:MessageData.text(chatSnap.message),sender:self.currentSender(),messageId: UUID().uuidString,date:Date(timeIntervalSince1970: chatSnap.date))
                    //add the message to message array
                    self.messages.append(message)
                }else {
                    dispatchGroup.leave()
                }
            }
            //when done looping over all the park reload the table view on
            //main thread
            dispatchGroup.notify(queue: DispatchQueue.main, execute: {
                DispatchQueue.main.async {
                    self.messagesCollectionView.reloadData()
                }
            })
        })
    }
}
extension ViewController: MessagesDataSource {
    //the current use info
    func currentSender() -> Sender {
        return Sender(id: "any_unique_id", displayName: "Steven")
    }
    //get the numbr of messages
    func numberOfMessages(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    //get selcted message info
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
}
