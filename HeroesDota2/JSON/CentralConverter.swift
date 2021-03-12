//
//  WorkerHero.swift
//  HeroesDota2
//
//  Created by Thipawan Penmoon on 12/3/2564 BE.
//

import Foundation

class CentralConverter {
    // class tag
    fileprivate var CLASS_TAG:String = "CentralConverter->"
    
    // Main variables
    fileprivate var mHandlerObj:ModelHandler?
    fileprivate var mNSData:Data?
    fileprivate var mWhere:String?
    fileprivate var mObjectIndex:RequestURL.CLASS?
    
    // constructor
    init(mWhere:String, mNSData:Data, mObjectIndex:RequestURL.CLASS){
        // update main variables
        self.mNSData = mNSData
        self.mWhere = mWhere
        self.mObjectIndex = mObjectIndex
        
        // create new handler object instance
        self.mHandlerObj = ModelHandler()
        
    }
    
    // initial generating
    func initial(_ callback: @escaping (ModelHandler) -> Void ){
        print("\(self.CLASS_TAG) : \(self.mObjectIndex!)")
        
        /** working with background-thread */
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
        queue.async{
            
            
            // compare enumerator
            if self.mObjectIndex == RequestURL.CLASS.getHero {
                // create worker(generater)
                let worker:WorkerHero = WorkerHero(
                    _Where: self.mWhere! ,
                    _Data: self.mNSData!)

                // intial generate
                // and waiting for callback result
                worker.initial({ (resp, bool) in
                    print("\(self.CLASS_TAG) --> called[\(String(describing: self.mObjectIndex))] back...")

                    // update view
                    // in main thread
                    self.mHandlerObj?.anyObject = resp
                    self.mHandlerObj?.isSuccess = bool

                    DispatchQueue.main.async{
                        // assign callback value
                        self.assignReturnedObject(bool, anyObject: resp)

                        // callback to class caller
                        callback(self.mHandlerObj!)
                    }
                })
            }

            
        }
    }
    /** assign returned object */
    fileprivate func assignReturnedObject(_ isSuccess:Bool, anyObject:AnyObject?){
        mHandlerObj?.isSuccess = isSuccess
        mHandlerObj?.anyObject = anyObject
    }
    
}


