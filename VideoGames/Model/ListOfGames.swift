//
//  ListOfGames.swift
//  VideoGames
//
//  Created by emre usul on 6.03.2022.
//

import Foundation


struct  BaseResponse : Decodable {
    let results : [GameProperties]
    }

struct  DetailResponse : Decodable {
    var name : String?
    var description : String?
    var metacritic : Int?
    var released : String?
    var background_image : String?
 
    }




enum gamesError : Error {
    case noData
    case canNotProcessData
}



struct GameProperties : Decodable{
    var id  : Int?
    var name  : String?
    var released : String?
    var background_image  : String?
    var rating : Double?
}






