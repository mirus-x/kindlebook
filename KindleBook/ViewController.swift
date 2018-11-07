//
//  ViewController.swift
//  KindleBook
//
//  Created by 2x2 on 11/5/18.
//  Copyright © 2018 2x2. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var books: [Book]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
        view.backgroundColor = .purple
        navigationItem.title = "Kindle"
        setupBooks()
        fetchBooks()
        
    }
    
    func fetchBooks(){
        print("Fetching books...")
        
        let urlEndpoint: String = "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json"
        guard let url = URL(string: urlEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)

        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler:
        { (data: Data?, response: URLResponse?, error: Error?) in
            // this is where the completion handler code goes
            
            if let error = error {
                print("Cannot fetch data: ",error)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else{return}
            let dataToString = String(data: data, encoding: .utf8)
            print(dataToString)
            
        })
        task.resume()

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BookCell
//        cell.backgroundColor = .orange
        
        let book = books?[indexPath.row]
        cell.book = book
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedBook = self.books?[indexPath.row]
//        print(book.title)
//        return
        
        
        // Set layout to pass into our collectionview
        let layout = UICollectionViewFlowLayout()
        //setupo controller for our pageController
        let bookPagerController = BookPagerController(collectionViewLayout: layout)
        bookPagerController.book = selectedBook
        // setup navigation bar to go to the prev page
        let navController = UINavigationController(rootViewController: bookPagerController)
        
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = books?.count{
            return count
        }
        return 0
    }
    
    func setupBooks(){
        let page1 = Page(number: 1, text: "This is first page of the book")
        let page2 = Page(number: 2, text: "This is second page of the book")
        let page3 = Page(number: 3, text: "This is third page of the book")
        
        let pages = [page1, page2, page3]
        
        let book1 = Book(title: "Incredible life of Bill Gates",
                         author: "Bill Gates",
                         image: UIImage(named: "bill_gates"),
                         pages: pages)
        
        let book2 = Book(title: "My faults, my success, my life", author: "Steve Jobs",
                         image: UIImage(named: "steve_jobs"),
                         pages: [Page(number: 1, text: "Text for the page 1"),
                                 Page(number: 2, text: "Test for the page 2")])
        
        let book3 = Book(title: "Title for the third book", author: "best seller Writer",  image: nil,  pages: nil)
        
        self.books = [book1, book2, book3]
        for book in self.books!{
            print("Title: \(book.title) \n Author: \(book.author)" )
            if let pages = book.pages{
                for page in pages{
                    print("Page number: \(page.number) \n Text: \(page.text)" )
                }
            }
        }
    }


}

