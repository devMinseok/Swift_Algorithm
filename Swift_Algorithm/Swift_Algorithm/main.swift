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

/*
 let arr = [5, 8, 4, 2, 6, 1, 3, 9, 7]
 let quickSort = QuickSort(arr: arr)
 quickSort.quickSort(left: 0, right: arr.count - 1)
 quickSort.dump()
 */

// MARK: - 병합 정렬
class MergeSort {
    var buff: [Int]
    
    func __mergeSort(_ a: inout [Int], _ left: Int, _ right: Int) {
        if left < right {
            var i = 0
            let center = (left + right) / 2
            var p = 0
            var j = 0
            var k = left
            
            __mergeSort(&a, left, center)
            __mergeSort(&a, center + 1, right)
            
            i = left
            for _ in left...center {
                buff[p++] = a[i++]
            }
            
            while i <= right && j < p {
                a[k++] = (buff[j] <= a[i]) ? buff[j++] : a[i++]
            }
            
            while j < p {
                a[k++] = buff[j++]
            }
            
            print(a)
        }
    }
    
    func mergeSort(_ a: inout [Int], _ n: Int) {
        __mergeSort(&a, 0, n - 1)
    }
    
    init() {
        var x = [22, 5, 11, 32, 120, 68, 70]
        self.buff = Array(repeating: -1, count: x.count)
        
        mergeSort(&x, x.count)
        
        for (index, element) in x.enumerated() {
            print("x[\(index)] = \(element)")
        }
    }
}

//MergeSort()

// MARK: - 힙 정렬
class HeapSort {
    func swap(_ arr: inout [Int], _ idx1: Int, _ idx2: Int) {
        let temp = arr[idx1]
        arr[idx1] = arr[idx2]
        arr[idx2] = temp
    }
    
    func downHeap(_ arr: inout [Int], _ left: Int, _ right: Int) {
        let temp = arr[left] // root
        var child = 1 // 큰 값을 가진 노드
        var parent = left // 부모
        
        /*
         <힙 공식>
         i의 부모: (i - 1) / 2
         i의 왼쪽 자식: (i * 2) + 1
         i의 오른쪽 자식: (i * 2) + 2
         */
        while parent < (right + 1) / 2 {
            let cl = parent * 2 + 1 // 왼쪽 자식
            let cr = cl + 1 // 오른쪽 자식
            child = (cr <= right && arr[cr] > arr[cl] ? cr : cl)
            if temp >= arr[child] {
                break
            }
            arr[parent] = arr[child]
            
            parent = child
        }
        
        arr[parent] = temp
        print(arr)
    }
    
    func heapSort(arr: inout [Int], n: Int) {
        for i in stride(from: ((n - 1) / 2), through: 0, by: -1) { // arr[i] ~ arr[n - 1]를 힙으로 만들기
            downHeap(&arr, i, n - 1)
        }
        
        for i in stride(from: n - 1, to: 0, by: -1) {
            swap(&arr, 0, i) // 가장 큰 요소와 아직 정렬되지 않은 부분의 마지막 요소를 교환
            downHeap(&arr, 0, i - 1) // a[0] ~ a[i - 1]을 힙으로 만듭니다.
        }
    }
    
    init() {
        var arr = [22, 5, 11, 32, 120, 68, 70]
        heapSort(arr: &arr, n: arr.count)
        
        for (index, element) in arr.enumerated() {
            print("arr[\(index)] = \(element)")
        }
    }
}

HeapSort()
