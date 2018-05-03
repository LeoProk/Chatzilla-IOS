//
//  NewUser.swift
//  Chatzilla-IOS
//
//  Created by user on 5/1/18.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation
import Firebase

class NewUser : UIViewController {
    var ref : DatabaseReference!
    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBAction func acceptClicked(_ sender: Any) {
        //create new user using phone number and nickname
        ref.child("users").child(num.text!).setValue(name.text!)
        
    }
    
    override func viewDidLoad() {
        //get referance to firedatabase
        ref = Database.database().reference(fromURL: "https://chatzilla-ad20b.firebaseio.com/")
    }
    
}
