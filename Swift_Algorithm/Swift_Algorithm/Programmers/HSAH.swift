//
//  HSAH.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2021/03/07.
//  Copyright © 2021 MinseokKang. All rights reserved.
//

/*
import Foundation

// MARK: - 해시

/// 위장
func solution(_ clothes:[[String]]) -> Int {
    var table = [String : Int]()
    var comb = 1
    
    for i in 0..<clothes.count {
        let key = clothes[i][1]
        
        if table[key] != nil {
            table[key]! += 1
        } else {
            table[key] = 1
        }
    }
    
    print(table)
    for (_, value) in table {
        comb *= (value + 1)
    }
    
    return (comb - 1)
}

//print(solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]))

/// 베스트 앨범 (실패)
func solution1(_ genres: [String], _ plays: [Int]) -> [Int] {
    // 문제: 딕셔너리는 순서가 없기에 장르의 순서를 파악할 수 없음
    // 해결: 장르당 재생횟수를 딕셔너리를 활용하여 각각 구한 다음, 이를 가지고 재생횟수가 높은 장르를 내림차순으로 배열에 저장
    
    /**
     genres와 plays배열을 합친 딕셔너리
        - 장르명 : [(재생된 횟수, 고유번호)]
     */
    var dic = [String : [(Int, Int)]]()
    
    /// 각 장르당 총 재생횟수를 비교하기 위한 딕셔너리
    var compare = [String : Int]()
    
    /// 재생횟수가 높은 순에서 낮은 순으로 정렬된 배열
    var genreSeq = [String]()
    
    /// 결과를 저장할 배열
    var results = [Int]()
    
    // 딕셔너리에 값을 key와 value의 형태로 넣기(분류 포함)
    for i in 0..<genres.count {
        let genreName = genres[i]
        let playCount = plays[i]
        
        // dic[장르명]에 튜플을 append하여 insert함 -> 만약 기존 key값(장르명)이 있다면 원래 있던 배열에 append할 것
        // 문제: dic[장르명]에 append를 하니, 값이 안들어감 -> 기존 키 값을 업데이트 하는 형태로 들어가서 isnert가 안된 듯
        // 해결: 먼저 장르를 초기화 한 다음에 append를 해야함
        // 문제: dic에 마지막 값만 들어감(항상 초기화하고 append하기에)
        // 해결: if 문으로 딕셔너리의 키값 존재여부를 확인하여 분기
        
        if dic[genreName] == nil {
            dic[genreName] = [(Int, Int)]()
            compare[genreName] = playCount
        } else {
            compare[genreName]! += playCount
        }
        dic[genreName]!.append((playCount, i)) // (재생횟수, 고유번호)
    }
    
    // compare 딕셔너리를 가지고, genreSeq 배열에 각 장르의 재생횟수를 가지고 내림차순으로 저장
    genreSeq = compare.sorted { (lhs, rhs) -> Bool in
        return lhs.value > rhs.value
    }.map { $0.key }
    
    // dic[key]의 배열(value)을 sort한 후 두개만 뽑아내면 값을 도출할 수 있을 듯
    for (key, _) in dic {
        // for문의 value를 사용할 수도 있었으나 let이기에 dic[key]와 같은 형태로 간접적으로 접근하는 방식을 선택
        dic[key]?.sort(by: { (lhs, rhs) -> Bool in
            return lhs.0 > rhs.0
        })
    }
    
    // dic안의 value중 각 장르별 재생횟수가 높은 2개의 고유번호를 찾아야함
    // 재생횟수가 높은 장르 순으로 출력해야함
    for i in genreSeq {
        for (key, value) in dic {
            if key == i {
                results.append(value[0].1)
                results.append(value[1].1)
                break
            }
        }
    }
    
    return results
}

//print(solution1(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]))

// 베스트 앨범 (재도전: 성공)
func solution2(_ genres: [String], _ plays: [Int]) -> [Int] {
    let capacity = genres.count
    var gMap = [Int : String]() // 장르 map (고유번호 : 장르명)
    var pMap = [Int : Int]() // 재생횟수 map (고유번호 : 재생횟수)
    var total = [String : Int]() // 각 장르당 총 재생횟수 (장르명 : 재생 횟수)
    var results = [Int]() // 결과 배열
    
    for i in 0..<capacity {
        let genreName = genres[i]
        let playCount = plays[i]
        
        gMap[i] = genreName
        pMap[i] = playCount
        
        if total[genreName] == nil {
            total[genreName] = 0
        }
        total[genreName]! += playCount
    }
    
    let sortedMap = pMap.sorted { (lhs, rhs) -> Bool in
        return lhs.value > rhs.value
    }
    
    let seq = total.sorted { (lhs, rhs) -> Bool in
        return lhs.value > rhs.value
    }.map { $0.key }
    
    for value in seq {
        var flag = 0
        for j in 0..<capacity {
            if value == gMap[sortedMap[j].key] {
                results.append(sortedMap[j].key)
                flag += 1
            }
            
            if flag == 2 {
                break
            }
        }
    }
    
    return results
}

//print(solution2(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]))
 */
