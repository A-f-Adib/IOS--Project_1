//
//  ContentView.swift
//  Wesplit
//
//  Created by A.f. Adib on 8/15/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var checkAmount = 0.00
    @State private var nOfpeople = 0
    @State private var tipsPer = 10
    
    let tipPer = [5, 10, 15, 20,25]
    
    var totalPerperson : Double {
        
        let peopleCount = Double (nOfpeople + 2)
        let tipsPercent = Double (tipsPer)
        
        let tipValue = checkAmount / 100 * tipsPercent
        let grandTotal = checkAmount + tipValue
         let amountPerhead = grandTotal / peopleCount
        
        return amountPerhead
    }
    
    var body: some View {
        
        NavigationView {
            
        
        Form{
            Section{
                TextField( "Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                
                Picker("Select no of people", selection: $nOfpeople){
                    ForEach(2..<100){
                    Text("\($0) people")
               }
            }
                
        } header : {
            Text("Total Bill")
        }
            Section {
                Picker("Tip percentage", selection: $tipsPer){
                    ForEach(tipPer, id: \.self) {
                        Text($0, format: .percent)
                    }
                }
            }
            
           
            
            Section{
                
                Text(totalPerperson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    
                 } header : {
                     Text("Total per person")
                 }
            
               }
            
        .navigationTitle("WeSplit")
           
        }
        
    }
    
}
        
        
//        NavigationView{
//            Form{
//
//                Picker("Select any number", selection: $selectedStd){
//                    ForEach(students, id: \.self){
//                        Text($0)
//                    }
//                }
//
//
//            }
//        }
       
 //       }
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
