//
//  Hero.swift
//  HeroesDota2
//
//  Created by Thipawan Penmoon on 11/3/2564 BE.
//

import Foundation

struct Hero : Codable{
    var id: Int?
    var name: String?
    var localized_name: String?
    var primary_attr: String?
    var attack_type: String?
    var legs: String?
    var roles: [String]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case localizedname = "localized_name"
        case primaryattr = "primary_attr"
        case attackype = "attack_type"
        case legs
        case roles
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encodeIfPresent(self.id, forKey: .id)
        try? container.encodeIfPresent(self.name, forKey: .name)
        try? container.encodeIfPresent(self.localized_name, forKey: .localizedname)
        try? container.encodeIfPresent(self.primary_attr, forKey: .primaryattr)
        try? container.encodeIfPresent(self.attack_type, forKey: .attackype)
        try? container.encodeIfPresent(self.roles, forKey: .roles)
        try? container.encodeIfPresent(self.legs, forKey: .legs)
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try? values.decode(Int.self, forKey: .id)
        self.name = try? values.decode(String.self, forKey: .name)
        self.localized_name = try? values.decode(String.self, forKey: .localizedname)
        self.primary_attr = try? values.decode(String.self, forKey: .primaryattr)
        self.attack_type = try? values.decode(String.self, forKey: .attackype)
        self.roles = try? values.decode([String].self, forKey: .roles)
        self.legs = try? values.decode(String.self, forKey: .legs)
    }
}
struct User {
    var id: Int?
    var name: String?
    var localized_name: String?
    var primary_attr: String?
    var attack_type: String?
    var legs: String?
    var roles: [String]?
    init(_ dictionary: [String: Any]) {
        self.id = dictionary["id"] as? Int ?? 0
        self.name = dictionary["name"] as? String ?? ""
        self.localized_name = dictionary["localized_name"] as? String ?? ""
        self.attack_type = dictionary["attack_type"] as? String ?? ""
        self.legs = dictionary["legs"] as? String ?? ""
        self.roles = dictionary["roles"] as? [String] ?? []
        
    }
}

//func name(str:String) -> String {
//    switch str {
//    case "Anti-Mage":
//        "anti_mage"
//    default:
//        <#code#>
//    }
//}
class modelHero {
    var result : [Results] = []
    
    class Results {
        var id :String =  ""
        var name: String =  ""
        var localized_name: String =  ""
        var primary_attr: String =  ""
        var attack_type: String =  ""
        var legs: String =  ""
        var roles: [String] = []
    }
    
   
}
