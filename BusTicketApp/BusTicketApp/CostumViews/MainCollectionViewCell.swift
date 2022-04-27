//
//  MainCollectionViewCell.swift
//  BusTicketApp
//
//  Created by emre usul on 8.02.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
       
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    
    func setup(main:Maincollection) {
        label.text = main.title
        mainImage.image = main.image
    }


}



struct Maincollection {
    let title:String
    let image:UIImage
}
