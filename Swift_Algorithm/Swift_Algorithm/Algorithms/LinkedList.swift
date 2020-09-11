//
//  LinkedList.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation

//public class Node { // Node 클래스를 <Value> 라는 Generics 타입으로
//    public var roomNumber: Int // 방 번호
//    public var students: [String] // 학생 이름 명단
//    public var next: Node? // 노드가 가리키는 노드 (다음 노드)
//    // 마지막 노드는 다음 노드가 nil 이기 때문에 옵셔널로 선언
//
//    public init (roomNumber: Int, students: String..., next: Node? = nil) {
//
//        self.roomNumber = roomNumber
//        self.students = students
//        self.next = next
//    }
//}
//
//extension Node: CustomStringConvertible {
//    //CustomStringConvertible 프로토콜을 채택하는 객체는 자기 타입에 대한  description을 제공해야 합니다.
//    public var description: String {
//        guard let next = next else { // nil 이 아니라면, 즉 다음 노드가 있다면
//            return "방 번호: \(roomNumber)호 + 학생명단: \(students)"
//        }
//        return "방 번호: \(roomNumber)호, 학생명단: \(students) \n -> " + String(describing: next) + " "
//        // String(describing:) 메소드가 다음 노드의 description 을 호출합니다.
//        // 이는 결국 연쇄적으로 다음, 다음의 다음, 다음의 다음의 다음, 이렇게 연결리스트의 노드를 한 눈에 보여주는 역할을 합니다.
//    }
//}
//
//public func example(of description: String, action: () -> Void) {
//    print("---Example of \(description)---")
//
//    action()
//    // 두 번째 매개변수 실행시키기
//    // 이 함수를 쓸 때는 클로져를 활용할 예정입니다. 그래서 매개변수에 함수 타입이 들어간 것.
//    print()
//}
//
//
//example(of: "creating and linking nodes") {
//    let node1 = Node(roomNumber: 401, students: "A", "B", "C")
//    let node2 = Node(roomNumber: 402, students: "D", "E", "F", "G")
//    let node3 = Node(roomNumber: 403, students: "H", "I")
//    let node4 = Node(roomNumber: 404, students: "J", "K", "L", "M")
//    let node5 = Node(roomNumber: 405, students: "N", "O", "P", "Q")
//
//    node1.next = node2
//    node2.next = node3
//    node3.next = node4
//    node4.next = node5
//
//    print(node1)
//}
