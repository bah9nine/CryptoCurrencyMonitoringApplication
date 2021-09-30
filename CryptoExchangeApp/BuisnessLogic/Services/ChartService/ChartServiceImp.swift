//
//  ChartServiceImp.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 29.05.2021.
//

import Foundation
import Alamofire
import ObjectMapper

class ChartServiceImp: ChartSevice {
    
    private let baseUrl = "https://min-api.cryptocompare.com/data/v2/"
    private let apiKey = "4a20ad2bd56053fd54217e2980f14696fd978ee97020414ce49f48bae2862be2"
    static let shared = ChartServiceImp()
    private init() {}
    
    func getPreviousValue( symbol: String, intervalType: TimeInterval, _ completionHandler:  @escaping ([CrypthoCurrencyPrice]?, Error?) -> Void) {
        let paramType = urlParameter(of: intervalType)
        let url = "\(baseUrl)\(paramType.urlParamInterval)"
        let param: Parameters = ["fsym": symbol, "tsym": "USD", "limit": paramType.limit]
        
        AF.request(url, parameters: param).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                
                do {
                    guard let json = value as? [String: Any],
                          let mainData = json["Data"] as? [String: Any],
                          let data = mainData["Data"] as? [[String:Any]] else {
                        throw SystemError.requestProblem
                    }
                    
                    let priviousPriceArray = try Mapper<CrypthoCurrencyPrice>().mapArray(JSONObject: data)

                    completionHandler(priviousPriceArray, nil)
                } catch {
                    completionHandler(nil,error)
                }
        
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    private func urlParameter(of time: TimeInterval) -> (urlParamInterval: String, limit: Int) {
        switch time {
        case .oneDay:
            let urlParamInterval = "histohour"
            let limit = 24
            return (urlParamInterval, limit)
            
        case .oneWeak:
            let urlParamInterval = "histohour"
            let limit = 168
            return (urlParamInterval, limit)
            
        case .threeMonths:
            let urlParamInterval = "histoday"
            let limit = 90
            return (urlParamInterval, limit)
            
        case .oneYear:
            let urlParamInterval = "histoday"
            let limit = 360
            return (urlParamInterval, limit)
            
        case .all:
            let urlParamInterval = "histoday"
            let limit = 2000
            return (urlParamInterval, limit)
        }
    }
}
