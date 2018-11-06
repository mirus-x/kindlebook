//
//  BookCell.swift
//  KindleBook
//
//  Created by 2x2 on 11/5/18.
//  Copyright © 2018 2x2. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell{
    //Creating closures for our custom BookCell
    
    let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Very, very, very, very long title for the book"
        label.backgroundColor = .blue
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.text = " Autor name"
        label.backgroundColor = .blue
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        print("Cell is beingn initialised")
        
        addSubview(coverImageView)
        coverImageView.frame = CGRect(x: 8, y: 8, width: 50, height: 64)
        
        addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 66, y: 20, width: 200, height: 20)
        
        addSubview(authorLabel)
        authorLabel.frame = CGRect(x: 66, y: 42, width: 200, height: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
