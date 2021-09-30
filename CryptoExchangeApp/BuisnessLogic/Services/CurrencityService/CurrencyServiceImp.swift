//
//  CurrencityServiceImp.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 18.05.2021.
//

import Foundation
import Alamofire
import ObjectMapper

class CurrencyServiceImp: CurrencyService {
    static let shared = CurrencyServiceImp()
    private init() {}
    var currencyArray: [Currency] = []
    
    private let baseUrl = "https://min-api.cryptocompare.com/data"
    private let apiKey = "4a20ad2bd56053fd54217e2980f14696fd978ee97020414ce49f48bae2862be2"
    
    func getCurrency(limit: Int ,_ completionHandler: @escaping ([Currency]?, Error?) -> Void) {
        let url = "\(baseUrl)/top/mktcapfull"
        let params: Parameters = ["api_key": apiKey, "tsym": "USD", "limit": limit]
    
        AF.request(url, parameters: params).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
            
                do {
                    guard let json = value as? [String: Any],
                          let coinArray = json["Data"] as? [[String: Any]] else {
                        throw SystemError.requestProblem
                    }
//                    let array = try Mapper<Currency>().mapArray(JSONObject: coinArray)
//                    let array = try Currency(json: json)
                    var array: [Currency] = []
                    
                    for coinIndex in 0..<coinArray.count {
                        let coin = coinArray[coinIndex]
                        if let currncy = try? Currency(json: coin) {
                            array.append(currncy)
                        }
                    }
                    
                    self.currencyArray = array
                    completionHandler(array, nil)
                } catch {
                    completionHandler(nil, error)
                }
                
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
}
