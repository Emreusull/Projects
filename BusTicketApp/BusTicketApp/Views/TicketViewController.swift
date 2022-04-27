//
//  TicketViewController.swift
//  BusTicketApp
//
//  Created by emre usul on 7.02.2022.
//

import UIKit


class TicketViewController: UIViewController {
    var indexis : [Int] = []
    var isActive = false
    @IBOutlet weak var seatLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    @IBAction func buyTicket(_ sender: Any) {
     
        let senderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "getPaidVC") as! GetPaidViewController
         present(senderVC, animated: true, completion: nil)
    }
    
    
   
}


extension TicketViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 44
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (indexPath.row + 1 ) % 4 == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! TicketCollectionViewCell
            if indexis.contains(indexPath.row) {
                cell.button2.setImage(UIImage(named: "seatdolu"), for: .normal)
            }
            else { cell.button2.setImage(UIImage(named: "seatbos"), for: .normal) }
            
            cell.button2.tag = indexPath.row + 1
            
           
            cell.label2?.text = String(indexPath.row + 1)
           
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! TicketCollectionViewCell
            if indexis.contains(indexPath.row) {
                cell.button1.setImage(UIImage(named: "seatdolu"), for: .normal)
            }
            else { cell.button1.setImage(UIImage(named: "seatbos"), for: .normal) }
            cell.button1.tag = indexPath.row + 1
            
          
            cell.label?.text = String(indexPath.row + 1)
            return cell
            
        }
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // print(indexPath.row + 1 )
       
        print(Ticket.seat)

    
        if indexis.contains(indexPath.row) {
            
            self.indexis.removeAll(where: {$0 == indexPath.row})
            Ticket.seat.removeAll(where: {$0 == indexPath.row + 1})
            
            Array.array = ""
            for i in indexis {
                if i != indexis.last {
                    Array.array.append(String(i + 1) + " , ") }
                else { Array.array.append(String(i + 1))}
            }
            seatLabel.text = Array.array
            print(Ticket.seat)
           
            SeatCount.count = SeatCount.count - 1 
        
        }
        else {
            
            self.indexis.append(indexPath.row)
            Ticket.seat.append(indexPath.row + 1)
            if indexis.count <= 5 {
            Array.array = ""
            for i in indexis {
                if i != indexis.last {
                    Array.array.append(String(i + 1) + " , ") }
                else { Array.array.append(String(i + 1))}
            } }
           
            
            if SeatCount.count < 5 
            {//seatLabel.text?.append(contentsOf: String(Ticket.koltuk[SeatCount.count]) + " ")
                seatLabel.text = Array.array
            }
            
            SeatCount.count = SeatCount.count + 1
          
            print(Ticket.seat)
        }
        
        
        if SeatCount.count > 5 {
            self.indexis.removeAll(where: {$0 == indexPath.row})
            Ticket.seat.removeAll(where: {$0 == indexPath.row + 1})
            let senderVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertVC") as! AlertViewController
             present(senderVC, animated: true, completion: nil)
        }
        
        collectionView.reloadData()
        

       
      //  collectionView.reloadData()

                
      /*  */
        
      //  self.collectionView.cellForItem(at: indexPath.row)
          
    }
    
    
 
   
}


