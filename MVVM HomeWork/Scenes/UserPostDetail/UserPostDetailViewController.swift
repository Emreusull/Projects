//
//  UserPostDetailViewController.swift
//  HomeWork3
//
//  Created by emre usul on 10.04.2022.
//

import UIKit

class UserPostDetailViewController: UIViewController {
    var titles:String?
    var body:String?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    

}

extension UserPostDetailViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userdetail", for: indexPath) as! UserPostDetailTableViewCell
        cell.titleLabel.text = titles
  
        return cell
    }
    
    
}
