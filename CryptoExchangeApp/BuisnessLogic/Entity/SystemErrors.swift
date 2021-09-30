//
//  SystemErrors.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 19.05.2021.
//

import Foundation

enum SystemError: LocalizedError {
    case mappingError
    case requestProblem
    case rejectWithCoreDataError
    
    var errorDescription: String? {
        switch self {
        case .mappingError:
            return "Mapping Error"
        case .requestProblem:
            return "Request Problem"
        case .rejectWithCoreDataError:
            return "Can't get list of favorite currencies"
        }
    }
}
