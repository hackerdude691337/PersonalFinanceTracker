//
//  DailyTrackerModel.swift
//  PersonalFinanceApp
//
//  Created by Anthony Moncher (Student) on 3/27/26.
//

import Foundation

struct DailyTrackerModel : Identifiable{
    
    let id = UUID()
    var Date: Date
    var TotalIncome : Decimal
    var TotalExpense: Decimal
    var FoodExpense : Decimal?
    var EntertainmentExpense: Decimal?
    var TransportationExpense: Decimal?
    var RentExpense: Decimal?
    var MiscExpense: Decimal?
    var savings: Decimal
    
    
}


