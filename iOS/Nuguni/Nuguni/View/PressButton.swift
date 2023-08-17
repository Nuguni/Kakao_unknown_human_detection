//
//  PressButton.swift
//  Nuguni
//
//  Created by 이영준 on 2023/08/18.
//

import UIKit

class PressButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        self.titleLabel?.font = .boldSystemFont(ofSize: 14)
        
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 40
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 6
    }
}
