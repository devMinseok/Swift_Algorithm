//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

// MARK: - 연결리스트 (포인터)
class LinkedList<T: Equatable> {
    class Node<T>: Equatable {
        static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
            return lhs == rhs
        }
        
        var data: T? // 데이터
        var next: Node<T>? // 뒤쪽 포인터(다음 노드 참조)
        
        init(_ data: T?, _ next: Node<T>?) {
            self.data = data
            self.next = next
        }
    }
    
    private var head: Node<T>? // 머리 노드
    private var crnt: Node<T>? // 선택 노드
    
    init() {
        head = nil
        crnt = nil
    }
    
    /// 노드 검색
    func search(_ obj: T) -> T? {
        var ptr = head
        
        while ptr != nil {
            if obj == ptr?.data {
                crnt = ptr
                return ptr?.data
            }
            ptr = ptr?.next
        }
        return nil
    }
    
    // 머리에 노드 삽입
    func addFirst(_ obj: T) {
        let ptr = head // 기존 head노드
        head = Node(obj, ptr) // 새로운 노드(next에 ptr을 연결)를 head에 삽입
        crnt = head
    }
    
    /// 꼬리 노드에 삽입
    func addLast(_ obj: T) {
        if head == nil { // 리스트가 비어 있으면
            self.addFirst(obj) // head에 삽입
        } else {
            var ptr = head
            while ptr?.next != nil {
                ptr = ptr?.next
            }
            crnt = Node(obj, nil)
            ptr?.next = crnt
        }
    }
    
    /// 머리 노드 삭제
    func removeFirst() {
        if head != nil {
            head = head?.next
        }
    }
    
    /// 꼬리 노드 삭제
    func removeLast() {
        if head != nil {
            if head?.next == nil {
                removeFirst()
            } else {
                var ptr = head
                var pre = head
                
                while ptr?.next != nil {
                    pre = ptr
                    ptr = ptr?.next
                }
                pre?.next = nil
                crnt = pre
            }
        }
    }
    
    /// 해당 노드를 삭제
    func remove(_ p: Node<T>?) {
        if head != nil {
            if head == p {
                removeFirst()
            } else {
                var ptr = head
                
                while ptr?.next != p {
                    ptr = ptr?.next
                    if ptr == nil {
                        return
                    }
                }
                ptr?.next = p?.next
                crnt = ptr
            }
        }
    }
    
    /// 선택한 노드를 삭제
    func removeCurrentNode() {
        remove(crnt)
    }
    
    /// 모든 노드를 삭제
    func clear() {
        while head != nil {
            removeFirst()
        }
        crnt = nil
    }
    
    /// 선택한 노드를 하나 뒤쪽으로 이동
    func next() -> Bool {
        if crnt == nil || crnt?.next == nil {
            return false
        }
        crnt = crnt?.next
        return true
    }
    
    /// 선택한 노드를 출력
    func printCurrentNode() {
        if let crnt = crnt {
            print(crnt.data)
        } else {
            print("선택한 노드가 없습니다.")
        }
    }
    
    /// 모든 노드를 출력
    func dump() {
        var ptr = head
        
        while ptr != nil {
            print(ptr?.data)
            ptr = ptr?.next
        }
    }
}


// MARK: - 연결리스트 (tail 추가)
class LinkedListT<T: Equatable> {
    class Node<T>: Equatable {
        static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
            return lhs == rhs
        }
        
        var data: T? // 데이터
        var next: Node<T>? // 뒤쪽 포인터(다음 노드 참조)
        
        init(_ data: T?, _ next: Node<T>?) {
            self.data = data
            self.next = next
        }
    }
    
    private var head: Node<T>? // 머리 노드
    private var crnt: Node<T>? // 선택 노드
    private var tail: Node<T>? // 꼬리 노드
    
    init() {
        head = nil
        crnt = nil
        tail = nil
    }
    
    /// 꼬리 노드 설정
    func setTail() {
        if head?.next == nil {
            tail = head
        } else {
            var ptr = head
            
            while ptr?.next != nil {
                ptr = ptr?.next
            }
            tail = ptr
        }
    }
    
    /// 노드 검색
    func search(_ obj: T) -> T? {
        var ptr = head
        
        while ptr != nil {
            if obj == ptr?.data {
                crnt = ptr
                return ptr?.data
            }
            ptr = ptr?.next
        }
        return nil
    }
    
    // 머리에 노드 삽입
    func addFirst(_ obj: T) {
        let ptr = head // 기존 head노드
        head = Node(obj, ptr) // 새로운 노드(next에 ptr을 연결)를 head에 삽입
        crnt = head
        
        setTail()
    }
    
    /// 꼬리 노드에 삽입
    func addLast(_ obj: T) {
        if head == nil { // 리스트가 비어 있으면
            self.addFirst(obj) // head에 삽입
        } else {
            crnt = Node(obj, nil)
            tail?.next = crnt
        }
        
        setTail()
    }
    
    /// 머리 노드 삭제
    func removeFirst() {
        if head != nil {
            head = head?.next
        }
    }
    
    /// 꼬리 노드 삭제
    func removeLast() {
        if head != nil {
            remove(tail)
        }
    }
    
    /// 해당 노드를 삭제
    func remove(_ p: Node<T>?) {
        if head != nil {
            if head == p {
                removeFirst()
            } else {
                var ptr = head
                
                while ptr?.next != p {
                    ptr = ptr?.next
                    if ptr == nil {
                        return
                    }
                }
                ptr?.next = p?.next
                crnt = ptr
            }
        }
    }
    
    /// 선택한 노드를 삭제
    func removeCurrentNode() {
        remove(crnt)
    }
    
    /// 모든 노드를 삭제
    func clear() {
        while head != nil {
            removeFirst()
        }
        crnt = nil
    }
    
    /// 선택한 노드를 하나 뒤쪽으로 이동
    func next() -> Bool {
        if crnt == nil || crnt?.next == nil {
            return false
        }
        crnt = crnt?.next
        return true
    }
    
    /// 선택한 노드를 출력
    func printCurrentNode() {
        if let crnt = crnt {
            print(crnt.data)
        } else {
            print("선택한 노드가 없습니다.")
        }
    }
    
    /// 모든 노드를 출력
    func dump() {
        var ptr = head
        
        while ptr != nil {
            print(ptr?.data)
            ptr = ptr?.next
        }
    }
}


// MARK: - 연결리스트 (커서)
class AryLinkedList<T: Equatable> {
    
    class Node {
        var data: T!
        var next: Int!
        var dnext: Int!
        
        func set(_ data: T, _ next: Int) {
            self.data = data
            self.next = next
        }
    }
    
    var n: [Node]
    var size: Int
    var max: Int
    var head: Int
    var crnt: Int
    var deleted: Int
    let NULL = -1
    
    init(capacity: Int) {
        head = NULL
        crnt = NULL
        max = NULL
        deleted = NULL
        
        n = .init(repeating: Node(), count: capacity)
        size = capacity
    }
    
    func getInsertIndex() -> Int {
        if deleted == NULL {
            if max < size {
                max++
                return max
            } else {
                return NULL
            }
        } else {
            let rec = deleted
            deleted = n[rec].dnext
            return rec
        }
    }
    
    func deleteIndex(idx: Int) {
        if deleted == NULL {
            deleted = idx
            n[idx].dnext = NULL
        } else {
            let rec = deleted
            deleted = idx
            n[rec].dnext = rec
        }
    }
    
    func search(obj: T) -> T? {
        var ptr = head
        
        while ptr != NULL {
            if obj == n[ptr].data {
                crnt = ptr
                return n[ptr].data
            }
            ptr = n[ptr].next
        }
        return nil
    }
    
    func addFirst(obj: T) {
        let ptr = head
        let rec = getInsertIndex()
        if rec != NULL {
            head = rec
            crnt = rec
            n[head].set(obj, ptr)
        }
    }
    
    func addLast(obj: T) {
        if head == NULL {
            addFirst(obj: obj)
        } else {
            var ptr = head
            while n[ptr].next != NULL {
                ptr = n[ptr].next
                let rec = getInsertIndex()
                if rec != NULL {
                    n[ptr].next = rec
                    crnt = rec
                    n[rec].set(obj, NULL)
                }
            }
        }
    }
    
    func removeFirst() {
        if head != NULL {
            let ptr = n[head].next
            deleteIndex(idx: head)
            head = ptr!
            crnt = ptr!
        }
    }
    
    func removeLast() {
        if head != NULL {
            if n[head].next == NULL {
                removeFirst()
            } else {
                var ptr = head
                var pre = head
                
                while n[ptr].next != NULL {
                    pre = ptr
                    ptr = n[ptr].next
                }
                n[pre].next = NULL
                deleteIndex(idx: pre)
                crnt = pre
            }
        }
    }
    
    func remove(p: Int) {
        if head != NULL {
            if p == head {
                removeFirst()
            } else {
                var ptr = head
                
                while n[ptr].next != p {
                    ptr = n[ptr].next
                    if ptr == NULL {
                        return
                    }
                }
                n[ptr].next = NULL
                deleteIndex(idx: ptr)
                n[ptr].next = n[p].next
                crnt = ptr
            }
        }
    }
    
    func removeCurrentNode() {
        remove(p: crnt)
    }
    
    
    func clear() {
        while(head != NULL) {
            removeLast()
        }
        crnt = NULL
    }
    
    
    func next() -> Bool {
        if crnt == NULL || n[crnt].next == NULL {
            return false
        }
        crnt = n[crnt].next
        return true
    }
    
    func printCurrentNode() {
        if crnt == NULL {
            print("선택 노드가 없습니다.")
        } else {
            print(n[crnt].data)
        }
    }
    
    func dump() {
        var ptr = head
        
        while ptr != NULL {
            print(n[ptr].data)
            ptr = n[ptr].next
        }
    }
}
