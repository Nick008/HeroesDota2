//
//  gHEro.swift
//  HeroesDota2
//
//  Created by Thipawan Penmoon on 12/3/2564 BE.
//

import Alamofire

class gHero {
    
    fileprivate let VC = "gHero"
    
    var id:[String] = []
    var name:[String] = []
    var localized_name:[String] = []
    var primary_attr:[String] = []
    var attack_type:[String] = []
    var roles:[String] = []
    var legs:[String] = []

    var arrRoles:[[String]] = []
    
    func getHero(_ callback: @escaping (ModelHandler) -> Void) {
        
        let hero : CentralHTTP = CentralHTTP(link: "\(RequestURL.urlHero)")
        hero.doGet(RequestHeader.Header(), encoding: JSONEncoding.default, complete: { (response) in
            
            print("status Hero Get : \(response.isSuccess)")
            if response.isSuccess == true {
                callback(response)
            }else{
                print("Error")
            }
        })
    }
    
    func getDataObject(_ nsData:Data, objectIndex:RequestURL.CLASS, callback: @escaping (Bool) -> Void){
        
        id.removeAll()
        name.removeAll()
        localized_name.removeAll()
        primary_attr.removeAll()
        attack_type.removeAll()
        legs.removeAll()
        arrRoles.removeAll()
        
        let cv:CentralConverter = CentralConverter(
            mWhere: self.VC,
            mNSData: nsData,
            mObjectIndex: objectIndex)
        
        cv.initial({ (object) in
            
            let infoObj:[modelHero] = object.anyObject as! [modelHero]
            
            let tem_ARRAY = infoObj
            for i in 0..<tem_ARRAY.count {
                
                
               
                let re = tem_ARRAY[i].result
                for x in 0..<re.count {
                    //print("result \(re[x].roles)")
                    self.id.append(re[x].id)
                    self.name.append(re[x].name)
                    self.localized_name.append(re[x].localized_name)
                    self.primary_attr.append(re[x].primary_attr)
                    self.attack_type.append(re[x].attack_type)
                    self.roles = re[x].roles
                    self.legs.append(re[x].legs)
                    
                    self.arrRoles.insert(self.roles, at: x)
                    self.roles.removeAll()
                }
            
         

                
            }
            callback(true)
        })
    }
}
