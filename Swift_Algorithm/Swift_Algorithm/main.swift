//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

// MARK: - 170p 연습문제 Q1 / 재귀 메서드 호출을 사용하지 않고 팩토리얼 만들기
func factorial(_ value: Int) {
    var num = 1
    for i in 1...value {
        num *= i
    }
    print("\(value)! => \(num)")
}

//factorial(10)


// MARK: - 170p 연습문제 Q2 / 재귀 메서드 호툴을 사용하지 않고 최대공약수 만들기
func gcd(_ value1: Int, _ value2: Int) {
    var x = value1
    var y = value2
    
    while y != 0 {
        let temp = x
        x = y
        y = temp % y
    }
    
    print("\(value1)와 \(value2)의 최대공약수 => \(x)")
}

//gcd(22, 8)


// MARK: - 170p 연습문제 Q3 / 배열 안의 모든 요소의 최대공약수를 구하기
func gcdR(_ x: Int, _ y: Int) -> Int {
    if y == 0 {
        return x
    }
    return gcdR(y, x % y)
}

func gcdArray(arr: [Int]) {
    if arr.count <= 1 {
        print(arr[0])
        return
    }
    var result = gcdR(arr[0], arr[1])
    for i in 2..<arr.count {
        result = gcdR(result, arr[i])
    }
    print(result)
}

//gcdArray(arr: [22, 8, 4, 2])


// MARK: - 172p 연습문제 Q4 / recur2 메서드를 보고 하향식 분석과 상향식 분석 하기
func recur2(_ n: Int) {
    if n > 0 {
        recur2(n - 2)
        print(n)
        recur2(n - 1)
    }
}

//recur2(4)

/* recur2(4)
 상향식 분석
 recur2(-1): 아무것도 하지않음
 recur2(0): 아무것도 하지않음
 recur2(1): recur2(-1) 1️⃣ recur2(0) => 1️⃣
 recur2(2): recur2(0) 2️⃣ recur2(1) => 2️⃣ 1
 recur2(3): recur2(1) 3️⃣ recur2(2) => 1 3️⃣ 2 1
 recur2(4): recur2(2) 4️⃣ recur2(3) => 2 1 4️⃣ 1 3 2 1
 
 즉, recur2(4)의 결과는 2 1 4 1 3 2 1
 
 하향식 분석은 생략...
 */

// MARK: - 196p 연습문제 Q8 / 8퀸 알고리즘
class Queen {
    var flagA = Array.init(repeating: false, count: 8) // 행
    var flagB = Array.init(repeating: false, count: 15) // / 대각선 | j행 i열의 값은 i + j
    var flagC = Array.init(repeating: false, count: 15) // \ 대각선 | j행 i열의 값은 i - j + 7
    
    var pos = Array.init(repeating: 0, count: 8)
    
    func posPrint() {
        for i in 0..<8 {
            for j in 0..<8 {
                if j == pos[i] {
                    print("🔳", terminator: " ")
                } else {
                    print("⬜️", terminator: " ")
                }
            }
            print()
        }
        print()
    }
    
    func set(_ i: Int) {
        for j in 0..<8 {
            if flagA[j] == false && flagB[i + j] == false && flagC[i - j + 7] == false {
                pos[i] = j
                if i == 7 {
                    posPrint()
                } else {
                    flagA[j] = true
                    flagB[i + j] = true
                    flagC[i - j + 7] = true
                    
                    set(i + 1)
                    
                    flagA[j] = false
                    flagB[i + j] = false
                    flagC[i - j + 7] = false
                }
            }
        }
    }
}

/*
 let queen = Queen()
 queen.set(0)
 */
