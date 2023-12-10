//
//  OtpViewController.swift
//  GoodSpace
//
//  Created by Sarfaraz Ali on 09/12/23.
//

import UIKit

class OtpViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var lblPhoneNumber: UILabel!
    @IBOutlet weak var verifyPhoneBtn: UIButton!
    @IBOutlet weak var txtOTP4: UITextField!
    @IBOutlet weak var txtOTP3: UITextField!
    @IBOutlet weak var txtOTP2: UITextField!
    @IBOutlet weak var txtOTP1: UITextField!
    var viewModel:OtpViewM = OtpViewModel()
    var otp = ""
    var phoneNumber = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addNavigation()
        bind()
        lblPhoneNumber.text = "OTP sent to +91\(phoneNumber) Enter OTP to confirm your phone"
        
        // Do any additional setup after loading the view.
    }
    
    func addNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_icon"), style: .plain, target: self, action: #selector(backButto))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "edit_number"), style: .plain, target: self, action: #selector(editnuber))
        navigationItem.leftBarButtonItem?.tintColor = .gray
        navigationItem.rightBarButtonItem?.tintColor = .gray
    }

    @objc func backButto() {
        navigationController?.popViewController(animated: true)
    }
    @objc func editnuber()
    {
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
        controller.delegate = self
        self.addChild(controller)
        controller.view.frame = self.view.frame
        self.view.addSubview(controller.view)
        controller.didMove(toParent: self)
    }
    func setupUI() {
        verifyPhoneBtn.layer.cornerRadius = 8
        
        
        txtOTP1.layer.cornerRadius = 6
        txtOTP1.layer.borderWidth = 1
        txtOTP1.layer.borderColor =  UIColor(red:56/255, green:159/255, blue:255/255, alpha: 1).cgColor
        txtOTP2.layer.cornerRadius = 6
        txtOTP2.layer.borderWidth = 1
        txtOTP2.layer.borderColor =  UIColor(red:56/255, green:159/255, blue:255/255, alpha: 1).cgColor
        txtOTP3.layer.cornerRadius = 6
        txtOTP3.layer.borderWidth = 1
        txtOTP3.layer.borderColor =  UIColor(red:56/255, green:159/255, blue:255/255, alpha: 1).cgColor
        txtOTP4.layer.cornerRadius = 6
        txtOTP4.layer.borderWidth = 1
        txtOTP4.layer.borderColor =  UIColor(red:56/255, green:159/255, blue:255/255, alpha: 1).cgColor
       
                self.txtOTP1.delegate = self
                self.txtOTP2.delegate = self
                self.txtOTP3.delegate = self
                self.txtOTP4.delegate = self
                
                
                self.txtOTP1.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
                self.txtOTP2.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
                self.txtOTP3.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
                self.txtOTP4.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
    }
    @objc func changeCharacter(textField : UITextField){
           if textField.text?.utf8.count == 1 {
               switch textField {
               case txtOTP1:
                   txtOTP2.becomeFirstResponder()
               case txtOTP2:
                   txtOTP3.becomeFirstResponder()
               case txtOTP3:
                   txtOTP4.becomeFirstResponder()
               case txtOTP4:
                print("OTP = \(txtOTP1.text!)\(txtOTP2.text!)\(txtOTP3.text!)\(txtOTP4.text!)")
                   otp = "\(txtOTP1.text!)\(txtOTP2.text!)\(txtOTP3.text!)\(txtOTP4.text!)"
               default:
                   break
               }
           }else if textField.text!.isEmpty {
               switch textField {
               case txtOTP4:
                   txtOTP3.becomeFirstResponder()
               case txtOTP3:
                   txtOTP2.becomeFirstResponder()
               case txtOTP2:
                   txtOTP1.becomeFirstResponder()
               default:
                   break
               }
           }
       }
    func bind() {
        viewModel.didOtpSuccess = {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func otpVerifiyAction(_ sender: Any) {
        if !otp.isEmpty {
            let body = ["number": phoneNumber,"otp": otp] as [String : Any]
            print("->>>",body)
            viewModel.otpVerification(param: body)
        }
    }
}

extension OtpViewController: ChangeNumber {
    func didChangePhoneNumber(phoneNum: String) {
        phoneNumber = phoneNum
        lblPhoneNumber.text = "OTP sent to +91\(phoneNumber) Enter OTP to confirm your phone"
    }
    
    
}

