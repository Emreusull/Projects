//
//  UsersTableViewCell.swift
//  HomeWork3
//
//  Created by emre usul on 6.04.2022.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var view:UIImageView!
  
    func setup(slide:Image) {
        view.image = slide.image
    }
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
