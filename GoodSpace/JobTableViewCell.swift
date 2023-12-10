//
//  JobTableViewCell.swift
//  GoodSpace
//
//  Created by Sarfaraz Ali on 10/12/23.
//

import UIKit

class JobTableViewCell: UITableViewCell {

    @IBOutlet weak var btnApply: UIButton!
    @IBOutlet weak var btnRemote: UIButton!
    @IBOutlet weak var btnYear: UIButton!
    @IBOutlet weak var btnLpa: UIButton!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.lightGray.cgColor
        mainView.layer.cornerRadius = 8
        btnApply.layer.cornerRadius = 4
        btnRemote.layer.cornerRadius = 4
        btnRemote.layer.borderColor = UIColor.lightGray.cgColor
        btnRemote.layer.borderWidth = 1
        btnLpa.layer.cornerRadius = 4
        btnLpa.layer.borderWidth = 1
        btnLpa.layer.borderColor = UIColor.lightGray.cgColor
        btnYear.layer.cornerRadius = 4
        btnYear.layer.borderWidth = 1
        btnYear.layer.borderColor = UIColor.lightGray.cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
