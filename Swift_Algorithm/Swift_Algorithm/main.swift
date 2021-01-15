//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

// MARK: - 115p 연습문제 Q1 / 선형검색(보초법)을 while문이 아닌 for문을 활용하여 만들기
func seqSearchSen() {
    
    print("배열 크기 입력: ", terminator: "")
    let length = Int(readLine()!)!
    
    var arr = Array(repeating: 0, count: length + 1)
    
    print("\(length)개의 배열 요소 입력: ")
    for i in 0..<length {
        arr[i] = Int(readLine()!)!
    }
    
    print("찾고자 하는 요소값 입력: ")
    let searchValue = Int(readLine()!)!
    
    arr[length] = searchValue
    
    for i in 0...length {
        if arr[i] == searchValue {
            i == length ? print("해당하는 값을 찾지 못했습니다.") : print("\(i) 인덱스의 \(arr[i])값을 찾았습니다.")
            break
        }
    }
}

//seqSearchSen()


// MARK: - 115p 연습문제 Q2 / 선형 검색의 스캐닝 과정을 상세하게 출력
func seqSearchScan() {
    
    print("배열 크기 입력: ", terminator: "")
    let length = Int(readLine()!)!
    
    var arr = Array(repeating: 0, count: length)
    
    print("\(length)개의 배열 요소 입력: ")
    for i in 0..<length {
        arr[i] = Int(readLine()!)!
    }
    
    print("찾고자 하는 요소값 입력: ", terminator: "")
    let searchValue = Int(readLine()!)!
    
    print("   | ", terminator: "")
    for i in 0..<length {
        print(i, terminator: " ")
    }
    print()
    print("---+--------------------------------------------------")
    
    for i in 0..<length {
        print("   | ", terminator: "")
        for j in 0..<length {
            j == i ? print("*", terminator: " ") : print(" ", terminator: " ")
        }
        print()
        print("  \(i)|", terminator: " ")
        for j in arr {
            print(j, terminator: " ")
        }
        print()
        
        if arr[i] == searchValue {
            print("\(searchValue)은 arr[\(i)]에 있습니다.")
            return
        }
    }
    print("해당하는 값을 찾지 못하였습니다.")
}

//seqSearchScan()
