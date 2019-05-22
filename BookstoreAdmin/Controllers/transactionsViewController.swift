//
//  transactionsViewController.swift
//  BookstoreAdmin
//
//  Created by Nikita on 01.12.2018.
//  Copyright © 2018 XueYu. All rights reserved.
//

import Cocoa

class transactionsViewController: NSViewController {

    @IBOutlet var transactionsAC: NSArrayController!
    
    @objc dynamic var transactionsArray = [dbTransactions]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        transactionsRequstManager.getTransactions() { (funcArray, error) in
            self.transactionsArray = funcArray
        }
        
        //transactionsArray.append(dbTransactions(id: "1", type: "selling", custID: "1", ISBN: "978-5-17-112604-8", orderDate: "2018-12-03", amount: "1", sellerID: "1", cardNum: "1892000012454586", price: "7.10"))
        //transactionsArray.append(dbTransactions(id: "1", type: "selling", custID: "1", ISBN: "978-5-17-112604-8", orderDate: "2018-12-03", amount: "1", sellerID: "1", cardNum: "1892000012454586", price: "7.10"))
        //transactionsArray.append(dbTransactions(id: "1", type: "selling", custID: "1", ISBN: "978-5-17-112604-8", orderDate: "2018-12-03", amount: "1", sellerID: "1", cardNum: "1892000012454586", price: "7.10"))
    }
    
}
