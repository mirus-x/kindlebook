//
//  PageCell.swift
//  KindleBook
//
//  Created by 2x2 on 11/6/18.
//  Copyright © 2018 2x2. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quod ait sensibus ipsis iudicari voluptatem bonum esse, dolorem malum, plus tribuit sensibus, quam nobis leges permittunt, cum privatarum litium iudices sumus. Ex quo illud efficitur, qui bene cenent omnis libenter cenare, qui libenter, non continuo bene. Nam ut peccatum est patriam prodere, parentes violare, fana depeculari, quae sunt in effectu, sic timere, sic maerere, sic in libidine esse peccatum est etiam sine effectu. Equidem in omnibus istis conclusionibus hoc putarem philosophia nobisque dignum, et maxime, cum summum bonum quaereremus, vitam nostram, consilia, voluntates, non verba corrigi. Reicietur etiam Carneades, nec ulla de summo bono ratio aut voluptatis non dolendive particeps aut honestatis expers probabitur. Haec mirabilia videri intellego, sed cum certe superiora firma ac vera sint, his autem ea consentanea et consequentia, ne de horum quidem est veritate dubitandum."
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        addSubview(textLabel)
        textLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
