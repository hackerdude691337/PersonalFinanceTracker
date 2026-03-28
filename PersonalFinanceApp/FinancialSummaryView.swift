//
//  FinancialSummaryView.swift
//  PersonalFinanceApp
//
//  Created by Anthony Moncher (Student) on 3/27/26.
//

import Foundation
import SwiftUI




struct FinancialSummaryView: View {
    @ObservedObject var modelView: DailyTrackerList

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Weekly summary: ")
                Text("Average daily income: \(modelView.averageIncome(), format: .currency(code: "USD"))")
                    .foregroundStyle(.yellow)
                Text("Average daily expenses: \(modelView.averageExpenses(), format: .currency(code: "USD"))")
                    .foregroundStyle(.red)
                Text("Average daily savings: \(modelView.averageSavings(), format: .currency(code: "USD"))")
                    .foregroundStyle(.green)
                Spacer()
                
                Section("Daily Breakdown"){
                    ForEach(modelView.allDays) { day in
                        DailyTrackerRow(model: day)
                    }
                }
                
                Spacer()
                Text("How am I doing this week?")
                    .bold()
                Text(modelView.getPerformance())
                    .font(.headline)
                Spacer()
            }
            
            .navigationTitle("Financial Summary")
        }
    }
}
