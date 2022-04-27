//
//  MyTicketViewController.swift
//  BusTicketApp
//
//  Created by emre usul on 13.02.2022.
//

import UIKit

class MyTicketViewController: UIViewController {
    
    var ticket:[Paid] = []
   
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.dataSource = self
        collectionview.delegate = self
        ticket = [Paid(gidis: Ticket.whereFrom!, varis: Ticket.whereGo!, tarih: Ticket.date!, isimsoyisim: Passenger.name!, saat: Ticket.clock!, idno: Passenger.Id!)]
            }
    
}

extension MyTicketViewController: UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ticket.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "ticket", for: indexPath) as! MyTicketCollectionViewCell
        cell.saat.text = Ticket.clock
        cell.gidis.text = Ticket.whereFrom!
        cell.varis.text = Ticket.whereGo!
        cell.idno.text = Passenger.Id
        
        cell.koltukno.text = Array.array
        
        cell.isimsoyisim.text = Passenger.name! + " \(Passenger.surname!)"
        cell.tarih.text = Ticket.date
        return cell
    }
    
    
}
