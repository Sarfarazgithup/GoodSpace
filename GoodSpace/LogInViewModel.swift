//
//  LogInViewModel.swift
//  GoodSpace
//
//  Created by Sarfaraz Ali on 09/12/23.
//

import Foundation
import Alamofire
let baseUrl = "https://api.ourgoodspace.com"
protocol LogInViewM {
    var didLogInSuccess:(()->Void)?{get set}
    func login(param:[String:Any])
    }

class LogInViewModel:LogInViewM {
    var didLogInSuccess: (() -> Void)?
    
    let url = "\(baseUrl)/api/d2/auth/v2/login"
    func login(param:[String:Any]){
        let header:HTTPHeaders = [
            "device-id": UIDevice.current.identifierForVendor?.uuidString ?? "",
            "device-type": "ios"
                ]
        AF.request(url, method: .post, parameters: param,encoding: JSONEncoding.default, headers: header)
            .responseJSON { response in
                print("response->>",response)
                
                switch response.result {
                case .success:
                    
                    if let statusCode = response.response?.statusCode {
                        if (200..<300).contains(statusCode) {
                        self.didLogInSuccess?()
                        } else {
                            print("->>error",response.error?.localizedDescription)                 // Handle other status codes
                        }
                    }
                    
                    case .failure:
                        break
                }
               // print("response->>",response.result.success)
            }
    }
}
