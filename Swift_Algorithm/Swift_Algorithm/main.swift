//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

// MARK: - 204p 연습문제 Q1 | 버블정렬 (왼쪽에서 오른쪽으로 교환)
class BubbleSort {
    var arr: [Int]
    
    init(arr: [Int]) {
        self.arr = arr
    }
    
    func swap(_ idx1: Int, _ idx2: Int) {
        let temp = arr[idx1]
        arr[idx1] = arr[idx2]
        arr[idx2] = temp
    }
    
    func bubbleSort() {
        let n = arr.count
        for i in 0..<(n - 1) {
            for j in 0..<((n - 1) - i) {
                if arr[j] > arr[j + 1] {
                    self.swap(j, j + 1)
                }
            }
        }
    }
    
    func dump() {
        print(self.arr)
    }
}

/*
let bubbleSort = BubbleSort(arr: [3, 2, 1, 6, 7, 8, 5, 9, 4])
bubbleSort.bubbleSort()
bubbleSort.dump()
 */


