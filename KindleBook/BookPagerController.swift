//
//  BookPagerController.swift
//  KindleBook
//
//  Created by 2x2 on 11/6/18.
//  Copyright © 2018 2x2. All rights reserved.
//

import UIKit

class BookPagerController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var book: Book?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        navigationItem.title = self.book?.title
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0
        collectionView?.isPagingEnabled = true
        
        let leftButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector (self.handleCloseBook))
        leftButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.white], for: UIControl.State.focused)
        leftButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.white], for: .normal)
        
        self.navigationItem.leftBarButtonItem = leftButton
        
        
        setupNavigationBarStyles()
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    func setupNavigationBarStyles(){
        print("Setup Navigation bar styles ...")
        navigationController?.navigationBar.barTintColor = Colors.darkGrey
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.white]
    }
    
    
    @objc func handleCloseBook(){
        dismiss(animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)->CGSize{
        return CGSize(width: view.frame.width, height: view.frame.height - 44 - 20)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.pages?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // to get textlabel closure form our PageCell class we need to downcast it to our pageCell variable
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = book?.pages?[indexPath.item]
        pageCell.textLabel.text = page?.text
        return pageCell
    }
}

extension UICollectionViewController{
    override open var preferredStatusBarStyle: UIStatusBarStyle{
        get{
            return .lightContent
        }
    }
}
