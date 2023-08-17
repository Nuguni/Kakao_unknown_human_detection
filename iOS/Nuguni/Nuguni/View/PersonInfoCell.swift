//
//  PersonInfoCell.swift
//  Nuguni
//
//  Created by 이영준 on 2023/08/17.
//

import UIKit

class PersonInfoCell: UICollectionViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var personName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        self.personName?.textColor = .white
        self.personName?.font = .boldSystemFont(ofSize: 18)
        self.personName?.textAlignment = .center
    }
}
