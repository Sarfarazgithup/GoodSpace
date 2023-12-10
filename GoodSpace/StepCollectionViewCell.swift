//
//  StepCollectionViewCell.swift
//  GoodSpace
//
//  Created by Sarfaraz Ali on 10/12/23.
//

import UIKit

class StepCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.borderWidth = 1.5
        mainView.layer.borderColor =  UIColor(red:41/255, green:123/255, blue:202/255, alpha: 1).cgColor
        mainView.layer.cornerRadius = 8
        
        // Initialization code
    }

}
