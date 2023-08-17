//
//  ViewController.swift
//  Nuguni
//
//  Created by 이영준 on 2023/08/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var kakaoLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var verifyButton: UIButton!
    @IBOutlet weak var kakaoCollectionView: UICollectionView!
    @IBOutlet weak var phoneCollectionView: UICollectionView!
    
    @IBAction func tapRequestButton(_ sender: UIButton) {
        self.testList = Test.data
    }
    
    @IBAction func tapVerifyButton(_ sender: UIButton) {
        existingDifferentNameAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        configureCollectionView()
    }
    
    var testList: [Test] = [] {
        didSet {
            kakaoCollectionView.reloadData()
        }
    }
    let cellName = "PersonInfoCell"
    let cellReuseIdentifier = "PersonInfoCell"
    
    let testList2 = Test2.data
    let cellName2 = "PhoneInfoCell"
    let cellReuseIdentifier2 = "PhoneInfoCell"
    
    private func layout() {
        
        self.view.backgroundColor = .black
        
        self.titleLabel.textColor = .white
        self.titleLabel.font = .boldSystemFont(ofSize: 24)
        self.titleLabel.adjustsFontSizeToFitWidth = true
        
        self.kakaoLabel.textColor = .white
        self.kakaoLabel.font = .boldSystemFont(ofSize: 20)
        self.kakaoLabel.adjustsFontSizeToFitWidth = true

        self.phoneLabel.textColor = .white
        self.phoneLabel.font = .boldSystemFont(ofSize: 20)
        self.phoneLabel.adjustsFontSizeToFitWidth = true
        
        self.requestButton.backgroundColor = .systemGray6
        self.requestButton.layer.cornerRadius = 45
        self.requestButton.layer.shadowColor = UIColor.white.cgColor
        self.requestButton.layer.shadowOpacity = 1.0
        self.requestButton.layer.shadowOffset = CGSize.zero
        self.requestButton.layer.shadowRadius = 6
        
        self.verifyButton.backgroundColor = .systemGray6
        self.verifyButton.layer.cornerRadius = 45
        self.verifyButton.layer.shadowColor = UIColor.white.cgColor
        self.verifyButton.layer.shadowOpacity = 1.0
        self.verifyButton.layer.shadowOffset = CGSize.zero
        self.verifyButton.layer.shadowRadius = 6
    }
    
    private func configureCollectionView() {
        self.registerXib()
        self.kakaoCollectionView.delegate = self
        self.kakaoCollectionView.dataSource = self
        self.phoneCollectionView.delegate = self
        self.phoneCollectionView.dataSource = self
        
        // kakao
        if let layout = kakaoCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        self.kakaoCollectionView.backgroundColor = .clear
        
        // phone
        if let layout = phoneCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        self.phoneCollectionView.backgroundColor = .clear
        self.phoneCollectionView.layer.cornerRadius = 10
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: cellName, bundle: nil)
        kakaoCollectionView.register(nibName, forCellWithReuseIdentifier: cellReuseIdentifier)
        
        let nibName2 = UINib(nibName: cellName2, bundle: nil)
        phoneCollectionView.register(nibName2, forCellWithReuseIdentifier: cellReuseIdentifier2)
    }
    
    private func existingDifferentNameAlert() {
        let alert = UIAlertController(title: "Verify Result", message: "There are 5 unrecognized IDs", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Confirm", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alert.addAction(confirm)
        self.present(alert, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == kakaoCollectionView {
            return testList.count
        } else {
            return testList2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == kakaoCollectionView {
            guard let cell = kakaoCollectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? PersonInfoCell else { return UICollectionViewCell() }
            
            cell.layer.cornerRadius = 20
            
            let target = testList[indexPath.row]
            let img = UIImage(named: "test\(target.personImage)")
            
            cell.personImage?.image = img
            cell.personImage?.contentMode = .scaleToFill
            cell.personName?.text = target.personName
            return cell
            
        } else {
            guard let cell = phoneCollectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier2, for: indexPath) as? PhoneInfoCell else { return UICollectionViewCell() }
            cell.layer.cornerRadius = 20
            let target = testList2[indexPath.row]
            
            cell.phoneName?.text = target.personName
            cell.phoneNumber?.text = target.personNumber
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == kakaoCollectionView {
            return CGSize(width: 180, height: 210)
        } else {
            return CGSize(width: UIScreen.main.bounds.width - 60, height: 40)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

