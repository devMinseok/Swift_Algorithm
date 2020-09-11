//
//  Toss.swift
//  Swift_Algorithm
//
//  Created by 강민석 on 2020/08/18.
//  Copyright © 2020 MinseokKang. All rights reserved.
//

//import Foundation
//
///// 거래시간 ("yyyy-MM-dd'T'HH:mm:ss") 과 거래금액.
//typealias Transaction = (String, Int32)
//
///// 날짜 (yyyy-MM-dd) 와 해당 날짜 거래내역의 총 합.
//typealias DailyTransaction = (String, Int64)
//
//func read() -> [Transaction] {
//    let n = Int(readLine()!)!
//    var transactions = [Transaction](repeating: ("", 0), count: n)
//    for index in 0..<n {
//        let fragments = readLine()!.split(separator: " ")
//        let date = String(fragments[0])
//        let amount = Int32(fragments[1]) ?? 0
//        transactions[index] = (date, amount)
//    }
//    return transactions
//}
//
//func write(_ dailyTransactions: [DailyTransaction]) {
//    dailyTransactions.forEach {
//        print("\($0) \($1)")
//    }
//}
//
//write(solve(read()))
//
///// 지원자가 작성해야하는 메서드.
/////
///// - Parameter transactions: `Transaction` (거래내역) 의 `Array` 이다.
///// - Returns: `DailyTransaction` (일별 거래내역의 총합) 의 `Array` 이다.
//func solve(_ transactions: [Transaction]) -> [DailyTransaction] {
//
//    var dailyTransaction = [DailyTransaction](repeating: ("", 0), count: transactions.count)
//    var dates = [String](repeating: (""), count: transactions.count)
//
//    for i in transactions {
//        let date = i.0
//
//        let start = date.startIndex
//        let end = date.index(date.firstIndex(of: "T")!, offsetBy: -1)
//        let substring = date[start...end]
//
//        dates.append(String(substring))
//    }
//
//    for i in transactions {
//        let date = i.0
//        let amount = Int64(i.1)
//        var sum: Int64 = amount
//
//        if let idx = dates.lastIndex(of: date) {
//            sum += Int64(transactions[idx].1)
//        }
//
//        dailyTransaction.append((date, sum))
//    }
//
//    return dailyTransaction
//}
//
//
//
///* input
// 5
// 2020-07-12T20:11:36 -97033
// 2020-07-12T16:41:11 65064
// 2020-07-14T03:47:17 12703
// 2020-07-13T11:10:45 6694
// 2020-07-11T22:46:00 -98936
// */
//
//
///* output
// 2020-07-14 12703
// 2020-07-13 6694
// 2020-07-12 -31969
// 2020-07-11 -98936
// */
