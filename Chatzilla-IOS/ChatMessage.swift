//
//module used by firebase to get the message with use name and id
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
    //date of the message
    var date:Double
    
    init(dataSnap : DataSnapshot) {
        let userDict = dataSnap.value as! [String:Any]
        userName = userDict["user"] as! String
        userId = userDict["title"] as! String
        message = userDict["title"] as! String
        date = userDict["date"] as! Double
    }
}
