//
//  ContentView.swift
//  PersonalFinanceApp
//
//  Created by Anthony Moncher (Student) on 3/27/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var modelView = DailyTrackerList()
    
    
    
    var body: some View {
        

        
        NavigationStack{
            VStack(spacing : 20) {
                
                
                Spacer()
                NavigationLink("Daily Finances"){
                    AddDayView(modelView: modelView)
                }
                .bold()
                .foregroundStyle(.green)
                Text("Add your daily financies here!")

                Spacer()
                NavigationLink("Financial Summary for week"){
                    FinancialSummaryView(modelView: modelView)
                }
                .bold()
                
                Text("Check a weekly review of your finances here!")
                .navigationTitle("Weekly Finance Tracker")
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
