//
//  PageCell.swift
//  KindleBook
//
//  Created by 2x2 on 11/6/18.
//  Copyright © 2018 2x2. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    let textLabel: UITextView = {
        let label = UITextView()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Hoc enim identidem dicitis, non intellegere nos quam dicatis voluptatem. At vero Callipho et post eum Diodorus, cum is alter voluptatem adamavisset, alter vacuitatem doloris, neuter honestate carere potuit, quae est a nostris laudata maxime. Alteri negant quicquam esse bonum, nisi quod honestum sit, alteri plurimum se et longe longeque plurimum tribuere honestati, sed tamen et in corpore et extra esse quaedam bona. Eodem modo is enim tibi nemo dabit, quod, expetendum sit, id esse laudabile. Nunc idem, nisi molestum est, quoniam tibi non omnino displicet definire et id facis, cum vis, velim definias quid sit voluptas, de quo omnis haec quaestio est. Duo Reges: constructio interrete. Inde sermone vario sex illa a Dipylo stadia confecimus. Nihil enim desiderabile concupiscunt, plusque in ipsa iniuria detrimenti est quam in iis rebus emolumenti, quae pariuntur iniuria. Quod si ita se habeat, non possit beatam praestare vitam sapientia. Et summatim quidem haec erant de corpore animoque dicenda, quibus quasi informatum est quid hominis natura postulet. Et hi quidem ita non sola virtute finem bonorum contineri putant, ut rebus tamen omnibus virtutem anteponant; Nec vero dico eorum metum mortis, qui, qust extremum omnium appetendorum atque ductum a prima commendatione naturae, multis gradibus adscendit, ut ad summum perveniret, quod cumulatur ex integritate corporis et ex mentis ratione perfecta. Hoc autem tempore, etsi multa in omni parte Athenarum sunt in ipsis locis indicia summorum virorum, tamen ego illa moveor exhedra. Haec mirabilia videri"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.justified
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLabel)
        
        textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        textLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
