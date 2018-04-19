//
//  ViewController.swift
//  Chatzilla-IOS
//
//  Created by user on 4/15/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class ViewController: MessagesViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

