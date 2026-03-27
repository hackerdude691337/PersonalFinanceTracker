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
                NavigationLink("Add New Daily Finances"){
                    AddDayView(modelView: modelView)
                }
                Spacer()
                NavigationLink("Financial Summary for week"){
                    FinancialSummaryView(modelView: modelView)
                }
                Spacer()
                NavigationLink("How am I doing?"){
                    HowAmIDoingView(modelView: modelView)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
