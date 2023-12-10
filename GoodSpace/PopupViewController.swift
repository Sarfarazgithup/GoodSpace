//
//  PopupViewController.swift
//  GoodSpace
//
//  Created by Sarfaraz Ali on 09/12/23.
//

import UIKit
protocol ChangeNumber {
    func didChangePhoneNumber(phoneNum:String)
}
class PopupViewController: UIViewController {

    @IBOutlet weak var tfPhoneNum: UITextField!
    @IBOutlet weak var btnverifiCation: UIButton!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var popupView: UIView!
    var viewModel:LogInViewM = LogInViewModel()
    var delegate:ChangeNumber!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        popupView.layer.cornerRadius = 12
        phoneView.layer.cornerRadius = 8
        phoneView.layer.borderColor = UIColor.lightGray.cgColor
        phoneView.layer.borderWidth = 1
        btnverifiCation.layer.cornerRadius = 8
        bind()
        // Do any additional setup after loading the view.
    }
    func bind() {
        viewModel.didLogInSuccess = {
            self.delegate.didChangePhoneNumber(phoneNum: self.tfPhoneNum.text ?? "")
            self.view.removeFromSuperview()
        }
    }
    @IBAction func closeActionButton(_ sender: Any) {
       
        self.view.removeFromSuperview()
    }
    
    
    @IBAction func phoneVerifiyAction(_ sender: Any) {
        if let phoneNumber = tfPhoneNum.text, !phoneNumber.isEmpty {
            let body = ["number":phoneNumber, "countryCode": 91] as [String : Any]
            print("->>b",body)
            viewModel.login(param: body)
        }
    }
    
}
