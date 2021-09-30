//
//  IntervalOfChart.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 29.05.2021.
//

import Foundation

enum TimeInterval: Int, CaseIterable {
    case oneDay
    case oneWeak
    case threeMonths
    case oneYear
    case all

    var title: String {
        switch self {
        case .oneDay:
            return "1Д"
            
        case .oneWeak:
            return "1Н"
            
        case .threeMonths:
            return "3М"
            
        case .oneYear:
            return "1Г"
            
        case .all:
            return "Все"
        }
    }
}
