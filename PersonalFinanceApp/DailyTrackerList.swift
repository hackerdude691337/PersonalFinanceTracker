//
//  DailyTrackerList.swift
//  PersonalFinanceApp
//
//  Created by Anthony Moncher (Student) on 3/27/26.
//

import Foundation

class DailyTrackerList : ObservableObject{
    
    @Published var days: [DailyTrackerModel] = []
    var allDays: [DailyTrackerModel] { days }

    func addDay(newDay: DailyTrackerModel){
        days.insert(newDay, at: 0)
           if days.count > 7 {
               days.removeLast()
           }
    }
    
    func deleteDay(at offsets: IndexSet){
        days.remove(atOffsets: offsets)
    }
    
    func averageIncome() -> Decimal {
            guard !days.isEmpty else { return 0 }
            var total: Decimal = 0
            for day in days { //iterate through each day, get the total income and divide it by the size of the list.
                total = total + day.TotalIncome
            }
        return total/Decimal(days.count);
        }
        
    func averageExpenses() -> Decimal {
            guard !days.isEmpty else { return 0 }
            var total: Decimal = 0
            for day in days { //iterate through each day, get the total expenses and divide it by the size of the list.
                total = total + day.TotalExpense
            }
            return total/Decimal(days.count);
        }
    
    func averageSavings() -> Decimal{
        guard !days.isEmpty else { return 0 }
        var total: Decimal = 0
        for day in days { //iterate through each day, get the total savings and divide it by the size of the list.
            total = total + day.savings
        }
        return total/Decimal(days.count);
        
    }
    
    
    func getPerformance() -> String {
        
        guard !days.isEmpty else { return "No days inputted!" }
        
        guard averageIncome() > 0 else { return "No income recorded this week." }

        
        let avg_income = averageIncome()
        let avg_expenses = averageExpenses()
        let avg_savings = averageSavings()
        let expensesPercentage = avg_expenses / avg_income
        let savingsPercentage = avg_savings / avg_income
        
        if expensesPercentage > 0.3
        {
            return "You are overspending!"
        }
        else if savingsPercentage > 0.1 && savingsPercentage < 0.3
        {
            return "You have a balanced budget!"
        }
        else if savingsPercentage > 0.3
        {
            return "You are saving well!"
        }
        else{
            return "Not enough data to determine performance"
        }
    }
}
