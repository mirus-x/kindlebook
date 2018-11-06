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
}

class Book{
    let title: String
    let author: String
    var image: UIImage?
    var pages: [Page]?
    
    init(title: String, author: String, image: UIImage?, pages:[Page]?) {
        self.title = title
        self.author = author
        if let image = image{
            self.image = image
        }
        if let pages = pages{
            self.pages = pages
        }
    }
}
