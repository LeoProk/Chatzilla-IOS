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
    @IBOutlet weak var num: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        //get referance to firedatabase
        let ref = Database.database().reference(fromURL: "https://chatzilla-ad20b.firebaseio.com/")
        //create new user using phone number and nickname
        ref.child("users").child("<#T##pathString: String##String#>").setValue("<#T##value: Any?##Any?#>")
    }

    
}
