//
//  ColorPaper(E).swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

//import Foundation
//
//var paper: [[Int]] = Array(repeating: Array(repeating: 0, count: 100), count: 100)
//
//var num = Int(readLine()!)!
//
//for _ in 1...num {
//    let nums = readLine()!.split(separator: " ")
//
//    let tmp1 = Int(nums[0])!
//    let tmp2 = Int(nums[1])!
//
//    for i in 0...9 {
//        paper[tmp1 + i][tmp2] = 1
//        for j in 0...9 {
//            paper[tmp1 + i][tmp2 + j] = 1
//        }
//    }
//}
//
//var count = 0
//
//for i in 0...99 {
//    for j in 0...99 {
//        if paper[i][j] == 1 {
//            count += 1
//        }
//    }
//}
//
//print(count)
