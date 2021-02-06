//
//  07_Set.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2021/02/06.
//  Copyright © 2021 MinseokKang. All rights reserved.
//

/*
import Foundation

// MARK: - 집합
class IntSet {
    private var max: Int
    private var num: Int
    private var set: [Int]
    
    init(_ capacity: Int) {
        self.num = 0
        self.max = capacity
        self.set = .init(repeating: 0, count: max)
    }
    
    var capacity: Int {
        return max
    }
    
    var size: Int {
        return num
    }
    
    /// 집합에서 n을 검색합니다(index 반환)
    func indexOf(_ n: Int) -> Int {
        for i in 0..<num {
            if set[i] == n {
                return i // 검색 성공
            }
        }
        return -1 // 검색 실패
    }
    
    /// 집합에 n이 있는지 없는지 확인합니다
    func contains(_ n: Int) -> Bool {
        return (indexOf(n) != -1) ? true : false
    }
    
    /// 집합에 n을 추가합니다
    @discardableResult
    func add(_ n: Int) -> Bool {
        if num >= max || contains(n) == true {
            return false // 가득 찼거나 이미 n이 존재합니다
        } else {
            set[num++] = n // 가장 마지막 자리에 추가합니다
            return true
        }
    }
    
    /// 집합에서 n을 삭제합니다
    @discardableResult
    func remove(_ n: Int) -> Bool {
        let idx = indexOf(n) //  n이 저장된 요소의 인덱스
        
        if num <= 0 || idx == -1 { // 비어 있거나 n이 존재하지 않습니다
            return false
        } else {
            num -= 1
            set[idx] = set[num] // 마지막 요소를 삭제한 곳으로 옮깁니다
            return true
        }
    }
    
    /// 집합 s에 복사합니다
    func copyTo(_ s: IntSet) {
        let n = (s.max < num) ? s.max : num
        for i in 0..<n {
            s.set[i] = set[i]
        }
        s.num = n
    }
    
    /// 집합 s를 복사합니다
    func copyFrom(_ s: IntSet) {
        let n = (max < s.num) ? max : s.num
        for i in 0..<n {
            set[i] = s.set[i]
        }
        num = n
    }
    
    /// 집합 s와 같은지 확인합니다
    func equalTo(_ s: IntSet) -> Bool {
        if num != s.num {
            return false
        }
        
        for i in 0..<num {
            var count = 0
            for j in 0..<s.num {
                if set[i] == s.set[j] {
                    break
                }
                count += 1
            }
            if count == s.num {
                return false
            }
        }
        return true
    }
    
    /// 집합 s1과 s2의 합집합을 복사합니다
    func unionOf(_ s1: IntSet, _ s2: IntSet) {
        copyFrom(s1) // 집합 s1을 복사합니다
        for i in 0..<s2.num { // 집합 s2의 요소를 추가합니다
            add(s2.set[i])
        }
    }
    
    /// "{a b c}"형식의 문자열로 표현을 바꿉니다
    func toString() -> String {
        var a = "{ "
        for i in 0..<num {
            a.append("\(set[i]) ")
        }
        a.append("}")
        return a
    }
    
    /// 공집합인지 확인합니다
    func isEmpty() -> Bool {
        return num == 0 ? true : false
    }
    
    /// 집합이 가득 찼는지 확인합니다
    func isFull() -> Bool {
        return num == max ? true : false
    }
    
    /// 집합을 초기화합니다(모든 요소를 삭제)
    func clear() {
        num = 0
    }
    
    /// 집합 s와의 합집합 구하기
    func add(_ s: IntSet) {
        for i in 0..<s.num {
            add(s.set[i])
        }
    }
    
    /// 집합 s와의 교집합 구하기
    func retain(_ s: IntSet) {
        var temp = [Int]()
        
        for i in 0..<num {
            for j in 0..<s.num {
                if set[i] == s.set[j] {
                    temp.append(set[i])
                }
            }
        }
        clear()
        for i in temp {
            add(i)
        }
    }
    
    /// 집합 s와의 차집합 구하기
    func remove(_ s: IntSet) {
        var temp = [Int]()
        
        for i in 0..<num {
            for j in 0..<s.num {
                if set[i] == s.set[j] {
                    temp.append(set[i])
                }
            }
        }
        clear()
        for i in temp {
            remove(i)
        }
    }
}

/*
let s1 = IntSet(20)
let s2 = IntSet(20)
let s3 = IntSet(20)

s1.add(10)
s1.add(15)
s1.add(20)
s1.add(25)

s1.copyTo(s2)

s2.add(12)
s2.remove(25)

s3.copyFrom(s2)

print("s1 = \(s1.toString())")
print("s2 = \(s2.toString())")
print("s3 = \(s3.toString())")

print(s1.equalTo(s3))

print("집합 s1에 15는 \(s1.contains(15) ? "포함됩니다" : "포함되지 않습니다")")

print("집합 s2에 25는 \(s2.contains(25) ? "포함됩니다" : "포함되지 않습니다")")

print("집합 s1과 s2는 \(s1.equalTo(s2) ? "같습니다" : "같지 않습니다")")

print("집합 s2과 s3는 \(s2.equalTo(s3) ? "같습니다" : "같지 않습니다")")

s3.unionOf(s1, s2)

print("집합 s1과 s2의 합집합은 \(s3.toString())입니다")
 */
/*
