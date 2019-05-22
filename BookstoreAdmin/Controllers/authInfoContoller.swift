//
//  authInfoContoller.swift
//  BookstoreAdmin
//
//  Created by Nikita on 09.12.2018.
//  Copyright © 2018 Nikita. All rights reserved.
//

import Cocoa

class authInfoContoller: NSViewController {

    @objc dynamic var dataArray = [authInfoArray]()
    @IBOutlet var authInfoAC: NSArrayController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        //dataArray.append(authInfoArray(authName: "test", bDay: "test", dDay: "test", authBIO: "test", email: "test", telephone: "test"))
    }
    
}
