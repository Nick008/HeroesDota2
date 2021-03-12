//
//  WorkerHero.swift
//  HeroesDota2
//
//  Created by Thipawan Penmoon on 12/3/2564 BE.
//
import Alamofire

class RequestURL {
    enum CLASS {
        case getHero
       
    }


    static let urlHero:String = "https://api.opendota.com/api/heroes"
    static let urlHeroImage:String = "http://img.dotapicker.net//assets/img/heroes_large/"
   
}

class RequestBODY {
   
    static func Null() -> [String:String] {
        return [:]
    }
    

    
}
class RequestHeader {
    static func Header() -> HTTPHeaders {
        return [
            "Content-Type" : "application/json"
            
        ]
    }
}
