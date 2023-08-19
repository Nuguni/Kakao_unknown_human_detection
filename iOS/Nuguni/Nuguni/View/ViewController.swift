//
//  ViewController.swift
//  Nuguni
//
//  Created by 이영준 on 2023/08/17.
//

import Contacts
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var kakaoLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var verifyButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var kakaoCollectionView: UICollectionView!
    @IBOutlet weak var phoneCollectionView: UICollectionView!
    
    let cellName = "PersonInfoCell"
    let cellReuseIdentifier = "PersonInfoCell"
    let cellName2 = "PhoneInfoCell"
    let cellReuseIdentifier2 = "PhoneInfoCell"
    
    @IBAction func tapRequestButton(_ sender: UIButton) {
        self.testList = Test.data
    }
    
    @IBAction func tapVerifyButton(_ sender: UIButton) {
        self.sendPostRequest()
        print("🤪")
    }
    
    @IBAction func tapPhoneButton(_ sender: UIButton) {
        self.readAddress()
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
    
    var phoneBook: [Test2] = [] {
        didSet {
            phoneCollectionView.reloadData()
        }
    }
    
    func sendPostRequest() {
        // URI 설정
        let urlString = "http://169.254.202.171:8080/contacts"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        // 요청 데이터 생성
        let requestData: [Test2] = phoneBook
        
        do {
            let jsonData = try JSONEncoder().encode(requestData)
            
            // URLRequest 생성
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            // URLSession을 이용하여 요청 보내기
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                if let data = data {
                    // 응답 데이터 처리
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                    }
                }
            }
            task.resume()
        } catch {
            print("JSON Serialization Error: \(error)")
        }
    }
    
    // 전화번호 주소록 접근 객체
    let phoneStore = CNContactStore()
    
    private func readAddress() {
        
        self.phoneStore.requestAccess(for: .contacts) { (granted, error) in
            guard granted
            else {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "알림", message: "전화번호부 접근 권한을 허용해주세요.", preferredStyle: .alert)
                    let okBtn = UIAlertAction(title: "확인", style: .default) { (action) in
                        alert.dismiss(animated: true, completion: nil)
                        // [사용자 앱 설정창 이동 수행 실시]
                        let settingsURL = NSURL(string: UIApplication.openSettingsURLString)! as URL
                        UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                    }
                    let noBtn = UIAlertAction(title: "취소", style: .cancel) { (action) in
                        // [팝업창 닫기]
                        alert.dismiss(animated: true, completion: nil)
                    }
                    alert.addAction(okBtn)
                    alert.addAction(noBtn)
                    self.present(alert, animated: true, completion: nil)
                }
                return
            }
            
            // Request 생성: 전화번호 주소록에서 알아오려는 key 지정
            let request: CNContactFetchRequest = self.getCNContactFetchRequest()
            
            // 주소록 읽을 때 정렬 실시
            request.sortOrder = CNContactSortOrder.userDefault
            
            try! self.phoneStore.enumerateContacts(with: request, usingBlock: { (contact, stop) in
                if contact.phoneNumbers.isEmpty == false {
                    let name = contact.familyName + contact.givenName
                    let phone = contact.phoneNumbers[0].value.value(forKey: "digits") ?? ""
                    let tmpPhone = Test2(phoneNumber: phone as! String, name: name)
                    
                    Task {
                        await self.phoneBook.append(tmpPhone)
                    }
                }
            })
        }
    }
    
    private func getCNContactFetchRequest() -> CNContactFetchRequest {
            // [주소록에서 읽어올 key 설정]
        let keys: [CNKeyDescriptor] = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName), // 이름
                                       CNContactPhoneNumbersKey, // 전화번호
//                                       CNContactEmailAddressesKey, // 이메일
//                                       CNContactJobTitleKey, // 직장
//                                       CNContactImageDataAvailableKey, // 이미지
//                                       CNContactThumbnailImageDataKey, // 이미지
//                                       CNContactPostalAddressesKey
        ] as [Any] as! [CNKeyDescriptor]
        return CNContactFetchRequest(keysToFetch: keys)
    }
    
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
        
        self.verifyButton.backgroundColor = .blue
        self.verifyButton.titleLabel?.textColor = .systemGray6
        self.verifyButton.layer.cornerRadius = 45
        self.verifyButton.layer.shadowColor = UIColor.white.cgColor
        self.verifyButton.layer.shadowOpacity = 1.0
        self.verifyButton.layer.shadowOffset = CGSize.zero
        self.verifyButton.layer.shadowRadius = 6
        
        self.phoneButton.backgroundColor = .systemGray6
        self.phoneButton.layer.cornerRadius = 45
        self.phoneButton.layer.shadowColor = UIColor.white.cgColor
        self.phoneButton.layer.shadowOpacity = 1.0
        self.phoneButton.layer.shadowOffset = CGSize.zero
        self.phoneButton.layer.shadowRadius = 6
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
        let alert = UIAlertController(title: "Verify Result", message: "There are xx unrecognized IDs", preferredStyle: .alert)
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
            return phoneBook.count
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
            let target = phoneBook[indexPath.row]
            
            cell.phoneName?.text = target.name
            cell.phoneNumber?.text = target.phoneNumber
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

