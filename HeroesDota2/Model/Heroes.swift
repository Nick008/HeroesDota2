//
//  Heroes.swift
//  HeroesDota2
//
//  Created by Thipawan Penmoon on 11/3/2564 BE.
//

import Foundation

class Heroes  : Codable{
    var id:Int?
    var name:String?
    var localized_name:String?
    var primary_attr:String?
    var attack_type:String?
    var roles:[String]?
    var leg:String?
    
    
     enum CodingKeys: String,CodingKey {
        case id
        case name
        case localized_name
        case primary_attr
        case attack_type
        case roles
        case legs
        
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try? values.decode(Int.self, forKey: .id)
        self.name = try? values.decode(String.self, forKey: .name)
        self.localized_name = try? values.decode(String.self, forKey: .localized_name)
        self.primary_attr = try? values.decode(String.self, forKey: .primary_attr)
        self.attack_type = try? values.decode(String.self, forKey: .attack_type)
        self.roles = try? values.decode([String].self, forKey: .roles)
        self.leg = try? values.decode(String.self, forKey: .legs)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try? container.encode(self.id, forKey: .id)
        try? container.encode(self.name, forKey: .name)
        try? container.encode(self.localized_name, forKey: .localized_name)
        try? container.encode(self.primary_attr, forKey: .primary_attr)
        try? container.encode(self.attack_type, forKey: .attack_type)
        try? container.encode(self.roles, forKey: .roles)
        try? container.encode(self.leg, forKey: .legs)

    }

}


