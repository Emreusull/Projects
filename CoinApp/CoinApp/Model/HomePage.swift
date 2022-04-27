//
//  HomePage.swift
//  CoinApp
//
//  Created by emre usul on 14.03.2022.
//

import Foundation
import SwiftUI

 struct Coin: Decodable{
   let data:DataClass
 }

struct DataClass: Decodable{
    let coins:[CoinElement]
}

struct CoinElement: Decodable {
    let symbol:String?
    let name:String?
    let color:String?
    let iconUrl:String?
    let price:String?
    let change:String?
    let sparkline:[String]?
    let marketCap:String?
    let the24HVolume:String?
    
    enum CodingKeys: String , CodingKey {
        case the24HVolume = "24hVolume"
        case symbol
        case name
        case iconUrl
        case price
        case change
        case sparkline
        case marketCap
        case color
    }
    
}




enum gamesError : Error {
    case noData
    case canNotProcessData
}




