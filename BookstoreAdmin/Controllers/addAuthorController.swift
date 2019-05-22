//
//  addAuthorController.swift
//  BookstoreAdmin
//
//  Created by Nikita on 02.12.2018.
//  Copyright © 2018 Nikita. All rights reserved.
//

import Cocoa

class addAuthorController: NSViewController {

    let URL_ADD_AUTHOR = "http://192.168.207.130/mws_v2/postNewAuthor"
    
    @IBOutlet weak var inputAuthName: NSTextField!
    @IBOutlet weak var inputBday: NSTextField!
    @IBOutlet weak var inputDday: NSTextField!
    @IBOutlet weak var inputBIO: NSTextField!
    @IBOutlet weak var inputTelephone: NSTextField!
    @IBOutlet weak var inputEmail: NSTextField!
    
    
   
    @IBAction func regAuthButton(_ sender: NSButton) {
        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            "Postman-Token": "f1d0eee5-1c37-4c50-8438-6c58998f311d"
        ]
        
        //created NSURL
        let requestURL = NSURL(string: URL_ADD_AUTHOR)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        /*
        print("authName=\(inputAuthName.stringValue)")
        
        let postData = NSMutableData(data: "authName=\(inputAuthName.stringValue)".data(using: String.Encoding.utf8)!)
        postData.append("&bDay=\(inputBday.stringValue)".data(using: String.Encoding.utf8)!)
        postData.append("&dDay=\(inputDday.stringValue)".data(using: String.Encoding.utf8)!)
        postData.append("&authBIO=\(inputBIO.stringValue)".data(using: String.Encoding.utf8)!)
        postData.append("&email=\(inputEmail.stringValue)".data(using: String.Encoding.utf8)!)
        postData.append("&Telephone=\(inputTelephone.stringValue)".data(using: String.Encoding.utf8)!)
        */
        //getting values from text fields
        let authName = inputAuthName.stringValue
        let bDay = inputBday.stringValue
        let dDay = inputDday.stringValue
        let authBIO = inputBIO.stringValue
        let email = inputEmail.stringValue
        let telephone = inputTelephone.stringValue
        
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "authName="+authName+"&Bday="+bDay+"&Dday="+dDay+"&authBIO="+authBIO+"&email="+email+"&telephone="+telephone;
        print(postParameters)
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        //request.httpBody = postData as Data
        
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
