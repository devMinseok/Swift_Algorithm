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

// MARK: - 벌집
func honeycomb() {
    var num = Int(readLine()!)!
    var cnt = 1
    
    while num > 1 {
        num -= (6 * cnt)
        cnt += 1
    }
    print(cnt)
}

//honeycomb()

// MARK: - 분수찾기

/*
x/y 라고 할때

if y == 1 {
    if (x + y) == 짝수 {
        오른쪽 위로
    } else {
        밑으로
    }
} else {
    if (x + y) == 짝수 {
        오른쪽으로
    } else {
        왼쪽 아래로
    }
}
 */

func findFraction() {
    let num = Int(readLine()!)!
    var x = 2
    var y = 1
  
    if num <= 2 {
        print("1/\(num)")
        return
    }
    
    for _ in 3..<num {
        if y == 1 {
            if (x + y) % 2 == 0 { //오른쪽 위로
                x -= 1
                y += 1
            } else { // 밑으로
                x += 1
            }
        } else {
            if (x + y) % 2 == 0 { // 오른쪽으로
                y += 1
            } else { // 왼쪽 아래로
                x += 1
                y -= 1
            }
        }
    }
    
    print("\(x)/\(y)")
}

findFraction()
