//
//  OnboardingViewController.swift
//  BusTicketApp
//
//  Created by emre usul on 6.02.2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Başlayalım", for: .normal)
            } else {
                nextBtn.setTitle("Devam", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        slides = [OnboardingSlide(title: "Tek Tıkla Satın Al", description: "Biletini seç , ödemeni anında gerçekleştir.", image: #imageLiteral(resourceName: "credittcard")),OnboardingSlide(title: "Biletini Önceden Ayırt", description: " Biletini ayırt , rezervasyon gününden bir gün önce ücretini öde.", image: #imageLiteral(resourceName: "Rezervasyon")),OnboardingSlide(title: "Anında Geri Ödeme", description: "Koşulsuz şartsız , dilediğin zaman biletini iptal edebilirsin.", image: #imageLiteral(resourceName: "geriodeme")),OnboardingSlide(title: "Nereye Gittiğin Kadar Nasıl Gittiğinde Önemli", description: "Son model donatılmış otobüslerimizde yerini al , konforun tadını çıkart.", image: #imageLiteral(resourceName: "buss"))]
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "MenuVC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
    }
    

}

extension OnboardingViewController: UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slide: slides[indexPath.row])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
    
}
