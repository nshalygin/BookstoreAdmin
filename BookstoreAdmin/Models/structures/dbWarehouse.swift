//
//  dbWarehouse.swift
//  BookstoreAdmin
//
//  Created by Nikita on 09.12.2018.
//  Copyright © 2018 Nikita. All rights reserved.
//

import Foundation

class dbWarehouse: NSObject {
    @objc var id: String
    @objc var type: String
    @objc var custID: String
    @objc var ISBN: String
    @objc var orderDate: String
    @objc var amount: String
    @objc var sellerID: String
    @objc var cardNum: String
    @objc var price: String
    
    override init() {
        id = ""
        type = "type"
        orderDate = "2018-01-01"
        price = "0.0"
        ISBN = "ISBN"
        custID = ""
        cardNum = "cardNum"
        amount = ""
        sellerID = ""
        
        super.init()
    }
    
    init(id: String, type: String, custID: String, ISBN: String, orderDate: String, amount: String, sellerID: String, cardNum: String, price: String) {
        
        self.id = id
        self.type = type
        self.orderDate = orderDate
        self.price = price
        self.ISBN = ISBN
        self.custID = custID
        self.amount = amount
        self.sellerID = sellerID
        self.cardNum = cardNum
        
        super.init()
    }
    
}
