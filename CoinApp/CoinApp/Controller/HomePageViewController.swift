//
//  HomePageViewController.swift
//  CoinApp
//
//  Created by emre usul on 14.03.2022.
//

import UIKit
import Kingfisher

let formatter = NumberFormatter()
var number = 0
class HomePageViewController: UIViewController {
    
    
    
    @IBOutlet weak var price: UIButton!
    @IBOutlet var dataButton: [UIButton]!
    @IBOutlet weak var tableView: UITableView!
    
    var highervalue:Double = 0.0
    var loverValue:Double = 0.0
    var coin = [CoinElement]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        formatter.maximumFractionDigits = 3
        formatter.numberStyle = .currency
        
        price.layer.cornerRadius = price.frame.height / 2
        dataButton.forEach { (btn) in
            btn.layer.cornerRadius = btn.frame.height / 2
            btn.isHidden = true
            btn.alpha = 0
        }
        
        
        let nib = UINib(nibName: "HomePageTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HomePageTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        request(){ [self] (result : Result<Coin,gamesError>) in
            switch result {
            case .failure(let error) :
                print("Hata bulundu. Hata =  \(error)")
            case .success(let response) :
                self.coin = response.data.coins
            
                DispatchQueue.main.async {

                    self.tableView.reloadData()
            }
            }
        }
        }
        
    @IBAction func Price(_ sender: Any) {
        dataButton.forEach { (btn) in
            UIView.animate(withDuration: 0.7) {
                btn.isHidden = !btn.isHidden
                btn.alpha = btn.alpha == 0 ? 1 : 0
                btn.layoutIfNeeded()
            }
            price.titleLabel?.text = "Price"
        }
        
        number = 0
    }
    
    @IBAction func marketCap(_ sender: Any) {
        dataButton.forEach { (btn) in
            UIView.animate(withDuration: 0.7) {
                btn.isHidden = !btn.isHidden
                btn.alpha = btn.alpha == 0 ? 1 : 0
                btn.layoutIfNeeded()
            }
            price.titleLabel?.text = "MarketCap"
        }
        number = 1
    }
    
    @IBAction func twentyFourVolume(_ sender: Any) {
        dataButton.forEach { (btn) in
            UIView.animate(withDuration: 0.7) {
                btn.isHidden = !btn.isHidden
                btn.alpha = btn.alpha == 0 ? 1 : 0
                btn.layoutIfNeeded()
            }
            price.titleLabel?.text = "24h Volume"
        }
       number = 2
    }
    
        
    func request(completion : @escaping (Result<Coin,gamesError>) -> Void) {
        
            let gamesURL = URL(string: "https://psp-merchantpanel-service-sandbox.ozanodeme.com.tr/api/v1/dummy/coins")
            let session = URLSession.shared
            
            session.dataTask(with: gamesURL!){ data ,response , error in
                guard let data = data else{
        
                    completion(.failure((.noData)))
                    return
                    
                }
         
                let decoder = JSONDecoder()
                
                do{
                    let decodedResponse = try decoder.decode(Coin.self, from: data)
                    completion(.success(decodedResponse))
                }
                catch {
                   
                    completion(.failure(.canNotProcessData))
                }
                
            }.resume()
           
    
       
        
    }
   
   
        
 
    }
    





extension HomePageViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coin.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageTableViewCell", for: indexPath) as! HomePageTableViewCell
        
        let newURL = URL(string: (coin[indexPath.row].iconUrl!.replacingOccurrences(of: "svg", with: "png")))
        var tipText:String = ""
        
        if number == 0 {
        let tip: Double = Double(self.coin[indexPath.row].price!)!
       
        if Double(self.coin[indexPath.row].price!)! > 0.02 {
            
            let double = Double(coin[indexPath.row].price!)
            cell.coinPrice.text = formatter.string(from: NSNumber(value: double!))
        } else { tipText = String(format: "%.6f", tip)
            cell.coinPrice.text = "$\(tipText)"
        } }
        
        
        
        
        if number == 1 {
            let double = Double(coin[indexPath.row].marketCap!)
            cell.coinPrice.text = formatter.string(from: NSNumber(value: double!))
          
        }
        
        
        
        if number == 2 {
         
            let double = Double(coin[indexPath.row].the24HVolume!)
           cell.coinPrice.text = formatter.string(from: NSNumber(value: double!))
            
        }
         
    
        
        
        
        cell.coinName.text = self.coin[indexPath.row].name
 
        cell.coinSymbol.text = self.coin[indexPath.row].symbol
       
        cell.coinImage.kf.setImage(with: newURL)
    
        
        
        if number == 0 {
        
        if self.coin[indexPath.row].change! > String(0) {
            cell.coinPriceChange.textColor = .systemGreen
            cell.coinPriceChange.text = "\(self.coin[indexPath.row].change!)% "
            
        } else {
            cell.coinPriceChange.textColor = .red
            cell.coinPriceChange.text = "\(self.coin[indexPath.row].change!)%"
        }
        }
        
        if number == 1 {
            cell.coinPriceChange.text = "MarketCap"
            cell.coinPriceChange.textColor = .blue
        }
        
        if number == 2 {
            cell.coinPriceChange.text = "24h Volume"
            cell.coinPriceChange.textColor = .magenta
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "CoinDetails") as! DetailPageViewController
        
        if coin.count > 0 {
        for i in 0...26 {
            if Double(coin[indexPath.row].sparkline![i])! > highervalue {
                highervalue = Double(coin[indexPath.row].sparkline![i])!
            }
            
        } }
        
        if coin.count > 0 {
            loverValue = Double(coin[indexPath.row].sparkline![0])!
            for i in 1...25 {
                if Double(coin[indexPath.row].sparkline![i])! < loverValue {
                    loverValue = Double(coin[indexPath.row].sparkline![i])!
                }
            }
        }
        
       
        detailVC.coinHigh = String(highervalue)
        highervalue = 0
        detailVC.coinLow = String(loverValue)
        loverValue = 0 
        detailVC.coinName = coin[indexPath.row].name
        detailVC.coinPrice = coin[indexPath.row].price
        detailVC.coinSymbol = coin[indexPath.row].symbol
        detailVC.coinChange = coin[indexPath.row].change
        self.show(detailVC, sender: nil)
        
      //  performSegue(withIdentifier: "DetailVC", sender: nil)
    }
}
 


