//
//  wareHouseController.swift
//  BookstoreAdmin
//
//  Created by Nikita on 26.11.2018.
//  Copyright © 2018 XueYu. All rights reserved.
//

import Cocoa

class wareHouseController: NSViewController {

    let URL_SAVE_TEAM = "http://192.168.207.130/mws_v2/query"
    //let URL_SAVE_TEAM = "http://localhost:8888/MyWebService_v1/query.php"
    
    @IBOutlet weak var inputISBN: NSTextField!
    @IBOutlet weak var inputPublHouse: NSTextField!
    @IBOutlet weak var inputAmount: NSTextField!
    @IBOutlet weak var inputPurchasePrice: NSTextField!
    @IBOutlet weak var inputData: NSDatePicker!
    
    @IBAction func orderButton(_ sender: NSButton) {
        //created NSURL
        let requestURL = NSURL(string: URL_SAVE_TEAM)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "POST"
        
        //getting values from text fields
        let ISBN = inputISBN.stringValue
        let publHouse = inputPublHouse.stringValue
        let amount = inputAmount.stringValue
        let purchasePrice = inputPurchasePrice.stringValue
        let orderDay = inputData.stringValue
        
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "ISBN="+ISBN+"publHouse="+publHouse+"amount="+amount+"purchasePrice="+purchasePrice+"orderDay="+orderDay;
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("error is \(error)")
                return;
            }
            
            //parsing the response
            do {
                //converting resonse to NSDictionary
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                //parsing the json
                if let parseJSON = myJSON {
                    
                    //creating a string
                    var msg : String!
                    
                    //getting the json response
                    msg = parseJSON["message"] as! String?
                    
                    //printing the response
                    print(msg)
                    
                }
            } catch {
                print(error)
            }
            
        }
        //executing the task
        task.resume()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
