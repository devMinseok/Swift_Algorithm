//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

// MARK: - N과 M (1)
/*
let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var n = Array(repeating: 0, count: 10)
var ch = Array(repeating: false, count: 10)

func nAndM(_ cnt: Int) {
    // 탈출 조건: cnt가 M과 같아지면 결과를 출력하고 종료
    if cnt == M {
        for i in 0..<M {
            print(n[i], terminator: " ")
        }
        print()
        return
    }
    // 반복 실행: nAndM(cnt + 1)로 cnt를 증가
    else {
        // 1 ~ N개의 경우를 반복
        for i in 1...N {
            if ch[i] == true {
                continue
            }
            ch[i] = true
            n[cnt] = i
            nAndM(cnt + 1)
            ch[i] = false
        }
    }
}

nAndM(0)
 */

// MARK: - N과 M (2)
/*
let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var arr = Array(repeating: 0, count: 8)

func nAndM(_ cnt: Int, _ selected: Int) {
    if selected == M {
        for i in 0..<M {
            print(arr[i], terminator: " ")
        }
        print()
        return
    }
    
    // 모두 다 x인 경우 종료 (불가능한 경우)
    if cnt > N {
        return
    }
    arr[selected] = cnt // cnt를 결과에 추가 O
    nAndM(cnt + 1, selected + 1)
    arr[selected] = 0 // cnt를 결과에 추가 X
    nAndM(cnt + 1, selected)
}

nAndM(1, 0)
 */

func solution(_ clothes:[[String]]) -> Int {
    var dic = [String : String]()
    var comb = clothes.count
    
    for i in 0..<clothes.count {
        dic[clothes[i][0]] = clothes[i][1]
    }
    
    
    
    
    return 0
}

solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]])
