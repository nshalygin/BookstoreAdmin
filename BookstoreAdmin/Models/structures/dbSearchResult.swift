//
//  searchResult.swift
//  AppSearch
//
//  Created by Nikita on 01.12.2018.
//  Copyright © 2018 XueYu. All rights reserved.
//

import Foundation

class searchResult: NSObject {
    @objc var rank: Int
    @objc var bookTitle: String
    @objc var authName: String
    @objc var genre: String
    @objc var ISBN: String
    @objc var numOfPages: String
    @objc var language: String
    @objc var publHouse: String
    @objc var publYear: String
    @objc var wrYear: String
    @objc var sellingPrice: String
    @objc var warehouseAmount: Int
    @objc var bookDescription: String
    
    override init() {
        rank = 0
        bookTitle = "title"
        authName = "name"
        genre = "genre"
        ISBN = ""
        numOfPages = ""
        language = "language"
        publHouse = "publHouse"
        publYear =  ""
        wrYear = ""
        sellingPrice = ""
        warehouseAmount = 0
        bookDescription = "description"
        
        super.init()
    }
    
    init(rank: Int, bookTitle: String, authName: String, genre: String, ISBN: String, numOfPages: String, language: String, publHouse: String, publYear: String, wrYear: String, sellingPrice: String, warehouseAmount: Int, bookDescription: String) {
        self.rank = rank
        self.bookTitle = bookTitle
        self.authName = authName
        self.genre = genre
        self.ISBN = ISBN
        self.numOfPages = numOfPages
        self.language = language
        self.publHouse = publHouse
        self.publYear = publYear
        self.wrYear = wrYear
        self.sellingPrice = sellingPrice
        self.warehouseAmount = warehouseAmount
        self.bookDescription = bookDescription
        
        super.init()
    }
    
}
