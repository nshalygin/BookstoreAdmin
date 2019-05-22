//
//  authInfoArray.swift
//  BookstoreAdmin
//
//  Created by Nikita on 09.12.2018.
//  Copyright © 2018 Nikita. All rights reserved.
//

import Foundation

class authInfoArray: NSObject {
    @objc var authName: String
    @objc var bDay: String
    @objc var dDay: String
    @objc var authBIO: String
    @objc var email: String
    @objc var telephone: String
    
    override init() {
        authName = "name"
        bDay = "1800-01-01"
        dDay = "2018-01-01"
        authBIO = "BIO"
        email = ""
        telephone = ""
        
        super.init()
    }
    
    init(authName: String, bDay: String, dDay: String, authBIO: String, email: String, telephone: String) {
        self.authName = authName
        self.bDay = bDay
        self.dDay = dDay
        self.authBIO = authBIO
        self.email = email
        self.telephone = telephone
                
        super.init()
    }
    
}
