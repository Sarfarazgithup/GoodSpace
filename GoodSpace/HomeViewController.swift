//
//  HomeViewController.swift
//  GoodSpace
//
//  Created by Sarfaraz Ali on 10/12/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        registerCell()
        // Do any additional setup after loading the view.
    }
    
    private func  registerCell() {
        myTableView.register(UINib(nibName: "StepTableViewCell", bundle: nil), forCellReuseIdentifier: "StepTableViewCell")
        myTableView.register(UINib(nibName: "JobsTableViewCell", bundle: nil), forCellReuseIdentifier: "JobsTableViewCell")
    }
    

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = myTableView.dequeueReusableCell(withIdentifier: "StepTableViewCell", for: indexPath) as! StepTableViewCell
            return cell
            
        } else {
            let cell = myTableView.dequeueReusableCell(withIdentifier: "JobsTableViewCell", for: indexPath) as! JobsTableViewCell
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        } else {
            return 500
        }
    }
}

