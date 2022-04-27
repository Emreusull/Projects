//
//  SeferViewController.swift
//  BusTicketApp
//
//  Created by emre usul on 15.02.2022.
//

import UIKit

class SeferViewController: UIViewController {
  
    @IBOutlet weak var collectionView: UICollectionView!
    
    var road:[sefer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        road = [sefer(fiyat: "200 TL", tarih: Ticket.date!, image: #imageLiteral(resourceName: "aliosman"),  saat: Ticket.clock!) , sefer(fiyat: "190 TL", tarih: Ticket.date!, image: #imageLiteral(resourceName: "fındıkkale") ,  saat: Ticket.clock!) , sefer(fiyat: "210 TL", tarih: Ticket.date!, image: #imageLiteral(resourceName: "pamukkale") ,  saat: Ticket.clock!) , sefer(fiyat: "195 TL", tarih: Ticket.date!, image: #imageLiteral(resourceName: "ulusoy") ,  saat: Ticket.clock!)]
        // Do any additional setup after loading the view.
    }
    
    

   

}

extension SeferViewController: UICollectionViewDelegate , UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return road.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sefercell", for: indexPath) as! SeferCollectionViewCell
        cell.setup(main: road[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            performSegue(withIdentifier: "sefergo", sender:nil)
        }
        if indexPath.row == 1{
            performSegue(withIdentifier: "sefergo", sender:nil)
        }
        if indexPath.row == 2{
            performSegue(withIdentifier: "sefergo", sender:nil)
        }
        if indexPath.row == 3{
            performSegue(withIdentifier: "sefergo", sender:nil)
        }
    }
}
