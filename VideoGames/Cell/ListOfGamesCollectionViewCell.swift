//
//  ListOfGamesCollectionViewCell.swift
//  VideoGames
//
//  Created by emre usul on 6.03.2022.
//

import UIKit

class ListOfGamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameOfGame: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func image() {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = CGFloat(20)
    }
}



