//
//  DailyTrackerRow.swift
//  PersonalFinanceApp
//
//  Created by Anthony Moncher (Student) on 3/27/26.
//

import Foundation

import SwiftUI



struct DailyTrackerRow: View {
    let model: DailyTrackerModel
    @State private var isExpanded = false
    
    private let dateFormatter: DateFormatter = { //formats the date to read easily
        let f = DateFormatter()
        f.dateFormat = "EEE, MMM d"
        return f
    }()
    
    private func format(_ value: Decimal) -> String {
        currencyFormatter.string(from: value as NSDecimalNumber) ?? "$0.00" //formats the Decimal as a correct USD format
    }
    
    private let currencyFormatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .currency
        f.currencyCode = "USD"
        f.maximumFractionDigits = 2 //converts currency into correct currency format, usd format
        return f
    }()
    
    
    var body: some View{
        VStack{
            
            Button {
                withAnimation(.spring(duration: 0.3)) { isExpanded.toggle() } //if we click button we expand it (its a toggle)
            }
            label: {
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 3) {
                        Text(dateFormatter.string(from: model.Date))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.primary)
                        
                        HStack(spacing: 12) {
                            Label(format(model.TotalIncome), systemImage: "arrow.down.circle.fill")
                                .foregroundStyle(.green)
                            Label(format(model.TotalExpense), systemImage: "arrow.up.circle.fill")
                                .foregroundStyle(.red)
                        }
                        .font(.caption)
                    }
                    
                    
                }
                
            }
            if isExpanded{
                VStack{
                    Divider()
                        .padding(.vertical, 4)
                    Text("Expense Breakdown")
                    Label("Food expense", systemImage: "fork.knife")
                                       .font(.subheadline)
                                       .foregroundStyle(.secondary)
                    Text(format(model.FoodExpense))
                                       .font(.subheadline)
                                       .foregroundStyle(.primary)
                    Spacer()

                    
                    Label("Rent expense", systemImage: "house")
                                       .font(.subheadline)
                                       .foregroundStyle(.secondary)
                                   
                    Text(format(model.RentExpense))
                                       .font(.subheadline)
                                       .foregroundStyle(.primary)
                    Spacer()
                    
                    
                    Label("Transportation expense", systemImage: "car")
                                       .font(.subheadline)
                                       .foregroundStyle(.secondary)
                    Text(format(model.TransportationExpense))
                                       .font(.subheadline)
                                       .foregroundStyle(.primary)
                  
                    Spacer()
                    
                    Label("Misc expense", systemImage: "gear")
                                       .font(.subheadline)
                                       .foregroundStyle(.secondary)
                                 
                    Text(format(model.MiscExpense))
                                       .font(.subheadline)
                                       .foregroundStyle(.primary)
                    Spacer()
                    
                }
                
                
                
                
                
            }
            
        }
        
    }
}
