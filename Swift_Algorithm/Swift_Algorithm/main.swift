//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

// MARK: - 통계학
func statistics() {
    var arithAvg = 0
    let freValue: Int!
    var arr = [Int]()
    
    let N = Int(readLine()!)!
    
    for _ in 0..<N {
        arr.append(Int(readLine()!)!)
    }

    // 산술평균 : N개의 수들의 합을 N으로 나눈 값
    arithAvg = arr.reduce(0, +)
    let result = Double(arithAvg) / Double(N)
    arithAvg = Int(result.rounded())
    
    // 중앙값 : N개의 수들을 증가하는 순서로 나열했을 경우 그 중앙에 위치하는 값
    arr.sort()
    let middleValue = arr[arr.count / 2]
    
    // 최빈값 : N개의 수들 중 가장 많이 나타나는 값
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
    
    let lIndex = tmp.count - 1
    tmp[lIndex].sort()
    freValue = tmp[lIndex].count >= 2 ? tmp[lIndex][1] : tmp[lIndex][0]
    
    // 범위 : N개의 수들 중 최댓값과 최솟값의 차이
    let range = arr.max()! - arr.min()!
    
    print(arithAvg)
    print(middleValue)
    print(freValue ?? 0)
    print(range)
}

//statistics()

// MARK: - 소트인사이드
func sortInside() {
    var N = readLine()!.map { Int(String($0))! }

    N.sort()
    N.reverse()

    for i in N {
        print(i, terminator: "")
    }
}

//sortInside()

// MARK: - 좌표 정렬하기
func alignCoordinate() {
    let N = Int(readLine()!)!
    var arr = [[Int]]()
    
    for _ in 0..<N {
        let nums = readLine()!.split(separator: " ").map { Int($0)! }
        arr.append(nums)
    }
    
    arr.sort { (lhs, rhs) -> Bool in
        if lhs[0] == rhs[0] {
            return lhs[1] < rhs[1]
        }
        return lhs[0] < rhs[0]
    }
    
    for i in arr {
        print(i[0], i[1])
    }
}

//alignCoordinate()

// MARK: - 단어 정렬
func wordSort() {
    let N = Int(readLine()!)!
    var set = Set<String>()
    var arr = [String]()
    
    for _ in 0..<N {
        set.insert(readLine()!)
    }
    
    for value in set {
        arr.append(value)
    }
    
    arr.sort { (lhs, rhs) -> Bool in
        if lhs.count == rhs.count {
            return lhs < rhs
        }
        return lhs.count < rhs.count
    }
    
    for i in arr {
        print(i)
    }
}

//wordSort()

// MARK: - 나이순 정렬
func sortByAge() {
    let N = Int(readLine()!)!
    var registers = [(Int, String, Int)]() // 나이, 이름, 가입 순서
    
    for i in 0..<N {
        let input = readLine()!.split(separator: " ").map { String($0) }
        registers.append((Int(input[0])!, input[1], i))
    }
    
    registers.sort { (lhs, rhs) -> Bool in
        if lhs.0 == rhs.0 { // 나이가 같으면
            return lhs.2 < rhs.2 // 가입한 순서로 정렬
        }
        return lhs.0 < rhs.0 // 나이 순서로 정렬
    }
    
    for i in registers {
        print(i.0, i.1)
    }
}

//sortByAge()
