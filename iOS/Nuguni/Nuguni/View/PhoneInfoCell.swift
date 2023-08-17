//
//  PhoneInfoCell.swift
//  Nuguni
//
//  Created by 이영준 on 2023/08/17.
//

import UIKit

class PhoneInfoCell: UICollectionViewCell {

    @IBOutlet weak var phoneName: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    override func layoutSubviews() {
        self.phoneNumber?.textColor = .black
        self.phoneNumber?.font = .boldSystemFont(ofSize: 16)
        self.phoneNumber?.textAlignment = .center
        self.phoneName?.textColor = .black
        self.phoneName?.font = .boldSystemFont(ofSize: 16)
        self.phoneName?.textAlignment = .center
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.backgroundColor = .white
    }

}
