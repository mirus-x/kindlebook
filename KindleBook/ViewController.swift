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
            
            guard let data = data else{return}
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                guard let bookDictionaries = json as? [[String: Any]]
                    else{return}
                self.books = []
                for bookDictionary in bookDictionaries{
                    let book = Book(dictionary: bookDictionary)
                    self.books?.append(book)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch let jsonError{
                print("Failed to parse JSON object properly ", jsonError )
            }
            
            
        })
        task.resume()

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BookCell
        
        let book = books?[indexPath.row]
        cell.book = book
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedBook = self.books?[indexPath.row]
        
        
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
    
    


}

