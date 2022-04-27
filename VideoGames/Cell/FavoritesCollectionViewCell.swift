//
//  FavoritesCollectionViewCell.swift
//  VideoGames
//
//  Created by emre usul on 9.03.2022.
//

import UIKit
import Kingfisher
class FavoritesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameOfGame: UILabel!
    @IBOutlet weak var released: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    func setup(slide:Favorite) {
        nameOfGame.text = slide.nameOfGame
        released.text = slide.released
        rating.text = slide.rating
        
        let url = URL(string: slide.image!)
        self.image.kf.setImage(with:url)
    
       
    
}


}



