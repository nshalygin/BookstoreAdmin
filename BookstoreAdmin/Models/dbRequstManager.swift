//
//  getSearchResult.swift
//  AppSearch
//
//  Created by Nikita on 01.12.2018.
//  Copyright © 2018 XueYu. All rights reserved.
//

//ЕСЛИ ВСЕ ТАКИ ПОЛУЧИТЬСЯ СДЕЛАТЬ ТАКИМ ОБРАЗОМ, ТО НУЖНО ЗДЕСЬ ПРОИНЕЦИАЛИЗИРОВАТЬ dataArray и перепривяззать в ArrayController

import Foundation

class dbRequstManager {
    
    static func getSearchResults(query: String, criterion: String, completionHandler: @escaping ([searchResult], NSError?) -> Void) {
        
        var funcArray = [searchResult]()
        
        let URL_GET_BOOK = "http://192.168.207.130/mws_v2/getBase.php"
        
        //created NSURL
        let requestURL = NSURL(string: URL_GET_BOOK)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "POST"
        
        let postData = NSMutableData(data: "nTable=books".data(using: String.Encoding.utf8)!)
        postData.append("&nField=\(criterion)".data(using: String.Encoding.utf8)!)
        postData.append("&tQuery=LIKE".data(using: String.Encoding.utf8)!)
        postData.append("&value='\(query)%'".data(using: String.Encoding.utf8)!)
        
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
                //print(getJSON) //Response result
                let books: NSArray = getJSON["books"] as! NSArray
                //print(books)
                
                for i in 0 ..< books.count {
                    
                    funcArray.append(searchResult(rank: i+1, bookTitle: (books[i] as! NSDictionary)["bookTitle"] as! String!,
                                                  authName: (books[i] as! NSDictionary)["authName"] as! String!,
                                                  genre: (books[i] as! NSDictionary)["genre"] as! String!,
                                                  ISBN: (books[i] as! NSDictionary)["ISBN"] as! String!,
                                                  numOfPages: (books[i] as! NSDictionary)["numOfPages"] as! String!,
                                                  language: (books[i] as! NSDictionary)["language"] as! String!,
                                                  publHouse: (books[i] as! NSDictionary)["publHouse"] as! String!,
                                                  publYear: (books[i] as! NSDictionary)["publYear"] as! String!,
                                                  wrYear: (books[i] as! NSDictionary)["wrYear"] as! String!,
                                                  sellingPrice: (books[i] as! NSDictionary)["sellingPrice"] as! String!,
                                                  warehouseAmount: 5,
                                                  bookDescription: (books[i] as! NSDictionary)["description"] as! String!))
                    //print(funcArray)
                    DispatchQueue.main.async {
                        completionHandler(funcArray, nil)
                    }
                    
                }
                
            } catch let parsingError {
                print("Error", parsingError)
            }
            
            }.resume()
    }
}
