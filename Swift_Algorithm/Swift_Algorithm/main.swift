//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

// MARK: - 손익분기점 (Break-Even-Point)
func BEP() {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }

    /// 고정 비용
    let A = nums[0]
    
    /// 가변 비용
    let B = nums[1]
    
    /// 판매 가격
    let C = nums[2]

    if C <= B {
        print(-1)
        return
    }

    print((A / (C - B)) + 1) // (고정 비용 / 이익) + 1
}

//BEP()
