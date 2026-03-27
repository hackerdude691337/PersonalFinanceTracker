//
//  DailyTrackerList.swift
//  PersonalFinanceApp
//
//  Created by Anthony Moncher (Student) on 3/27/26.
//

import Foundation

class DailyTrackerList : ObservableObject{
    
    @Published private var days: [DailyTrackerModel] = []
    
    func addDay(newDay: DailyTrackerModel){
        days.insert(newDay, at: 0)
           if days.count > 7 {
               days.removeLast()
           }
    }
    
    
    func getPerformance() -> String {
        
        
        
        return ""
    }
}
