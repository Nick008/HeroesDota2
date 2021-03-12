//
//  WorkerHero.swift
//  HeroesDota2
//
//  Created by Thipawan Penmoon on 12/3/2564 BE.
//

import Alamofire

class CentralHTTP {
    // class tag
    fileprivate let CLASS_TAG = "CentralHTTP->"
    
    /*fileprivate var mName:String?
    fileprivate var mAge:Int?*/
    
    // Main variables
    fileprivate var mLink:String?
    fileprivate var mHandlerObj:ModelHandler?
    
   
    init(link:String){
        self.mLink = link
        
        // create instance
        self.mHandlerObj = ModelHandler()
    }
    
    func doGet(_ headers:HTTPHeaders, encoding:ParameterEncoding, complete: @escaping (ModelHandler) -> Void){
        // thread priority
        //let queue = DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default)
        let queue = DispatchQueue(label: "queuename", attributes: .concurrent)
        // working with thread
        queue.async{
            
            AF.request(self.mLink! , encoding: encoding, headers: headers)
                .validate(contentType: ["application/json"])
                .responseJSON { response in
                    // get response code
                    let responseStatusCode = response.response?.statusCode
                    
                    // print response value
                    //self.printResponse("\(responseStatusCode!)", responseBody: response?.result.value!)
                   
                    //check = responseStatusCode!
                    if responseStatusCode == 200 {
                        
                        // assign returned object
                        self.assignReturnedObject(true,
                                                  responseCode: String(describing: responseStatusCode),
                                                  value: response.data! as AnyObject?)
                         print("response code GET : \(String(describing: responseStatusCode))")
                        
                        
                    }else {
                         print("response code GET ERR: \(String(describing: responseStatusCode))")
                        
                        //check = responseStatusCode!
                        // assign returned object
                        self.assignReturnedObject(false,
                                                  responseCode: String(describing: responseStatusCode),
                                                  value: response.data as AnyObject?)
                        print(".else..\(response.debugDescription)\n\nDESCRIPTION \n\(response.description)")
                        //Alamofire.Manager.sharedInstance.session.invalidateAndCancel()
                    }
                    // failed callback
                    complete(self.mHandlerObj!)
            }
        }
        
    }
    
    /** Feature methods */
    fileprivate func printLog(_ tag:String?, msg:String?){
        print("\(self.CLASS_TAG)\(tag!) \(msg!)")
    }

    /** Assign callback value */
    fileprivate func assignReturnedObject(_ isSuccess:Bool, responseCode:String?, value:AnyObject?){
        self.mHandlerObj?.isSuccess = isSuccess
        self.mHandlerObj?.responseCode = responseCode
        self.mHandlerObj?.anyObject = value
    }
}

class ModelHandler {
    var isSuccess:Bool = false
    var responseCode:String?
    var anyObject:AnyObject?
    
}
