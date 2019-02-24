//
//  ApiClient.swift
//  Sample
//
//  Created by rajnikant on 16/01/19.
//  Copyright © 2019 rajnikant. All rights reserved.
//

import Foundation
import Alamofire

class ApiClient: NSObject {
    
    func fetApiRequest(url : String, completion:@escaping ( Model) -> () ) {
        sdc
      
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<600)
            .responseString { (jsonData) in
                
                do {
                    
                    print(jsonData)
                    //let json = try JSON(jsonData.result.value )
                     // print(json)
                    let data = Data((jsonData.result.value?.utf8)!)
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(Model.self, from: data)
                    completion(responseModel)
                    
                    let upMovie = try jsonDecoder.decode(Model.self, from: jsonData.data!)
                    jsonData.result
                    //print("Name : \(String(describing: upMovie.title))")
                    
                    print(upMovie)
                    
                }
                catch{
                      print("upMovie")
                }
                
                
        }
                          
//        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
//            .validate(statusCode: 200..<600)
//            .responseString { response in
//
//                switch response.result
//                {
//                case .failure(let error):
//                    if let data = response.data {
//                        print("Print Server Error: " + String(data: data, encoding: String.Encoding.utf8)!)
//                    }
//                    print(error)
//
//                case .success(let value):
//
//                    print(value)
//
//                }
//
//        }

        
        
    }
    

    
}
