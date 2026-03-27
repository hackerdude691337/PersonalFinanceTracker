//
//  AddDayView.swift
//  PersonalFinanceApp
//
//  Created by Anthony Moncher (Student) on 3/27/26.
//

import Foundation
import SwiftUI

struct AddDayView : View{
    @ObservedObject var modelView: DailyTrackerList
    
    @State private var date: Date = Date.now
    @State private var totalIncome : Decimal = 0.0
    @State private var totalExpense: Decimal = 0.0
    @State private var foodExpense : Decimal = 0.0
    @State private var entertainmentExpense: Decimal = 0.0
    @State private var transportationExpense: Decimal = 0.0
    @State private var rentExpense: Decimal = 0.0
    @State private var miscExpense: Decimal = 0.0
    
    
    var body: some View{
        VStack(spacing: 15){
            HStack {
                Text("Date:")
                DatePicker(
                    "",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .labelsHidden() // Removes the internal label to match UI
            }
            HStack{
                Text("Total income?: ")
                TextField("Enter a decimal number",
                                     value: $totalIncome,
                          format: .number)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .padding()
                
                
            }
            HStack{
                Text("Total food expenses?: ")
                TextField("Enter a decimal number",
                                     value: $foodExpense,
                          format: .number)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .padding()
                
                
            }
            HStack{
                Text("Total spent on entertainment?: ")
                TextField("Enter a decimal number",
                                     value: $entertainmentExpense,
                          format: .number)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .padding()
            }
            HStack{
                Text("Total spent on transporation?: ")
                TextField("Enter a decimal number",
                                     value: $transportationExpense,
                          format: .number)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .padding()
                
            }
            HStack{
                Text("Total spent on rent?: ")
                TextField("Enter a decimal number",
                                     value: $rentExpense,
                          format: .number)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .padding()
                
            }
            HStack{
                Text("Total spent on misc?: ")
                TextField("Enter a decimal number",
                                     value: $miscExpense,
                          format: .number)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .padding()
                
            }
            
            Button("Add Day"){
                totalExpense = foodExpense + entertainmentExpense + transportationExpense + rentExpense + miscExpense
                let day_ = DailyTrackerModel(Date: date, TotalIncome: totalIncome, TotalExpense: totalExpense, FoodExpense: foodExpense, EntertainmentExpense: entertainmentExpense, TransportationExpense: transportationExpense, RentExpense: rentExpense, MiscExpense: miscExpense)
                modelView.addDay(newDay: day_)
                
                totalIncome = 0.0
                totalExpense = 0.0
                foodExpense = 0.0
                entertainmentExpense = 0.0
                transportationExpense = 0.0
                rentExpense = 0.0
                miscExpense = 0.0
                //reset the fields after we add the day
                
            }
            
            
            
        }
        
        
        
    }
    
}
