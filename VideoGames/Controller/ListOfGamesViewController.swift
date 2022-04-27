//
//  ListOfGamesViewController.swift
//  VideoGames
//
//  Created by emre usul on 6.03.2022.
//

import UIKit
import Kingfisher

class ListOfGamesViewController: UIViewController {
     
    var data:[String] = []
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
   
    @IBOutlet weak var collectionView: UICollectionView!
    var filteredData = [GameProperties]()
    var games = [GameProperties]()
    
    var currentPage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        
        
        
        collectionView2.delegate = self
        collectionView2.dataSource = self
       
        request(){ [self] (result : Result<BaseResponse,gamesError>) in
            switch result {
            case .failure(let error) :
                print("Hata bulundu. Hata =  \(error)")
            case .success(let response) :
                    self.games = response.results
                self.filteredData = self.games
               
                DispatchQueue.main.async {

                    self.collectionView.reloadData()
                    self.collectionView2.reloadData()
                    
                   
                
            }
        
            }
        }
        
        
        
    }
    
    
    func request(completion : @escaping (Result<BaseResponse,gamesError>) -> Void) {
        
        games.removeAll()
        filteredData.removeAll()
        
            let gamesURL = URL(string: "https://api.rawg.io/api/games?key=723a427ed88d418b97bb6c52854e06a6&page_size=40")
            let session = URLSession.shared
            
            session.dataTask(with: gamesURL!){ data ,response , error in
                guard let data = data else{
        
                    completion(.failure((.noData)))
                    return
                    
                }
                // MARK: İSTEDİĞİMİZ VERİLERİ DÜZENLER
                let decoder = JSONDecoder()
                
                do{
                    let decodedResponse = try decoder.decode(BaseResponse.self, from: data)
                    completion(.success(decodedResponse))
                }
                catch {
                   
                    completion(.failure(.canNotProcessData))
                }
                
            }.resume()
           
        
       
        
    }

    
    
    


}




extension ListOfGamesViewController: UICollectionViewDelegate , UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       
        
        if(collectionView == collectionView2 ){
          
            return 3
                }
        else {
                
                if(filteredData.count == games.count){
                    return filteredData.count - 3
                }
                else{
                    return filteredData.count
                }
        
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        
        if (collectionView == collectionView2) {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ThreeImageCollCollectionViewCell
            if games.count > 0{
                let url = URL(string: games[indexPath.row].background_image!)
                cell2.imageView.kf.setImage(with:url)
            }
          
            return cell2
            
            
            
            
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListOfGamesCollectionViewCell
            
           
            if(self.filteredData.count == self.games.count)
                       {
                           
                           
                cell.nameOfGame.text = games[indexPath.row + 3].name
                cell.rating.text = "\(games[indexPath.row + 3].rating!) - \(games[indexPath.row].released!)"
              
                let url = URL(string: games[indexPath.row + 3].background_image!)
                cell.imageView.kf.setImage(with : url )
                       }
                       else{
                           cell.nameOfGame.text = self.filteredData[indexPath.row  ].name
                           cell.rating.text = (" \(self.filteredData[indexPath.row ].rating!) - \(self.filteredData[indexPath.row].released!) ")
                           let url = URL(string: filteredData[indexPath.row  ].background_image!)
                           cell.imageView.kf.setImage(with : url )
                           cell.image()
                       }
            return cell
        }
        

      
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (collectionView == collectionView2) {
            let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "GameDetailsViewControllerStoryboardID") as! GameDetailsViewController
            
            detailVC.gameID = self.games[indexPath.row].id
            
            self.show(detailVC, sender: nil)
            
            
            
            
        }else {
            let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "GameDetailsViewControllerStoryboardID") as! GameDetailsViewController
            
            detailVC.gameID = self.games[indexPath.row + 3].id
            
            self.show(detailVC, sender: nil)
            
        }
       
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
        
    }
    
    
}

extension ListOfGamesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
               let text = searchText
               if (text.count < 3 ){
                           filteredData = games
                 
                       }
               if (text.count >= 3){
                           filteredData = []
                           for a in 0 ... games.count - 1 {
                               if(games[a].name!.lowercased().contains(text.lowercased())){
                                   filteredData.append(games[a])
                               }
                    
                             
                          
                           }
                       }
        
               self.collectionView.reloadData()
               
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)

    }
   
}

