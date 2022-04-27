//
//  DetailTableViewCell.swift
//  CoinApp
//
//  Created by emre usul on 16.03.2022.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var coinChangePrice: UILabel!
    @IBOutlet weak var coinChangeValue: UILabel!
    
    @IBOutlet weak var coinLowerPrice: UILabel!
    @IBOutlet weak var coinHigherPrice: UILabel!
   
    @IBOutlet weak var coinSymbol: UILabel!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
