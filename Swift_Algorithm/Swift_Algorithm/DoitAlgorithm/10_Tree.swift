//
//  10_Tree.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2021/02/17.
//  Copyright © 2021 MinseokKang. All rights reserved.
//

/*
import Foundation

// MARK: - 이진검색트리
class BinTree<K: Comparable, V> {
    class Node: Equatable {
        static func == (lhs: Node, rhs: Node) -> Bool {
            return lhs == rhs
        }
        
        var key: K
        var data: V?
        var left: Node?
        var right: Node?
        
        init(_ key: K, _ data: V?, _ left: Node?, _ right: Node?) {
            self.key = key
            self.data = data
            self.left = left
            self.right = right
        }
        
        /// 키 값을 반환
        func getKey() -> K {
            return key
        }
        
        /// 데이터를 반환
        func getValue() -> V? {
            return data
        }
        
        /// 데이터를 출력
        func printValue() {
            print(data)
        }
    }
    
    var root: Node?
    
    init() {
        root = nil
    }
    
    /**
     - key1 > key2면 1
     - key1 < key2면 -1
     - key1 == key2면 0
     */
    func comp(_ key1: K, _ key2: K) -> Int {
        if key1 > key2 {
            return 1
        } else if key1 < key2 {
            return -1
        } else {
            return 0
        }
    }
    
    /// 키에 의한 검색
    func search(key: K) -> V? {
        var p = root
        
        while true {
            if p == nil { // 더 이상 진행하지 않으면
                return nil // 검색 실패
            }
            
            let cond = comp(key, (p?.getKey())!)
            if cond == 0 { // 같으면
                return p?.getValue() // 검색 성공
            } else if cond < 0 { // key 쪽이 작으면
                p = p?.left // 왼쪽 서브 트리에서 검색
            } else { // key 쪽이 크면
                p = p?.right // 오른쪽 서브 트리에서 검색
            }
        }
    }
    
    /// node를 루트로 하는 서브 트리에 노드<K, V>를 삽입
    func addNode(_ node: Node, _ key: K, _ data: V) {
        let cond = comp(key, node.getKey())
        if cond == 0 {
            return
        } else if cond < 0 {
            if let left = node.left {
                addNode(left, key, data)
            } else {
                node.left = Node(key, data, nil, nil)
            }
        } else {
            if let right = node.right {
                addNode(right, key, data)
            } else {
                node.right = Node(key, data, nil, nil)
            }
        }
    }
    
    /// 노드를 삽입
    func add(key: K, data: V) {
        if let root = root {
            addNode(root, key, data)
        } else {
            root = Node(key, data, nil, nil)
        }
    }
    
    /// 키 값이 key인 노드를 삭제
    func remove(key: K) -> Bool {
        var p = root // 스캔 중인 노드
        var parent: Node? = nil // 스캔 중인 노드의 부모 노드
        var isLeftChild = true // p는 부모의 왼쪽 자식 노드인가?
        
        while true {
            if p == nil { // 더 이상 진행하지 않으면
                return false // 그 키 값은 없습니다
            }
            let cond = comp(key, (p?.getKey())!) // key와 노드 p의 키 값을 비교
            if cond == 0 { // 같으면
                break // 검색 성공
            } else {
                parent = p // 가지로 내려가기 전에 부모를 설정
                if cond < 0 { // key쪽이 작으면
                    isLeftChild = true // 왼쪽 자식으로 내려감
                    p = p?.left // 왼쪽 서브 트리에서 검색
                } else { // key 쪽이 크면
                    isLeftChild = false // 오른쪽 자식으로 내려감
                    p = p?.right // 오른쪽 서브 트리에서 검색
                }
            }
        }
        
        if p?.left == nil { // p에는 왼쪽 자식이 없음
            if p == root {
                root = p?.right
            } else if isLeftChild {
                parent?.left = p?.right // 부모의 왼쪽 포인터가 오른쪽 자식을 가리킴
            } else {
                parent?.right = p?.right // 부모의 오른쪽 포인터가 오른쪽 자식을 가리킴
            }
        } else if p?.right == nil { // p에는 오른쪽 자식이 없음
            if p == root {
                root = p?.left
            } else if isLeftChild {
                parent?.left = p?.left // 부모의 왼쪽 포인터가 왼쪽 자식을 가리킴
            } else {
                parent?.right = p?.left // 부모의 오른쪽 포인터가 왼쪽 자식을 가리킴
            }
        } else {
            parent = p
            var left = p?.left // 서브 트리 가운데 가장 큰 노드
            isLeftChild = true
            while left?.right != nil { // 가장 큰 노드 left를 검색
                parent = left
                left = left?.right
                isLeftChild = false
            }
            p?.key = left!.key // left의 키 값을 p로 옮김
            p?.data = left?.data // left의 데이터를 p로 옮김
            if isLeftChild {
                parent?.left = left?.left // left를 삭제
            } else {
                parent?.right = left?.left // left를 삭제
            }
        }
        return true
    }
    
    /// node를 루트로 하는 서브 트리의 노드를 키 값의 오름차순으로 출력
    func printSubTree(_ node: Node?) {
        if node != nil {
            printSubTree(node?.left)
            print(node?.key, node?.data)
            printSubTree(node?.right)
        }
    }
    
    /// 모든 노드를 키 값의 오름차순으로 출력
    func printTree() {
        printSubTree(root)
    }
}
 */
