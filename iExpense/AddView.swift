//
//  AddView.swift
//  iExpense
//
//  Created by Samet Karakurt on 12.02.2022.
//

import SwiftUI

struct AddView: View {
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @State private var showingAlert = false
    
    let types = ["Business","Personal"]
    
    @ObservedObject var expenses : Expenses
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                
                Picker("Type",selection: $type){
                    ForEach(types, id:\.self){
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount,format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
