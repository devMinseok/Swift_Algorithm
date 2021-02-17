//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

// MARK: - 해시
class ChainHash<K: Hashable, V> {
    class Node {
        var key: K
        var data: V
        var next: Node?
        
        init(_ key: K, _ data: V, _ next: Node?) {
            self.key = key
            self.data = data
            self.next = next
        }
        
        func getKey() -> K {
            return key
        }
        
        func getValue() -> V {
            return data
        }
        
        func hashCode() -> Int {
            return key.hashValue
        }
    }
    
    var size: Int
    var table: [Node?]
    
    init(capacity: Int) {
        self.size = capacity
        self.table = .init(repeating: nil, count: capacity)
    }
    
    func hashValue(_ key: K) -> Int {
        return key.hashValue % size
    }
    
    /// 키 값 key를 갖는 요소의 검색 (데이터를 반환)
    func search(key: K) -> V? {
        let hash = hashValue(key)
        var p = table[hash]
        
        while p != nil {
            if p?.getKey() == key {
                return p?.getValue()
            }
            p = p?.next
        }
        return nil
    }
    
    /// 키 값 key, 데이터 data를 갖는 요소의 추가
    func add(key: K, data: V) -> Int {
        let hash = hashValue(key)
        var p = table[hash]
        
        while p != nil {
            if p?.getKey() == key {
                return 1
            }
            p = p?.next
        }
        let temp = Node(key, data, table[hash])
        table[hash] = temp
        return 0
    }
    
    /// 키 값 key 를 갖는 요소의 삭제
    func remove(key: K) -> Int {
        let hash = hashValue(key)
        var p = table[hash]
        var pp: Node? = nil
        
        while p != nil {
            if p?.getKey() == key {
                if pp == nil {
                    table[hash] = p?.next
                } else {
                    pp?.next = p?.next
                }
                return 0
            }
            pp = p
            p = p?.next
        }
        return 1
    }
    
    /// 해시 테이블을 덤프
    func dump() {
        for i in 0..<size {
            var p = table[i]
            print(i, terminator: " ")
            while p != nil {
                print("-> \(p?.getKey()) (\(p?.getValue()))", terminator: " ")
                p = p?.next
            }
            print()
        }
    }
}
