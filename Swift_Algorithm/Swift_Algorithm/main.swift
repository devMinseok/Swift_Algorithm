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

// MARK: - 61p 연습문제 Q2 / 배열의 요소를 역순으로
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

// MARK: - 61p 연습문제 Q3 / 배열의 모든 요소의 합계 구하기
func sumOf() {
    
    var arr = [Int]()
    
    print("10개의 요소를 입력해주세요.")
    for _ in 1...10 {
        arr.append(Int(readLine()!)!)
    }
    
    var sum = 0
    for i in arr {
        sum += i
    }
    
    print("입력하신 요소들의 합은 \(sum)입니다.")
}

//sumOf()

// MARK: - 64p 연습문제 Q4 / 배열 a의 모든 요소를 배열 b에 복사
func copy() {
    var a = [Int]()
    var b = [Int]()
    
    print("배열의 크기는?: ", terminator: "")
    let length = Int(readLine()!)!
    
    for _ in 0..<length {
        a.append(Int.random(in: 1...100))
    }
    
    print("a 배열: \(a)")
    
    for i in a {
        b.append(i)
    }
    
    print("b 배열: \(b)")
}

//copy()

// MARK: - 64p 연습문제 Q5 / 배열 a의 모든 요소를 배열 b에 역순으로 복사

func rcopy() {
    var a = [Int]()
    var b = [Int]()
    
    print("배열의 크기는?: ", terminator: "")
    let length = Int(readLine()!)!
    
    for _ in 0..<length {
        a.append(Int.random(in: 1...100))
    }
    
    print("a 배열: \(a)")
    
    for i in 0..<length {
        b.append(a[length - i - 1])
    }
    
    print("b 배열: \(b)")
}

//rcopy()

// MARK: - 83p 연습문제 Q9 / 그 해 경과 일수와 그 해 남은 일 수 구하기

let mDays = [
    [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
    [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
]

func isLeap(year: Int) -> Int {
    // 윤년은 4로 나누어 떨어져야하고 100으로 나누어 떨어지면 안된다. 또는 400으로 나누어 떨어져야한다.
    return ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)) ? 1 : 0
}

/// 그 해 경과 일 수
func dayOfYear() {
    print("그 해 경과 일 수를 구할 날짜를 yyyy.MM.dd 형식으로 입력해주세요.")
    let input = readLine()!.components(separatedBy: ".")
    
    let year = Int(input[0])! // yyyy
    let month = Int(input[1])! // MM
    var day = Int(input[2])! // dd
    
    for i in 1..<month {
        day += mDays[isLeap(year: year)][i - 1]
    }
    
    print("그 해 \(day)일째입니다.")
}

//dayOfYear()

/// 그 해 남은 일 수
func leftDayOfYear() {
    print("그 해 남은 일 수를 구할 날짜를 yyyy.MM.dd 형식으로 입력해주세요.")
    let input = readLine()!.components(separatedBy: ".")
    
    let year = Int(input[0])! // yyyy
    let month = Int(input[1])! // MM
    var day = Int(input[2])! // dd
    
    let isLeapYear = isLeap(year: year)
    
    for i in 1..<month {
        day += mDays[isLeapYear][i - 1]
    }
    
    print("그 해 \((isLeapYear == 0 ? 365 : 366) - day)일 남았습니다.")
}

//leftDayOfYear()

// MARK: -
