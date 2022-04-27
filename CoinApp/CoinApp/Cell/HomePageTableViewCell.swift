//
//  HomePageTableViewCell.swift
//  CoinApp
//
//  Created by emre usul on 14.03.2022.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {

    @IBOutlet weak var coinPriceChange: UILabel!
    @IBOutlet weak var coinPrice: UILabel!
    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var coinSymbol: UILabel!
    @IBOutlet weak var coinImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
