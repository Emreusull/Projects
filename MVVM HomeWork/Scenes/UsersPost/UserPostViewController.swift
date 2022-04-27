//
//  UserPostViewController.swift
//  HomeWork3
//
//  Created by emre usul on 7.04.2022.
//

import UIKit

class UserPostViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    var post = [UserPostList]()
    var number = 0
    var name = ""
    var array: [String] = []
    private var viewModel: UserPostViewModelProtocol = UserPostViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getPost()
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        tableView.delegate = self
        tableView.dataSource = self
        viewModel.delegate = self
        
      
       
        // Do any additional setup after loading the view.
    }
    


}

extension UserPostViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userPost", for: indexPath) as! UserPostTableViewCell
       
       
        nameLabel.text = "\(name) posts "
        if array.count > 0 {
            cell.postLabel.text = array[indexPath.row] }
        else {
            cell.postLabel.text = ""
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let PostDetailVC = self.storyboard?.instantiateViewController(withIdentifier:"postDetail") as! UserPostDetailViewController
        PostDetailVC.titles = post[indexPath.row].body
        PostDetailVC.body = post[indexPath.row].title
          self.show(PostDetailVC, sender: nil)
       
        
    }
    
}

extension UserPostViewController: UserPostViewModelDelegate {
    func updatePostList(post: [UserPostList]) {
        self.post = post
        for i in 0..<post.count {
            if post[i].userId == number {
                array.append(post[i].title!)
                
            }
        }
        self.tableView.reloadData()
        
    }
    
    
}
