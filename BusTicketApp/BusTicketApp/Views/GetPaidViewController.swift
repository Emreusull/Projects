//
//  GetPaidViewController.swift
//  BusTicketApp
//
//  Created by emre usul on 8.02.2022.
//

import UIKit


class GetPaidViewController: UIViewController {
     
    let collectionview = TicketViewController()
 
    @IBOutlet weak var getPaid: UIView!
    
    @IBOutlet weak var locationWhereGo: UILabel!
    @IBOutlet weak var locationwherefrom: UILabel!
   
    @IBOutlet weak var clock: UILabel!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var seatNo: UILabel!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var id: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationwherefrom.text = Ticket.whereFrom
        locationWhereGo.text = Ticket.whereGo
        date.text = Ticket.date
        clock.text = Ticket.clock
        
        seatNo.text = Array.array
        
    }
        
    
    
    @IBAction func getPaidOnayla(_ sender: Any) {
        Passenger.name = name.text
        Passenger.surname = surname.text
        Passenger.Id = id.text
        dismiss(animated: true, completion: nil)
      
    }
}

    

      
