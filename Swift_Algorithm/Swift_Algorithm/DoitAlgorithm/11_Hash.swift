//
//  11_Hash.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2021/02/18.
//  Copyright © 2021 MinseokKang. All rights reserved.
//

/*
import Foundation

// MARK: - 해시 (체인법)
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

// MARK: - 해시 (오픈주소법)
class OpenHash<K: Hashable, V> {
    enum Status {
        /// 데이터 저장
        case OCCUPIED
        
        // 비어 있음
        case EMPTY
        
        // 삭제 마침
        case DELETED
    }
    
    class Bucket {
        var key: K?
        var data: V?
        var stat: Status
        
        init() {
            stat = Status.EMPTY
        }
        
        /// 모든 필드에 값을 설정합니다
        func set(_ key: K, _ data: V, _ stat: Status) {
            self.key = key
            self.data = data
            self.stat = stat
        }
        
        func setStat(_ stat: Status) {
            self.stat = stat
        }
        
        func getKey() -> K? {
            return key
        }
        
        func getValue() -> V? {
            return data
        }
        
        func hashCode() -> Int {
            return key.hashValue
        }
    }
    
    var size: Int
    var table: [Bucket]
    
    init(size: Int) {
        table = .init(repeating: Bucket(), count: size)
        self.size = size
    }
    
    /// 해시 값을 구함
    func hashValue(_ key: K) -> Int {
        return key.hashValue % size
    }
    
    /// 재해시 값을 구함
    func rehashValue(_ hash: Int) -> Int {
        return (hash + 1) % size
    }
    
    /// 키 값 key를 갖는 버킷의 검색
    func searchNode(_ key: K) -> Bucket? {
        var hash = hashValue(key)
        var p = table[hash]
        
        
        var i = 0
        while p.stat != Status.EMPTY && i < size {
            i++
            if p.stat == Status.OCCUPIED && p.getKey() == key {
                return p
            }
            hash = rehashValue(hash)
            p = table[hash]
        }
        return nil
    }
    
    /// 키 값 key를 갖는 요소의 검색 (데이터를 반환)
    func search(_ key: K) -> V? {
        let p = searchNode(key)
        if p != nil {
            return p?.getValue()
        } else {
            return nil
        }
    }
    
    /// 키 값 key, 데이터 data를 갖는 요소의 추가
    func add(key: K, data: V) -> Int {
        if search(key) != nil {
            return 1 // 이 키 값은 이미 등록됨
        }

        var hash = hashValue(key)
        var p = table[hash]
        for i in 0..<size {
            if p.stat == Status.EMPTY || p.stat == Status.DELETED {
                p.set(key, data, Status.OCCUPIED)
                return 0 // 추가 성공
            }
            hash = rehashValue(hash)
            p = table[hash]
        }
        return 2 // 해시 테이블이 가득참
    }
    
    /// 키 값 key를 갖는 요소의 삭제
    func remove(key: K) -> Int {
        var p = searchNode(key)
        if p == nil {
            return 1 // 이 키 값은 등록되지 않음
        }
        p?.setStat(Status.DELETED)
        return 0 // 삭제 완료
    }
    
    /// 해시 케이블을 덤프
    func dump() {
        for i in 0..<size {
            print(i, terminator: " ")
            switch table[i].stat {
            case .OCCUPIED:
                print("\(table[i].getKey()) (\(table[i].getValue()))", terminator: "")
            case .EMPTY:
                print("미등록")
            case .DELETED:
                print("삭제 마침")
            }
        }
    }
}
 */
