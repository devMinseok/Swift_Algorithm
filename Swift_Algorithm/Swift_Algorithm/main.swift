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
func findFraction() {
    let num = Int(readLine()!)!
    var x = 1
    var y = 1
    
    var flag = 1
    for _ in 1..<num {
        if x == 1 || y == 1 {
            if (x + y) % 2 == 0 { // 오른쪽 or 오른쪽 위로
                y += 1 // 공통
                if x != 1 { // 위로 갈것인가?
                    x -= 1
                }
                flag = 1
            } else { // 아래로 or 왼쪽 아래로
                x += 1 // 공통
                if y != 1 { // 왼쪽으로 갈것인가?
                    y -= 1
                }
                flag = 2
            }
        } else {
            if flag == 1 {
                y += 1 // 공통
                if x != 1 { // 위로 갈것인가?
                    x -= 1
                }
                flag = 1
            } else {
                x += 1 // 공통
                if y != 1 { // 왼쪽으로 갈것인가?
                    y -= 1
                }
                flag = 2
            }
        }
    }
    
    print("\(x)/\(y)")
}

//findFraction()

// MARK: - 달팽이는 올라가고 싶다
func snail() {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    
    let A = nums[0] // 달팽이가 하루동안(낮) 올라가는 거리
    let B = nums[1] // 달팽이가 하루동안(밤) 내려가는(미끄러지는) 거리
    var V = nums[2] // 달팽이가 올라갈 막대기의 높이
    
    var day = 0 // 달팽이가 막대기의 정상에 다다르는 일수
    let dayDist = A - B // 하루동안 갈 수 있는 거리(올라가는 거리 - 내려가는 거리)
    
    /// 밤이 되기전에 정상에 올라갈 것이기에
    V -= A // 하루동안 올라가는 거리를 빼고
    day += 1 // 하루를 추가
    
    day += (V / dayDist) // dayDist에 막대기의 높이를 나눈값을 일수에 더함
    
    day += (V % dayDist) > 0 ? 1 : 0 // dayDist와 막대기 높이의 나머지값이 있다면 하루를 추가
    
    print(day)
}

//snail()

// MARK: - ACM 호텔
func ACMHotel() {
    let T = Int(readLine()!)!
    
    for _ in 0..<T {
        let nums = readLine()!.split(separator: " ").map { Int($0)! }
        
        let H = nums[0] // 호텔의 층 수
//        let W = nums[1] // 각 층의 방 수
        let N = nums[2] // 몇 번째 손님인지
        
        var Y = N % H
        Y *= Y < 0 ? -1 : 1
        Y += Y == 0 ? H : 0
        
        var X = (N / H)
        X += (N % H > 0) ? 1 : 0
        
        if X < 10 {
            print("\(Y)0\(X)")
        } else {
            print("\(Y)\(X)")
        }
    }
}

ACMHotel()
