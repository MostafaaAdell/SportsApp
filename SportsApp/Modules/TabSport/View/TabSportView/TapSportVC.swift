//
//  TapSportVC.swift
//  SportsApp
//
//  Created by Abdallah on 28/09/2023.
//

import UIKit

class TapSportVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var myCollection: UICollectionView!
    

    // MARK: - LifeCycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        
        
    }
    
    // MARK: - ConfigureCollectionView
    func configureCollectionView(){
        myCollection.delegate = self
        myCollection.dataSource = self
        myCollection.register(UINib(nibName: K.customNibTapSports, bundle: nil), forCellWithReuseIdentifier: K.customNibTapSports)
        
//        myCollection.register(UINib(nibName: K.customNibHeaderView, bundle: nil), forCellWithReuseIdentifier: K.customNibHeaderView)
    }
}

    // MARK: - Extension
extension TapSportVC: UICollectionViewDataSource , UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Sports.sports.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.customNibTapSports , for: indexPath) as! TabCustomCell
        
        let labelText =  Sports.sports[indexPath.item % Sports.sports.count]
        let imageName = Sports.sportsImg[indexPath.item % Sports.sportsImg.count]
        
        cell.configure(with: imageName , titleText: labelText)
        cell.layer.cornerRadius = 15
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = LeaguesViewController(nibName: K.leaguesViewController, bundle: nil)
         vc.view.backgroundColor = .white
         vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         vc.modalPresentationStyle = .fullScreen
         self.present(vc, animated: true, completion: nil)

        
    }
}
