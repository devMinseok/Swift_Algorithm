//
//  03_Search.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2021/01/17.
//  Copyright © 2021 MinseokKang. All rights reserved.
//

/*
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


// MARK: - 117p 연습문제 Q5 / 맨 앞의 요소를 찾는 이진검색

func binSearchX() {
    let arr = [1, 3, 5, 7, 7, 7, 7, 8, 8, 9, 9]
    let key = 7
    
    var pl = 0
    var pr = arr.count
    var pc = 0
    
    repeat {
        pc = (pl + pr) / 2
        
        if arr[pc] == key {
            break
        } else if arr[pc] < key {
            pr = pc - 1
        } else {
            pl = pc + 1
        }
    } while pl <= pr
    
    for i in 0...pc {
        if arr[i] == key {
            print("\(i)인덱스에 key값이 있음")
            return
        }
    }
    
    print("key 값을 찾지 못함")
}

//binSearchX()
*/
