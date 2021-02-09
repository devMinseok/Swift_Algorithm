//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

class LinkedList<T> {
    class Node<T> {
        private var data: T // 데이터
        private var next: Node<T> // 뒤쪽 포인터(다음 노드 참조)
        
        init(data: T, next: Node<T>) {
            self.data = data
            self.next = next
        }
    }
    
    private var head: Node<T> // 머리 노드
    private var crnt: Node<T> // 선택 노드
    
}
