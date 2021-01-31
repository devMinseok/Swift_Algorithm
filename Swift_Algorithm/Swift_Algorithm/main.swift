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
    
    func bubbleSortVer1() {
        let n = arr.count
        for i in 0..<(n - 1) {
            for j in 0..<((n - 1) - i) {
                if arr[j] > arr[j + 1] {
                    self.swap(j, j + 1)
                }
            }
        }
    }
    
    func bubbleSortVer2() {
        let n = arr.count
        
        for i in 0..<(n - 1) {
            var flag = false
            for j in 0..<((n - 1) - i) {
                if arr[j] > arr[j + 1] {
                    flag = true
                    self.swap(j, j + 1)
                }
            }
            if flag == false {
                break
            }
        }
    }
    
    func dump() {
        print(self.arr)
    }
}

/*
let bubbleSort = BubbleSort(arr: [1, 3, 4, 6, 7, 8, 9])
bubbleSort.bubbleSortVer2()
bubbleSort.dump()
 */

// MARK: - 223p 연습문제 Q9 | 셸 정렬
class ShellSort {
    
    var arr: [Int]
    var moveCount = 0
    
    init(arr: [Int]) {
        self.arr = arr
    }
    
    func shellSort() {
        var i = arr.count / 2
        
        while i > 0 {
            for pos in 0..<i {
                insertionSort(start: pos, gap: i)
            }
            i /= 2
        }
    }
    
    func insertionSort(start: Int, gap: Int) {
        for i in stride(from: (start + gap), to: arr.count, by: gap) {
            let currentValue = arr[i]
            var pos = i
            
            while pos >= gap && arr[pos - gap] > currentValue {
                arr[pos] = arr[pos - gap]
                pos -= gap
                self.moveCount += 1
            }
            
            arr[pos] = currentValue
        }
    }
    
    func dump() {
        print("정렬된 배열: \(arr)")
        print("이동 횟수: \(moveCount)")
    }
}

/*
let shellSort = ShellSort(arr: [8, 1, 4, 2, 7, 6, 3, 5])
shellSort.shellSort()
shellSort.dump()
 */

class Partition {
    func swap(_ idx1: Int, _ idx2: Int) {
        let temp = arr[idx1]
        arr[idx1] = arr[idx2]
        arr[idx2] = temp
    }
    
    var arr: [Int]
    var n: Int
    var pl: Int
    var pr: Int
    var x: Int
    
    init(arr: [Int]) {
        self.arr = arr
        self.n = arr.count
        self.pl = 0
        self.pr = n - 1
        self.x = arr[n / 2]
    }
    
    func partition() {
        repeat {
            while arr[pl] < x { pl += 1 }
            while arr[pr] > x { pr -= 1 }
            if pl <= pr {
                swap(pl, pr)
                pl += 1
                pr -= 1
            }
        } while pl <= pr
        
        print("피벗의 값은 \(x)입니다.")
        
        print("피벗 이하의 그룹: ")
        for i in 0...(pl - 1) {
            print(arr[i], terminator: " ")
        }
        print()
        
        if pl > (pr + 1) {
            print("피벗과 일치하는 그룹: ")
            for i in (pr + 1)...(pl - 1) {
                print(arr[i], terminator: " ")
            }
            print()
        }
        
        print("피벗 이상의 그룹: ")
        for i in (pr + 1)..<n {
            print(arr[i], terminator: " ")
        }
    }
}

//let partition = Partition(arr: [1, 8, 7, 4, 5, 2, 6, 3, 9])
//partition.partition()

// MARK: - 퀵 정렬
class QuickSort {
    func swap(_ idx1: Int, _ idx2: Int) {
        let temp = arr[idx1]
        arr[idx1] = arr[idx2]
        arr[idx2] = temp
    }
    
    var arr: [Int]
    var n: Int
    
    init(arr: [Int]) {
        self.arr = arr
        self.n = arr.count
    }
    
    func quickSort(left: Int, right: Int) {
        var pl = left
        var pr = right
        let x = arr[(pl + pr) / 2]
        
        print("arr[\(left)] ~ arr[\(right)] : { ", terminator: "")
        for i in left..<right {
            print(arr[i], terminator: ", ")
        }
        print("\(arr[right]) }")
        
        repeat {
            while arr[pl] < x { pl += 1 }
            while arr[pr] > x { pr -= 1 }
            if pl <= pr {
                swap(pl, pr)
                pl += 1
                pr -= 1
            }
        } while pl <= pr
        
        if left < pr {
            quickSort(left: left, right: pr)
        }
        
        if right > pl {
            quickSort(left: pl, right: right)
        }
    }
    
    func dump() {
        print(arr)
    }
}

let arr = [5, 8, 4, 2, 6, 1, 3, 9, 7]
let quickSort = QuickSort(arr: arr)
quickSort.quickSort(left: 0, right: arr.count - 1)
quickSort.dump()
