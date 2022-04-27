//
//  FavoritesViewController.swift
//  VideoGames
//
//  Created by emre usul on 9.03.2022.
//

import UIKit

class FavoritesViewController: UIViewController {
    var value: String?
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionView.dataSource = self
        collectionView.delegate = self
       
        
    }
    


}

extension FavoritesViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Number.num
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! FavoritesCollectionViewCell
        cell.setup(slide: Favorit.favorit[indexPath.row])
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
    }
      
        return cell
    }
    
    
    
    
}


