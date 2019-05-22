//
//  AuthInfo.swift
//  BookstoreAdmin
//
//  Created by Nikita on 09.12.2018.
//  Copyright © 2018 Nikita. All rights reserved.
//

import Foundation

class AuthInfo {
    static func getAuthInfo(authName: String, completionHandler: @escaping ([authInfoArray], NSError?) -> Void) {
        
        var funcArray = [authInfoArray]()
        
        let URL_GET_BOOK = "http://192.168.207.130/mws_v2/getAuthInfo.php"
        
        //created NSURL
        let requestURL = NSURL(string: URL_GET_BOOK)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "POST"
        
        let postData = NSMutableData(data: "value=\(authName)".data(using: String.Encoding.utf8)!)
        
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        session.dataTask(with: request as URLRequest) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                var getJSON: NSDictionary!
                getJSON =  try JSONSerialization.jsonObject(with: dataResponse, options: .allowFragments) as? NSDictionary
                print(getJSON) //Response result
                let info: NSArray = getJSON["info"] as! NSArray
                print(info)
                
                for i in 0 ..< 1 {
                    
                    funcArray.append(authInfoArray(authName: (info[i] as! NSDictionary)["authName"] as! String!,
                                                   bDay: (info[i] as! NSDictionary)["bDay"] as! String!,
                                                   dDay: (info[i] as! NSDictionary)["dDay"] as! String!,
                                                   authBIO: (info[i] as! NSDictionary)["authBIO"] as! String!,
                                                   email: (info[i] as! NSDictionary)["email"] as! String!,
                                                   telephone: (info[i] as! NSDictionary)["Telephone"] as! String!))
                    completionHandler(funcArray, nil)
                    
                }
                
            } catch let parsingError {
                print("Error", parsingError)
            }
            
            }.resume()
    }
}
