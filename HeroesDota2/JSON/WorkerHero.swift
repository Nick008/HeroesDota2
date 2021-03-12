//
//  WorkerHero.swift
//  HeroesDota2
//
//  Created by Thipawan Penmoon on 12/3/2564 BE.
//

import SwiftyJSON

class WorkerHero {
    fileprivate let CLASS_TAG = "WorkerHero - >"
    //JSON Key
    fileprivate let js_id = "id"
    fileprivate let js_name = "name"
    fileprivate let js_localized_name = "localized_name"
    fileprivate let js_primary_attr = "primary_attr"
    fileprivate let js_attack_type = "attack_type"
    fileprivate let js_roles = "roles"
    fileprivate let js_legs = "legs"
    
    
    // Main Variable
    fileprivate var mTag:String?
    fileprivate var mJSON:JSON?
    
    fileprivate var mWhere:String?
    fileprivate var mNSData:Data?
    fileprivate var mDisplayLocs:[modelHero]?
    fileprivate var mResults:modelHero.Results = modelHero.Results()
    
    // constructor
    init(_Where:String, _Data:Data){
        self.mWhere = _Where
        self.mNSData = _Data
        
    }
    // start convert JSONString to ModelDisplayInformation
    func initial(_ callback: (AnyObject?, Bool) -> Void){
        // convert NSData to JSONObject
        let json = try! JSON(data: self.mNSData!)
        
        if json != JSON.null {
            // create new
            // ModelMainInfo array storage
            self.mDisplayLocs = []
            
            let _locd:modelHero = modelHero()
            
            
            if json.exists() {
                do{
                    if json != JSON.null {
                        self.mResults = modelHero.Results()
                        var beans:[modelHero.Results]?
                        let jsArr = json.array
                        
                        for js in jsArr! {
                            if beans == nil {
                                beans = []
                                print("nill group")
                                
                            }
                            let _mList = modelHero.Results()
                            
                            _mList.id = js[self.js_id].exists() ? js[self.js_id].stringValue : ""
                            _mList.name = js[self.js_name].exists() ? js[self.js_name].stringValue : ""
                            _mList.localized_name = js[self.js_localized_name].exists() ? js[self.js_localized_name].stringValue : ""
                            _mList.primary_attr = js[self.js_primary_attr].exists() ? js[self.js_primary_attr].stringValue : ""
                            _mList.attack_type = js[self.js_attack_type].exists() ? js[self.js_attack_type].stringValue : ""
                            _mList.legs = js[self.js_legs].exists() ? js[self.js_legs].stringValue : ""
                            
                            if js[self.js_roles].exists() {
                                
                                if js[self.js_roles] != JSON.null {
                                    
                                    _mList.roles = js[self.js_roles].arrayValue.map{$0.stringValue}
                                    
                                }else{
                                    _mList.roles = ["-"]
                                }
                            }
                            
                            _locd.result.insert(_mList, at: _locd.result.count)
                            
                        }
                    }else {
                        print("JSON is error")
                        callback(nil,false)
                    }
                }
            }

            self.mDisplayLocs?.insert(_locd, at: 0 )
            // send callback
            callback(self.mDisplayLocs! as AnyObject?, true)
            
            
        }else{
            
            // json is nil
            print("\(self.CLASS_TAG)initial() json is nil...")
            
            // callback json is nil
            callback(nil, false)
        }
    }
    
}
