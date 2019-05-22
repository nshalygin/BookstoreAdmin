//
//  orderRegController.swift
//  BookstoreAdmin
//
//  Created by Nikita on 26.11.2018.
//  Copyright © 2018 XueYu. All rights reserved.
//

import Cocoa

class orderRegController: NSViewController {
    
    let URL_ADD_NEW_ORDER = "http://192.168.207.130/mws_v2/postNewTransOrder"
    
    @IBOutlet weak var inputISBN: NSTextField!
    @IBOutlet weak var inputOrderDate: NSTextField!
    @IBOutlet weak var inputCustID: NSTextField!
    @IBOutlet weak var inputSellerID: NSTextField!
    @IBOutlet weak var inputAmount: NSTextField!
    @IBOutlet weak var inputSellingPrice: NSTextField!
    @IBOutlet weak var inputCardNum: NSTextField!
    
    @IBAction func regOrderButton(_ sender: NSButton) {
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            "Postman-Token": "f1d0eee5-1c37-4c50-8438-6c58998f311d"
        ]
        
        //created NSURL
        let requestURL = NSURL(string: URL_ADD_NEW_ORDER)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        let postData = NSMutableData(data: "custID=\(inputCustID.stringValue)".data(using: String.Encoding.utf8)!)
        postData.append("&ISBN=\(inputISBN.stringValue)".data(using: String.Encoding.utf8)!)
        postData.append("&orderDate=\(inputOrderDate.stringValue)".data(using: String.Encoding.utf8)!)
        postData.append("&amount=\(inputAmount.stringValue)".data(using: String.Encoding.utf8)!)
        postData.append("&sellerID=\(inputSellerID.stringValue)".data(using: String.Encoding.utf8)!)
        postData.append("&sellingPrice=\(inputSellingPrice.stringValue)".data(using: String.Encoding.utf8)!)
        postData.append("&cardNum=\(inputCardNum.stringValue)".data(using: String.Encoding.utf8)!)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
                
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse as Any)
            }
        })
        
        dataTask.resume()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
