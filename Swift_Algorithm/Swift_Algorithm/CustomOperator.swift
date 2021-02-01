//
//  CustomOperator.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2021/02/01.
//  Copyright © 2021 MinseokKang. All rights reserved.
//

import Foundation

// MARK: - 증감연산자 구현
extension Int {
    mutating func increase() {
        self+=1
    }

    mutating func decrease() {
        self-=1
    }
}

postfix func ++ (number: inout Int) -> Int {
    number.increase()
    return number - 1
}

postfix func -- (number: inout Int) -> Int {
    number.decrease()
    return number + 1
}
