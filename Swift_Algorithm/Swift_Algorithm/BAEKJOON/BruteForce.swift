//
//  BruteForce.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2021/03/01.
//  Copyright © 2021 MinseokKang. All rights reserved.
//

/*
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

// MARK: - 분해합
func decomposeSum() {
    let N = Int(readLine()!)!
    
    for i in 1..<N {
        var sum = i
        
        let S = String(i)
        for index in S.indices {
            sum += Int(String(S[index]))!
        }
        
        if sum == N {
            print(i)
            return
        }
    }
    
    print(0)
}

//decomposeSum()

// MARK: - 덩치
func build() {
    var N = Int(readLine()!)!
    
    var arr = [[Int]]()
    
    while N > 0 {
        let nums = readLine()!.split(separator: " ").map { Int($0)! }
        arr.append([nums[0], nums[1], 0])
        N -= 1
    }
    
    N = arr.count
    
    for i in 0..<N {
        var bigCnt = 1
        for j in 0..<N {
            let x = arr[i][0]
            let y = arr[i][1]
            let nX = arr[j][0]
            let nY = arr[j][1]
            
            if x < nX && y < nY {
                bigCnt += 1
            }
        }
        arr[i][2] = bigCnt
    }
    
    for i in 0..<N {
        print(arr[i][2], terminator: " ")
    }
}

//build()

// MARK: - 체스판 다시 칠하기
func a(arr: [[String]], f: Int, s: Int, flag: String) -> Int {
    var cnt = 0
    var flag = flag
    for i in f-8..<f {
        for j in s-8..<s {
            // 예상과 다른 색이라면 Cnt를 1증가
            if arr[i][j] != flag {
                cnt += 1
            }
            flag = flag == "W" ? "B" : "W"
        }
        flag = flag == "W" ? "B" : "W"
    }
    return cnt
}

func chess() {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    let N = nums[0]
    let M = nums[1]
    
    var arr = Array(repeating: Array(repeating: "", count: 0), count: N)
    var total = [Int]()
    
    for i in 0..<N {
        let S = readLine()!
        for index in S.indices {
            arr[i].append(String(S[index]))
        }
    }
    
    // B 플래그의 경우
    for i in 8...N {
        for j in 8...M {
            total.append(a(arr: arr, f: i, s: j, flag: "B"))
        }
    }
    
    // W 플래그의 경우
    for i in 8...N {
        for j in 8...M {
            total.append(a(arr: arr, f: i, s: j, flag: "W"))
        }
    }
    
    print(total.min()!)
}

//chess()

// MARK: - 영화감독 숌
func director() {
    var N = Int(readLine()!)!
    var movieName = 666
    
    while N > 1 {
        movieName += 1
        var tmp = movieName
        while tmp >= 666 {
            if tmp % 1000 == 666 {
                N -= 1
                break
            }
            tmp /= 10
        }
    }
    
    print(movieName)
}

//director()
 */
