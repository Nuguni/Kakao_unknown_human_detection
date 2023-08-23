//
//  Test.swift
//  Nuguni
//
//  Created by 이영준 on 2023/08/17.
//

import UIKit

struct Test {
    let personImage: String
    let personName: String
}

struct Test2: Encodable{
    let phoneNumber: String
    let name: String
}

extension Test {
    static var data = [
        Test(personImage: "1", personName: "이현우"),
        Test(personImage: "2", personName: "서영원"),
        Test(personImage: "3", personName: "진소정"),
        Test(personImage: "4", personName: "여신호"),
        Test(personImage: "5", personName: "황제현"),
        Test(personImage: "6", personName: "송진우"),
        Test(personImage: "7", personName: "박민용"),
        Test(personImage: "8", personName: "한결같은남자CG"),
        Test(personImage: "9", personName: "조규상"),
        Test(personImage: "10", personName: "이제훈"),
        Test(personImage: "10", personName: "진현준"),
        Test(personImage: "10", personName: "Piy"),
        Test(personImage: "10", personName: "찬호형"),
        Test(personImage: "10", personName: "주찬"),
        Test(personImage: "10", personName: "진하형_뱃져"),
        Test(personImage: "10", personName: "최보현"),
        Test(personImage: "10", personName: "창서"),
        Test(personImage: "10", personName: "최상민"),
        Test(personImage: "10", personName: "최세윤"),
        Test(personImage: "10", personName: "최승준"),
        Test(personImage: "10", personName: "코인_이주화"),
        Test(personImage: "10", personName: "표예나"),
        Test(personImage: "10", personName: "하동훈"),
        Test(personImage: "10", personName: "김혜영"),
        Test(personImage: "10", personName: "한상익"),
        Test(personImage: "10", personName: "해준"),
        Test(personImage: "10", personName: "노형준"),
        Test(personImage: "10", personName: "황재선"),
        Test(personImage: "10", personName: "하석호"),
        Test(personImage: "10", personName: "세윤아범")
    ]
}
