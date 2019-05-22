//
//  addBookController.swift
//  BookstoreAdmin
//
//  Created by Nikita on 26.11.2018.
//  Copyright © 2018 XueYu. All rights reserved.
//

import Cocoa

class addBookController: NSViewController {

    let URL_ADD_BOOK = "http://192.168.207.130/mws_v2/postNewBook.php"
    
    @IBOutlet weak var inputISBN: NSTextField!
    @IBOutlet weak var inputBookTitle: NSTextField!
    @IBOutlet weak var inputGenre: NSTextField!
    @IBOutlet weak var inputAuthName: NSTextField!
    @IBOutlet weak var inputDescription: NSTextField!
    @IBOutlet weak var inputNumOfPages: NSTextField!
    @IBOutlet weak var inputLanguage: NSTextField!
    @IBOutlet weak var inputPublHouse: NSTextField!
    @IBOutlet weak var inputPublYear: NSTextField!
    @IBOutlet weak var inputWrYear: NSTextField!
    @IBOutlet weak var inputSellingPrice: NSTextField!
    
    @IBAction func addBookButton(_ sender: NSButton) {
        
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            "Postman-Token": "f1d0eee5-1c37-4c50-8438-6c58998f311d"
        ]
        
        //created NSURL
        let requestURL = NSURL(string: URL_ADD_BOOK)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        
        //setting the method to post
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        //getting values from text fields
        let ISBN = inputISBN.stringValue
        let bookTitle = inputBookTitle.stringValue
        let genre = inputGenre.stringValue
        let authName = inputAuthName.stringValue
        let description = inputDescription.stringValue
        let numOfPages = inputNumOfPages.stringValue
        let language = inputLanguage.stringValue
        let publYear = inputPublYear.stringValue
        let wrYear = inputWrYear.stringValue
        let publHouse = inputPublHouse.stringValue
        let sellingPrice = inputSellingPrice.stringValue
        
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "ISBN="+ISBN+"&bookTitle="+bookTitle+"&genre="+genre+"&authName="+authName+"&description="+description+"&numOfPages="+numOfPages+"&language="+language+"&publYear="+publYear+"&wrYear="+wrYear+"&publHouse="+publHouse+"&sellingPrice="+sellingPrice;
        //print(postParameters)
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
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

