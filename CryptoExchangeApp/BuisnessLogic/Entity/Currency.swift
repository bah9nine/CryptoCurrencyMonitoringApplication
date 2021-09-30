//
//  Currencity.swift
//  CryptoExchangeApp
//
//  Created by Иван Миронов on 18.05.2021.
//

import Foundation
import ObjectMapper

struct Currency: ImmutableMappable {
    let symbol: String
    let name: String
    let price: String
    let priceChanged: Double
    let urlImage: URL?
    let algorithm: String
    let proofType: String
    let capitalization: String
    let volumePerDay: String
    let supply: String
        
    init(map: Map) throws {
        self.symbol = try map.value("CoinInfo.Name")
        self.name = try map.value("CoinInfo.FullName")
        self.price = try map.value("DISPLAY.USD.PRICE")
        let priceChanged: Double = try map.value("RAW.USD.CHANGEPCT24HOUR")
        self.algorithm = try map.value("CoinInfo.Algorithm")
        self.proofType = try map.value("CoinInfo.ProofType")
        self.capitalization = try map.value("DISPLAY.USD.MKTCAP")
        self.volumePerDay = try map.value("DISPLAY.USD.TOTALVOLUME24HTO")
        self.supply = try map.value("DISPLAY.USD.SUPPLY")
        
        let urlString: String = try map.value("CoinInfo.ImageUrl")
        let baseUrl = "https://www.cryptocompare.com"
        self.urlImage = URL(string: baseUrl + urlString)
        
        self.priceChanged = Double(round(priceChanged * 100) / 100)
    }
    
    init(json: [String: Any]) throws {
        guard let coinInfo = json["CoinInfo"] as? [String: Any],
              let symbol = coinInfo["Name"] as? String,
              let name = coinInfo["FullName"] as? String,
              let display = json["DISPLAY"] as? [String: Any],
              let usd = display["USD"] as? [String: Any],
              let price = usd["PRICE"] as? String,
              let capitalization = usd["MKTCAP"] as? String,
              let volumePerDay = usd["TOTALVOLUME24HTO"] as? String,
              let supply = usd["SUPPLY"] as? String,
              let raw = json["RAW"] as? [String: Any],
              let rawUsd = raw["USD"] as? [String: Any],
              let priceChanged = rawUsd["CHANGEPCT24HOUR"] as? Double,
              let algorithm = coinInfo["Algorithm"] as? String,
              let proofType = coinInfo["ProofType"] as? String,
              let urlString = coinInfo["ImageUrl"] as? String
        else {
            throw SystemError.mappingError
        }
        self.symbol = symbol
        self.name = name
        self.price = price
        self.priceChanged = Double(round(priceChanged * 100) / 100)
        self.algorithm = algorithm
        self.proofType = proofType
        self.capitalization = capitalization
        self.volumePerDay = volumePerDay
        self.supply = supply
        
        let baseUrl = "https://www.cryptocompare.com"
        self.urlImage = URL(string: baseUrl + urlString)
    }
}


