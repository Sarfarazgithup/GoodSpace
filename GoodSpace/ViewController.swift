//
//  ViewController.swift
//  GoodSpace
//
//  Created by Sarfaraz Ali on 08/12/23.
//

import UIKit

class ViewController: UIViewController {
    
 
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var btnGetOtp: UIButton!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var MyPageControl: UIPageControl!
    var ImageArray:[String] = ["workImage","settleImage","dreamImage"]
     var timer: Timer?
    var currentCellIndex = 0
    var viewModel:LogInViewM = LogInViewModel()
    


    override func viewDidLoad() {
        super.viewDidLoad()
       
        //startTimer()
        phoneView.layer.borderWidth = 1
        phoneView.layer.borderColor = UIColor.lightGray.cgColor
        phoneView.layer.cornerRadius = 8
        btnGetOtp.layer.cornerRadius = 8
        print("->>>>",UIDevice.current.identifierForVendor?.uuidString ?? "")
        bind()
        
    }


    func startTimer() {

     timer =  Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(scrollAutomatically), userInfo: nil, repeats: true)

    }
    @objc func scrollAutomatically() {

        if currentCellIndex < ImageArray.count - 1 {
            currentCellIndex = currentCellIndex + 1
        }else {
            currentCellIndex = 0
        }
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .right, animated: true)
    }
    
    func bind() {
        viewModel.didLogInSuccess = {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "OtpViewController") as! OtpViewController
            vc.phoneNumber = self.tfPhoneNumber.text ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func actionBtnGetOtp(_ sender: Any) {
        if let phoneNumber = tfPhoneNumber.text, !phoneNumber.isEmpty {
            let body = ["number":phoneNumber, "countryCode": 91] as [String : Any]
            print("->>b",body)
            viewModel.login(param: body)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.myImage.image = UIImage(named: ImageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
       }
}
