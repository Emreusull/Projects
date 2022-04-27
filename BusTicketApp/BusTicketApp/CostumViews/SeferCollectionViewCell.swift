//
//  SeferCollectionViewCell.swift
//  BusTicketApp
//
//  Created by emre usul on 15.02.2022.
//

import UIKit

class SeferCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fiyat: UILabel!
    
    @IBOutlet weak var tarih: UILabel!

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var saat: UILabel!
    
    func setup(main:sefer) {
        fiyat.text = main.fiyat
        tarih.text = main.tarih
        image.image = main.image
        saat.text = main.saat
    }
    
}

struct sefer {
    let fiyat:String
    let tarih:String
    let image:UIImage
    let saat:String
   
}
