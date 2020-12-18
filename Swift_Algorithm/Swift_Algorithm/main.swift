//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

func spira(height: Int) -> () {
    for i in 1...height {
        let space = height - i
        let width = (i - 1) * 2 + 1
        
        for _ in 0..<space {
            print(" ", terminator: "")
        }
        
        for _ in 0..<width {
            print("*", terminator: "")
        }
        print("")
    }
}

//spira(height: Int(readLine()!)!)


func permutation() {
    let arr = [1, 2, 3]
    let n = 3
    
    for i in 0..<n {
        // 첫 번째 숫자 하나 고른상태
        // 두 번째 숫자 고르기
        for j in 0..<n {
            // 두 번째 숫자까지 고른상태
            // 첫 번째 숫자와 두 번째 숫자가 같으면, 아무 작업 안함
            if i == j {
                continue
            }
            // 세 번째 숫자 고르기
            for k in 0..<n {
                // 세 번째 숫자까지 고른상태
                // 세 번째 숫자가 첫번째 숫자, 두 번째 숫자와 모두 다를 경우
                if k == i || k == j {
                    continue
                }
                print(arr[i], arr[j], arr[k])
            }
        }
    }
}

//permutation()


let testArr = [2, 3, 6, 1, 4, 3, 7, 5]

func bubbleSort(inputArr: [Int], size: Int) {
    var arr = inputArr
    
    // 한 번 수행할때마다, 한자리씩 고정되니까...
    // n - 1 수행해야한다
    for i in 0..<size - 1 {
        // 앞자리부터 2개씩 비교해서 앞자리가 크면 자리교환
        for j in 0..<((size - i) - 1) {
            // 현재 인덱스, 다음인덱스 크기비교
            // 앞 인덱스가 크면, 자리교환
            if arr[j] > arr[j + 1] {
                let temp = arr[j]
                arr[j] = arr[j + 1]
                arr[j + 1] = temp
            }
        }
    }
    for i in 0..<size {
        print(arr[i], terminator: " ")
    }
}

//bubbleSort(inputArr: testArr, size: testArr.count)


func selectionSort(inputArr: [Int], size: Int) {
    var arr = inputArr
    
    for i in 0..<size - 1 {
        var minV = arr[i]
        var minIdx = i
        for j in (i + 1)..<size {
            if minV > arr[j] {
                minV = arr[j]
                minIdx = j
            }
        }
        let temp = arr[i]
        arr[i] = minV
        arr[minIdx] = temp
    }
    
    for i in 0..<size {
        print(arr[i], terminator: " ")
    }
}

//selectionSort(inputArr: testArr, size: testArr.count)


func countingSort(arr: [Int], size: Int) {
    // counting 배열 생성, 정렬된 값들이 복사될 배열 생성
    var count = [Int](repeating: 0, count: 12) // 각 요소가 몇 번 사용되었는지 체크하기 위한 배열
    var sorted = [Int](repeating: 0, count: 12)
    
    // 1. 대상 배열의 요소들이 몇번씩 나왔는지 숫자세기
    for i in 0..<size {
        count[arr[i]] += 1
    }
    
    // 2. 카운팅배열 누적합 구하기(배열요소가 몇 번째 위치해야 하는지)
    for i in 0...11 {
        count[i] = count[i - 1] + count[i]
    }
    
    // 3. 대상 배열 순회하면서 위치 찾아 넣기
    for i in 0..<size {
        count[arr[i]] -= 1
        sorted[count[arr[i]]] = arr[i]
    }
    
    for i in 0..<size {
        print(sorted[i], terminator: " ")
    }
}

countingSort(arr: [5, 6, 4, 2, 1, 2, 3, 8, 5, 4, 10, 7], size: 12)
