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
