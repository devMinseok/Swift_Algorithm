//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

func statistics() {
    var arithAvg: Int!
    let middleValue: Int!
    let freValue: Int!
    let range: Int!
    var arr = [Int]()
    
    let N = Int(readLine()!)!
    
    for _ in 0..<N {
        arr.append(Int(readLine()!)!)
    }

// MARK: - 산술평균 : N개의 수들의 합을 N으로 나눈 값
    arithAvg = 0
    for i in arr {
        arithAvg += i
    }
    
    let a = Double(arithAvg) / Double(N)
    arithAvg = Int(round(a))
    
// MARK: - 중앙값 : N개의 수들을 증가하는 순서로 나열했을 경우 그 중앙에 위치하는 값
    arr.sort()
    middleValue = arr[arr.count / 2]
    
// MARK: - 최빈값 : N개의 수들 중 가장 많이 나타나는 값
    var sum = [Int : Int]()
    for i in arr {
        if sum[i] != nil {
            sum[i]! += 1
        } else {
            sum[i] = 1
        }
    }
    
    var tmp = Array(repeating: Array(repeating: 0, count: 0), count: (sum.max { $0.value < $1.value }!.value))
    
    for (key, value) in sum {
        tmp[(value - 1)].append(key)
    }
    
    tmp[(tmp.count - 1)].sort()
    
    if tmp[(tmp.count - 1)].count >= 2 {
        freValue = tmp[(tmp.count - 1)][1]
    } else {
        freValue = tmp[(tmp.count - 1)][0]
    }
    
// MARK: - 범위 : N개의 수들 중 최댓값과 최솟값의 차이
    range = arr.max()! - arr.min()!
    
    print(arithAvg ?? 0)
    print(middleValue ?? 0)
    print(freValue ?? 0)
    print(range ?? 0)
}

statistics()
