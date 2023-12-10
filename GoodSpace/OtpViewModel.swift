//
//  OtpViewModel.swift
//  GoodSpace
//
//  Created by Sarfaraz Ali on 10/12/23.
//

import Foundation
import Alamofire
protocol OtpViewM {
    var didOtpSuccess:(()->Void)?{get set}
    func otpVerification(param:[String:Any])
    }

class OtpViewModel:OtpViewM {
    var didOtpSuccess: (() -> Void)?
    
    let url = "\(baseUrl)/api/d2/auth/verifyotp"
    func otpVerification(param:[String:Any]){
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
                            self.didOtpSuccess?()
                        } else {
                            print("->>error",response.error?.localizedDescription)
                        }
                    }
                   // self.didOtpSuccess?()
                    case .failure:
                        break
                }
               // print("response->>",response.result.success)
            }
    }
}
