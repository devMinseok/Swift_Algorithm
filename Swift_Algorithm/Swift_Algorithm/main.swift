//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

// MARK: - 블랙잭
func blackjack() {
    
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    let N = nums[0]
    let M = nums[1]
    
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    var sum = 0
    var max = 0
    
    for i in 0..<(N - 2) {
        for j in (i + 1)..<(N - 1) {
            for k in (j + 1)..<N {
                sum = arr[i] + arr[j] + arr[k]
                if sum == M {
                    print(M)
                    return
                } else if sum < M {
                    if sum > max {
                        max = sum
                    }
                }
            }
        }
    }
    
    print(max)
}

//blackjack()
