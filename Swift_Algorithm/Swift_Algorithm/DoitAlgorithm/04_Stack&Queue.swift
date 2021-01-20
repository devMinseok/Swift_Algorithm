//
//  03_Stack&Queue.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2021/01/20.
//  Copyright © 2021 MinseokKang. All rights reserved.
//

/*
import Foundation

// MARK: - 144p 연습문제 Q1 & Q2 / 스택 함수 모두 사용 & 제네릭 스택 만들기
enum GStackError: Error {
    case emptyStack
}

class GStack<T: Equatable> {
    private var stk: [T]
    
    init() {
        self.stk = [T]()
    }
    
    func push(_ value: T) -> T {
        self.stk.append(value)
        return value
    }
    
    func pop() -> T {
        return self.stk.removeLast()
    }
    
    func peek() throws -> T {
        guard let lastValue = self.stk.last else { throw GStackError.emptyStack }
        return lastValue
    }
    
    func indexOf(_ value: T) throws -> Int {
        guard let index = self.stk.firstIndex(where: { $0 == value}) else { throw GStackError.emptyStack }
        return index
    }
    
    func clear() {
        self.stk.removeAll()
    }
    
    func size() -> Int {
        return self.stk.count
    }
    
    func isEmpty() -> Bool {
        return stk.isEmpty
    }
    
    func dump() {
        for i in self.stk {
            print(i, terminator: " ")
        }
    }
}

/*
let gStack = GStack<String>.init()

print(gStack.push("A"))
print(gStack.push("B"))
print(gStack.push("C"))

print(gStack.pop())

do {
    try print(gStack.peek())
    try print(gStack.indexOf("A"))
} catch {
    print(error)
}

gStack.clear()
print()

print(gStack.push("A"))
print(gStack.push("B"))
print(gStack.push("C"))

print(gStack.size())

print(gStack.isEmpty())

gStack.dump()
 */

// MARK: - 144p 연습문제 Q3 / 하나의 배열을 공유하여 2개의 스택을 구현하는 Int형 스택 만들기
class SStack {
    enum StackDirection {
        case leftStack
        case rightStack
    }
    
    var max: Int
    
    var lPtr: Int
    var rPtr: Int
    
    var stk: [Int]
    
    init(capacity: Int) {
        self.lPtr = 0
        self.rPtr = capacity - 1
        self.max = capacity
        self.stk = .init(repeating: -1, count: max)
    }
    
    func push(_ direction: StackDirection, _ value: Int) -> Int {
        switch direction {
        case .leftStack:
            self.stk[lPtr] = value
            self.lPtr += 1
            return self.stk[self.lPtr - 1]
        case .rightStack:
            self.stk[rPtr] = value
            self.rPtr -= 1
            return self.stk[self.rPtr + 1]
        }
    }
    
    func pop(_ direction: StackDirection) -> Int {
        switch direction {
        case .leftStack:
            self.lPtr -= 1
            return self.stk[lPtr + 1]
        case .rightStack:
            self.rPtr += 1
            return self.stk[rPtr - 1]
        }
    }
    
    func dump() {
        for i in self.stk {
            print(i, terminator: " ")
        }
    }
}

/*
let sStack = SStack(capacity: 10)

print(sStack.push(.leftStack, 1))
print(sStack.push(.leftStack, 2))
print(sStack.push(.leftStack, 3))
print(sStack.push(.leftStack, 4))

print(sStack.push(.rightStack, 5))
print(sStack.push(.rightStack, 6))
print(sStack.push(.rightStack, 7))
print(sStack.push(.rightStack, 8))

sStack.dump()
*/


// MARK: - 146p 연습문제 Q4 / 큐
class IntAryQueue {
    var max: Int
    var num: Int
    var que: [Int]
    
    init(capacity: Int) {
        self.max = capacity
        self.num = 0
        self.que = .init(repeating: -1, count: capacity)
    }
    
    func enqueue(_ value: Int) -> Int {
        self.que[num] = value
        self.num += 1
        return self.que[num - 1]
    }
    
    func dequeue() -> Int {
        let value = self.que[0]
        
        for i in 0..<num {
            if self.que[i + 1] == -1 {
                self.que[i] = -1
                break
            } else {
                self.que[i] = self.que[i + 1]
            }
        }
        return value
    }
    
    func dump() {
        for i in self.que {
            print(i, terminator: " ")
        }
    }
}

/*
let intAryQueue = IntAryQueue(capacity: 10)

print(intAryQueue.enqueue(1))
print(intAryQueue.enqueue(2))
print(intAryQueue.enqueue(3))
print(intAryQueue.enqueue(4))

print(intAryQueue.dequeue())
print(intAryQueue.dequeue())
print(intAryQueue.dequeue())

intAryQueue.dump()
*/

// MARK: - 160p 연습문제 Q5 / 큐안의 데이터를 검색하여 해당 값이 몇 번째에 있는지 출력
class IntQueue {
    enum QueueError: Error {
        case empty
        case overflow
    }
    
    var max: Int
    var front: Int
    var rear: Int
    var num: Int
    var que: [Int]
    
    init(capacity: Int) {
        self.num = 0
        self.front = 0
        self.rear = 0
        self.max = capacity
        
        self.que = .init(repeating: -1, count: capacity)
    }
    
    func enqueue(_ value: Int) throws -> Int {
        if num >= max {
            throw QueueError.overflow
        }
        
        que[rear] = value
        rear += 1
        num += 1
        
        if rear == max {
            rear = 0
        }
        
        return value
    }
    
    func dequeue() throws -> Int{
        if num <= 0 {
            throw QueueError.empty
        }
        
        let value = que[front]
        front += 1
        num -= 1
        
        if front == max {
            front = 0
        }
        
        return value
    }
    
    func indexOf(_ value: Int) -> Int {
        for i in 0..<num {
            let idx = (i + front) % max
            if que[idx] == value {
                return idx
            }
        }
        return -1
    }
    
    func search(_ value: Int) -> Int {
        var searchIdx = -1
        for i in 0..<num {
            let idx = (i + front) % max
            if que[idx] == value {
                searchIdx = idx
                break
            }
        }
        
        if searchIdx == -1 {
            return -1
        }
        
        var num = 0
        
        if front <= searchIdx {
            for _ in front...searchIdx {
                num += 1
            }
        } else {
            for _ in front..<max {
                num += 1
            }
            for _ in 0...searchIdx {
                num += 1
            }
        }
        return num
    }
}

/*
let intQueue = IntQueue(capacity: 12)

print(try intQueue.enqueue(1))
print(try intQueue.enqueue(2))
print(try intQueue.enqueue(3))
print(try intQueue.enqueue(4))
print(try intQueue.enqueue(5))
print(try intQueue.enqueue(6))
print(try intQueue.enqueue(7))
print(try intQueue.enqueue(35))
print(try intQueue.enqueue(56))
print(try intQueue.enqueue(24))
print(try intQueue.enqueue(68))
print(try intQueue.enqueue(95))

print(try intQueue.dequeue())
print(try intQueue.dequeue())
print(try intQueue.dequeue())
print(try intQueue.dequeue())
print(try intQueue.dequeue())
print(try intQueue.dequeue())
print(try intQueue.dequeue())

print(try intQueue.enqueue(73))
print(try intQueue.enqueue(19))

// 검색후 몇 번째 인지 출력
print(intQueue.search(19))
*/
*/
