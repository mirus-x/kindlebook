//
//  Models.swift
//  KindleBook
//
//  Created by 2x2 on 11/5/18.
//  Copyright © 2018 2x2. All rights reserved.
//

import UIKit

class Page{
    let number: Int
    let text: String
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
    
    init(dictionary: [String:Any]) {
        self.number = dictionary["id"] as? Int ?? 1
        self.text = dictionary["text"] as? String ?? ""
    }
    
    
}

class Book{
    let title: String
    let author: String
    var image: String
    var pages: [Page]?
    
    init(title: String, author: String, image: String, pages:[Page]?) {
        self.title = title
        self.author = author
            self.image = image
        if let pages = pages{
            self.pages = pages
        }
    }
    
    init(dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? ""
        self.author = dictionary["author"] as? String ?? ""
        
        
        self.image = dictionary["coverImageUrl"] as? String ?? ""
        
        /* since our Pages has it is own class and it is also optional in our book class
           we can just create another for loop and cast our pages to our Page class
        */
        self.pages = []
        guard let pageDictionaries = dictionary["pages"] as? [[String: Any]]
            else{return}
        for pageDictionary in pageDictionaries{
            let page = Page(dictionary: pageDictionary)
            self.pages?.append(page)
        }
    }
}
