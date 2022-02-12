//
//  ContentView.swift
//  iExpense
//
//  Created by Samet Karakurt on 5.02.2022.
//

import SwiftUI

struct ContentView: View {
 
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("PERSONAL")){
                    ForEach(expenses.items){item in
                        if(item.type == "Personal"){
                            HStack{
                                Text(item.name)
                                    .font(.headline)
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(item.amount < 10 ? .green : (item.amount < 100 ? .yellow : .red))
                        
                            }
                        }else{
                            
                        }

                    }
                    .onDelete(perform: removeItems)
                    
                }
                
                Section(header: Text("BUSINESS")) {
                    ForEach(expenses.items){item in
                        if(item.type == "Business"){
                            HStack{
                                Text(item.name)
                                    .font(.headline)
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(item.amount < 10 ? .green : (item.amount < 100 ? .yellow : .red))
                            }
                        }else{
                            
                        }

                    }
                    .onDelete(perform: removeItems)
                }

            }
            .navigationTitle("iExpense")
                .navigationBarItems(leading: EditButton(), trailing:
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    })
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets : IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
