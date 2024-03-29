//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Samet Karakurt on 12.02.2022.
//

import Foundation

struct ExpenseItem : Identifiable, Codable {
    var id = UUID()
    let name : String
    let type : String
    let amount : Double
}
