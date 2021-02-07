//
//  main.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

import Foundation


// MARK: - 294p 연습문제 Q2 / 브루트 포스법 (역순)
class BFmatch {
    func bfMatch(txt: String, pat: String) -> Int {
        var pt = 0
        var pp = 0
        
        while pt != txt.count && pp != pat.count {
            if txt[.init(encodedOffset: pt)] == pat[.init(encodedOffset: pp)] {
                pt++
                pp++
            } else {
                pt = pt - pp + 1
                pp = 0
            }
        }
        if pp == pat.count {
            return pt - pp
        }
        return -1
    }
    
    func bfMatchLast(txt: String, pat: String) -> Int {
        var pt = txt.count - 1
        var pp = pat.count - 1
        
        while pt != 0 && pp != 0 {
            if txt[.init(encodedOffset: pt)] == pat[.init(encodedOffset: pp)] {
                pt--
                pp--
            } else {
                pt = pt + pp - 1
                pp = pat.count - 1
            }
        }
        if pp == 0 {
            return pt + pp
        }
        return -1
    }
    
    init() {
        let idx = bfMatchLast(txt: "ABCDDABC", pat: "ABC")
        
        if idx == -1 {
            print("텍스트에 패턴이 없습니다.")
        } else {
            print("\(idx + 1)번째 문자부터 일치합니다.")
        }
    }
}

//BFmatch()
