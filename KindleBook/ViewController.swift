//
//  ViewController.swift
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
    let pages: [Page]
    
    init(title: String, author: String, pages:[Page]) {
        self.title = title
        self.author = author
        self.pages = pages
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let page1 = Page(number: 1, text: "This is first page of the book")
        let page2 = Page(number: 2, text: "This is second page of the book")
        let page3 = Page(number: 3, text: "This is third page of the book")
        
        let pages = [page1, page2, page3]
        
        let book1 = Book(title: "Incredible title of the first book",
                        author: "Incredible Writer",
                        pages: pages)
        
        let book2 = Book(title: "Title for the second book", author: "Bad Ass Writer",
                         pages: [Page(number: 1, text: "Text for the page 1"),
                                 Page(number: 2, text: "Test for the page 2")])
        
        for book in [book1, book2]{
            print("Title: \(book.title) \n Author: \(book.author)" )
            for page in book.pages{
                
                print("Page number: \(page.number) \n Text: \(page.text)" )
            }
        }
        
    }


}

