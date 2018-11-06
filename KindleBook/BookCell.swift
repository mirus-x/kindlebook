//
//  BookCell.swift
//  KindleBook
//
//  Created by 2x2 on 11/5/18.
//  Copyright © 2018 2x2. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Cell is beingn initialised")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
