//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

// MARK: - 배열에서 가장 큰 값 찾기
func maxValue() {
    print("키를 비교할 인원수는?: ", terminator: "")
    let length = Int(readLine()!)!
    var arr = Array(repeating: 0, count: length)
    
    for i in 0..<length {
        arr[i] = 100 + Int.random(in: 1...100)
        print("\(i + 1)번의 키: \(arr[i])cm")
    }
    
    var maxNumber = 0
    var maxHeight = arr[0]
    for i in 0..<length {
        if maxHeight < arr[i] {
            maxNumber = i
            maxHeight = arr[i]
        }
    }
    
    print("\(maxNumber + 1)번의 키가 \(maxHeight)cm 로 제일 큽니다.")
}

//maxValue()

// MARK: - 배열의 요소를 역순으로
func reverse() {
    print("배열의 크기는?: ", terminator: "")
    let length = Int(readLine()!)!
    
    var arr = Array(repeating: 0, count: length)
    for i in 0..<length {
        arr[i] = Int.random(in: 1...100)
    }
    
    print("<Original>")
    print(arr)
    print("------------------------------------------------------")
    
    for i in 0..<(length / 2) {
        print("arr[\(i)]과(와) arr[\(length - i - 1)]를 교환합니다.")
        let temp = arr[i]
        arr[i] = arr[length - i - 1]
        arr[length - i - 1] = temp
        print(arr)
    }
    
    print("------------------------------------------------------")
    print("<Reversed>")
    print(arr)
}

//reverse()
