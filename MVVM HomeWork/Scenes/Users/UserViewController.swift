//
//  UserViewController.swift
//  HomeWork3
//
//  Created by emre usul on 6.04.2022.
//

import UIKit

class UserViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var users = [UsersList]()
    var number1 = 0
    var image:[Image] = []
    private var viewModel: UsersListViewModelProtocol = UsersViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getUserList()
      

    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.delegate = self
        
        image = [Image(image: #imageLiteral(resourceName: "leanne")),
                 Image(image: #imageLiteral(resourceName: "erwin")),
                 Image(image: #imageLiteral(resourceName: "clement")),
                 Image(image: #imageLiteral(resourceName: "patricia")),
                 Image(image: #imageLiteral(resourceName: "chelsey")),
                 Image(image: #imageLiteral(resourceName: "mrs")),
                 Image(image: #imageLiteral(resourceName: "kurtis")),
                 Image(image: #imageLiteral(resourceName: "nikolas")),
                 Image(image: #imageLiteral(resourceName: "glenne")),
                 Image(image: #imageLiteral(resourceName: "kelementia")),
        ]
        // Do any additional setup after loading the view.
    }
    

 

}

extension UserViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItem ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usercell", for: indexPath) as! UsersTableViewCell
        cell.nameLabel.text = users[indexPath.row].name
        cell.userNameLabel.text = users[indexPath.row].username
        cell.emailLabel.text = users[indexPath.row].email
        cell.setup(slide: image[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
       number1 = users[indexPath.row].id
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "controller2") as! UserPostViewController
        nextVC.number = number1
        nextVC.name = users[indexPath.row].name
      
        self.show(nextVC, sender: nil)
     
      
}

        
        
    
    
    
}

extension UserViewController: UsersListViewModelDelegate {
    func updateUserList(user: [UsersList]) {
        
        self.users = user
        self.tableView.reloadData()
        
    }
    
    
}
