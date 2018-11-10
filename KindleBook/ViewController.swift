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
        setupNavigationBarStyles()
        setupNavBarButtons()
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = Colors.lightGrey
        tableView.separatorColor = Colors.separatorColor
        
        navigationItem.title = "Kindle"
        
        fetchBooks()
        
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = Colors.darkGrey
        
        let segmentedControl = UISegmentedControl(items: ["Cloud", "Device"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = Colors.lightGrey
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.white], for: UIControl.State.selected)
        segmentedControl.selectedSegmentIndex = 0
        footerView.addSubview(segmentedControl)
        
        segmentedControl.widthAnchor.constraint(equalToConstant: 180).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 25).isActive = true
        segmentedControl.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        let gridButton = UIButton(type: .system)
        let gridImage = UIImage(named: "grid")!
        gridButton.setImage(gridImage.withRenderingMode(.alwaysOriginal), for: .normal)
        gridButton.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(gridButton)
        
        gridButton.leftAnchor.constraint(equalTo: footerView.leftAnchor, constant: 15).isActive = true
        gridButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        gridButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        
        
        let sortButton = UIButton(type: .system)
        let sortImage = UIImage(named: "sort")!
        sortButton.setImage(sortImage.withRenderingMode(.alwaysOriginal), for: .normal)
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(sortButton)
        
        sortButton.rightAnchor.constraint(equalTo: footerView.rightAnchor, constant: -15).isActive = true
        sortButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        sortButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        
        
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func setupNavBarButtons(){
        let menuIcon: UIImage = {
            let menuIcon = UIImage(named: "menu")
            return menuIcon!
        }()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image:  menuIcon.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuPress))
        
        let amazonIcon: UIImage = {
            let amazonIcon = UIImage(named: "amazon_icon")
            return amazonIcon!
        }()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: amazonIcon.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAmazonIconPress))
        
    }
    
    @objc func handleAmazonIconPress(){
        let url = URL(string: "https://www.amazon.com")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    @objc func handleMenuPress(){
        print("Menu button pressed...")
    }
    
    func setupNavigationBarStyles(){
        print("Setup Navigation bar styles ...")
        navigationController?.navigationBar.barTintColor = Colors.darkGrey
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.white]
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
        
        //setup controller for our pageController
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
    
//    func tableView(_ tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
//        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
//            cell.backgroundColor = UIColor.greenColor()
//        }
//    }

    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            cell.backgroundColor = Colors.lighterGrey
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            cell.backgroundColor = Colors.lightGrey
        }

    }
    

}

