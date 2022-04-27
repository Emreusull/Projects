//
//  DetailPageViewController.swift
//  CoinApp
//
//  Created by emre usul on 15.03.2022.
//

import UIKit

let formatter2 = NumberFormatter()

class DetailPageViewController: UIViewController {
    var coinName:String?
    var coinPrice:String?
    var coinSymbol:String?
    var coinChange:String?
    var coinHigh:String?
    var coinLow:String?
    @IBOutlet var tableView: UITableView!
    var listedAt:Int?
    var detailCoin = [CoinElement]()
    override func viewDidLoad() {
        super.viewDidLoad()
     
        formatter2.maximumFractionDigits = 2
        formatter2.numberStyle = .currency
        
        let nib = UINib(nibName: "DetailTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DetailTableViewCell")
        
    
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
 
   
}



extension DetailPageViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
       
     
        cell.coinName.text = coinName
        cell.coinSymbol.text = coinSymbol
     
        
        let double = Double(coinPrice!)
        cell.coinPrice.text = formatter.string(from: NSNumber(value: double!))
        
        cell.coinHigherPrice.text = String(format: "%.4f" , Double(coinHigh!)!)
        cell.coinHigherPrice.textColor = .systemGreen
        cell.coinLowerPrice.text = String(format: "%.4f" , Double(coinLow!)!)
        cell.coinLowerPrice.textColor = .systemRed
        
        let coinChangeValue = Double(coinPrice!)! - Double(coinLow!)!
        let coinLowChangeValue = Double(coinHigh!)! - Double(coinPrice!)!
        
        if coinChange! > String(0) {
            cell.coinChangeValue.textColor = .systemGreen
            cell.coinChangeValue.text = "\(self.coinChange!)% "
            cell.coinChangePrice.text = "(\(String(format: "+$%.3f" , coinChangeValue)))"
            cell.coinChangePrice.textColor = .systemGreen
        } else {
            cell.coinChangeValue.textColor = .red
            cell.coinChangeValue.text = "\(self.coinChange!)% "
            cell.coinChangePrice.text = "(\(String(format: "-$%.3f" , coinLowChangeValue)))"
            cell.coinChangePrice.textColor = .red
        }
        
        return cell
    }
    
    
    
}
