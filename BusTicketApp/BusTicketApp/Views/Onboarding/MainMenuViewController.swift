//
//  MainMenuViewController.swift
//  BusTicketApp
//
//  Created by emre usul on 8.02.2022.
//

import UIKit
import Foundation





class MainMenuViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var clockPicker: UIDatePicker!
    
    @IBOutlet weak var whereFrom: UITextField!
    @IBOutlet weak var whereGo: UITextField!
    
    
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var clockText: UITextField!
   
   
    var menu:[Maincollection] = []
    var button:MainCollectionViewCell?
  
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.addTarget(self, action: #selector(MainMenuViewController.dateChanged(datePicker :)), for: .valueChanged)
        clockPicker.addTarget(self, action: #selector(MainMenuViewController.clockChanged(datePicker :)), for: .valueChanged)
        menu = [Maincollection(title: "Biletlerim", image: #imageLiteral(resourceName: "busticket")) ,Maincollection(title: "Rezervasyon", image: #imageLiteral(resourceName: "Rezervasyon")), Maincollection(title: "Ayarlar", image: #imageLiteral(resourceName: "setting")),Maincollection(title: "Çıkış", image: #imageLiteral(resourceName: "exit"))]
        
        
       
        
        collectionView.delegate = self
        collectionView.dataSource = self
    
        // Do any additional setup after loading the view.
    }
    @IBAction func TicketViewButton(_ sender: Any) {
        Ticket.whereFrom = whereFrom.text!
        Ticket.whereGo = whereGo.text!
        Ticket.date = dateText.text
        Ticket.clock = clockText.text
        performSegue(withIdentifier: "togoVC", sender:nil)
    
    }
    

    
    
    @objc func dateChanged(datePicker:UIDatePicker){
        
        datePicker.datePickerMode = .date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MM yyyy"
    
        dateText.text = dateFormatter.string(from: datePicker.date)
        
        view.endEditing(true)
    }
    
    @objc func clockChanged(datePicker:UIDatePicker){
        
        clockPicker.datePickerMode = .time
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeStyle = .short
        
        dateFormatter.locale = Locale(identifier: "tr")
        
        clockText.text = dateFormatter.string(from: clockPicker.date)
        
        view.endEditing(true)
    }
    
    
}

extension MainMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! MainCollectionViewCell
        cell.setup(main: menu[indexPath.row] )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        print(indexPath.row)
        if indexPath.row == 0{
            performSegue(withIdentifier: "myticketSegue", sender:nil)
        }
        if indexPath.row == 1{
            performSegue(withIdentifier: "ticketVC", sender:nil)
        }
       
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 50, height: 50)
       }
    
    
    
    
   

}


