//
//  JobsTableViewCell.swift
//  GoodSpace
//
//  Created by Sarfaraz Ali on 10/12/23.
//

import UIKit

class JobsTableViewCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var serachView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        serachView.layer.borderColor = UIColor.lightGray.cgColor
        serachView.layer.borderWidth = 0.5
        serachView.layer.cornerRadius = 4
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "JobTableViewCell", bundle: nil), forCellReuseIdentifier: "JobTableViewCell")
        // Initialization code
    }

  
    
}

extension JobsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobTableViewCell", for: indexPath) as! JobTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
   
}
