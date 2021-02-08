//
//  08_StringSearch.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2021/02/08.
//  Copyright © 2021 MinseokKang. All rights reserved.
//

/*
import Foundation

// MARK: - 294p 연습문제 Q2 / 브루트 포스법 (역순 포함)
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


// MARK: - KMP법
func kmpMatch(txt: String, pat: String) -> Int {
    var pt = 1
    var pp = 0
    
    var skip = Array(repeating: -1, count: pat.count + 1)
    
    skip[pt] = 0
    while pt != pat.count {
        if pat[.init(encodedOffset: pt)] == pat[.init(encodedOffset: pp)] {
            pt++
            pp++
            skip[pt] = pp
        } else if pp == 0 {
            pt++
            skip[pt] = pp
        } else {
            pp = skip[pp]
        }
    }
    
    pt = 0
    pp = 0
    while pt != txt.count && pp != pat.count {
        if txt[.init(encodedOffset: pt)] == pat[.init(encodedOffset: pp)] {
            pt++
            pp++
        } else if pp == 0 {
            pt++
        } else {
            pp = skip[pp]
        }
    }
    
    if pp == pat.count {
        return pt - pp
    }
    
    return -1
}

//print(kmpMatch(txt: "ZABCABDACCADEF", pat: "ABCABD"))


// MARK: - Boyer Moore법
func bmMatch(txt: String, pat: String) -> Int {
    var pt: Int
    var pp: Int
    let txtLen = txt.count
    let patLen = pat.count
    let skip = String(pat.reversed())
    
    pt = patLen - 1
    while pt < txtLen {
        pp = patLen - 1
        
        while txt[.init(encodedOffset: pt)] == pat[.init(encodedOffset: pp)] {
            if pp == 0 {
                return pt
            }
            pt--
            pp--
        }
        
        if let skipIndex = skip.index(of: txt[.init(encodedOffset: pt)])?.encodedOffset {
            pt += skipIndex
        } else {
            pt += patLen
        }
    }
    
    return -1
}

//print(bmMatch(txt: "CABCD", pat: "ABC"))
 */
