//
//  GameDetailsViewController.swift
//  VideoGames
//
//  Created by emre usul on 6.03.2022.
//

import UIKit
import Kingfisher



class GameDetailsViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailMetacriticRate: UILabel!
    @IBOutlet weak var detailReleasedDate: UILabel!
    @IBOutlet weak var detailOfGame: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    var gameID : Int?
    var image: String?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestDetails(){ (result : Result<DetailResponse,gamesError>) in
             switch result {
                 
             case .failure(let error) :
                 print("Hata bulundu. Hata =  \(error)")
             case .success(let response) :
                 
                 DispatchQueue.main.async {
                    
                     let regulatedString = response.description!.replacingOccurrences(of: "<p>", with: "")
                     let regulatedString2 = regulatedString.replacingOccurrences(of: "<br />", with: "")
                    let regulatedString3 = regulatedString2.replacingOccurrences(of: "</p>", with: "")
                                               
                     self.detailLabel.text = regulatedString3
                     self.detailOfGame.text = response.name
                     self.detailReleasedDate.text = "Release Date : \(response.released!)"
                     self.detailMetacriticRate.text = "Rate : \(response.metacritic!)"
                     self.image = response.background_image
                     let url = URL(string: response.background_image!)
                     self.detailImage.kf.setImage(with: url)
                     
             }
                 
            
             }
         
             
         }
       
    }
    
    @IBAction func addFavorite(_ sender: Any) {
      
        Number.num += 1
        
        Favorit.favorit.append(Favorite(nameOfGame: detailOfGame.text!, rating: detailMetacriticRate.text!, released: detailReleasedDate.text! , image: image))
            
        
    }
    
    func requestDetails(completion : @escaping (Result<DetailResponse,gamesError>) -> Void) {
        
        
        let gamesURL = URL(string: "https://api.rawg.io/api/games/\(self.gameID!)?key=723a427ed88d418b97bb6c52854e06a6")
        

            let session = URLSession.shared
            
            session.dataTask(with: gamesURL!){ data ,response , error in
                guard let data = data else{
                
                    completion(.failure((.noData)))
                    return
                    
                }
         
                let decoder = JSONDecoder()
                
                do{
                    let decodedResponse = try decoder.decode(DetailResponse.self, from: data)
                    completion(.success(decodedResponse))
                }
                catch {
                   
                    completion(.failure(.canNotProcessData))
                }
                
            }.resume()
        
       
        
        
    }


   
}
