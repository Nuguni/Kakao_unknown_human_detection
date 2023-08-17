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

struct Test2 {
    let personNumber: String
    let personName: String
}

extension Test {
    static var data = [
        Test(personImage: "1", personName: "ㄱ하주성"),
        Test(personImage: "2", personName: "ㄱ이대호"),
        Test(personImage: "3", personName: "오늘은?"),
        Test(personImage: "4", personName: "박찬호"),
        Test(personImage: "5", personName: "오재원"),
        Test(personImage: "6", personName: "박건우"),
        Test(personImage: "7", personName: "양준혁"),
        Test(personImage: "8", personName: "양의지"),
        Test(personImage: "9", personName: "이영준"),
        Test(personImage: "10", personName: "여신호"),
    ]
}

extension Test2 {
    static var data = [
        Test2(personNumber: "01011111111", personName: "여신호"),
        Test2(personNumber: "01022222222", personName: "이영준"),
        Test2(personNumber: "01033333333", personName: "방종호"),
        Test2(personNumber: "01044444444", personName: "송진우"),
        Test2(personNumber: "01055555555", personName: "임저상"),
        Test2(personNumber: "01066666666", personName: "주우개"),
        Test2(personNumber: "01077777777", personName: "송부엉"),
        Test2(personNumber: "01088888888", personName: "양죽무"),
        Test2(personNumber: "01099999999", personName: "박찬호"),
        Test2(personNumber: "01010101010", personName: "오재원"),
    ]
}
