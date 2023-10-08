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
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = K.sportGame


    }
    

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
        self.navigationController?.navigationBar.barStyle = UIBarStyle.default
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
//        myCollection.register(UINib(nibName: K.customNibHeaderView, bundle: nil), forCellWithReuseIdentifier: K.customNibHeaderView)
    }
}

    // MARK: - Extension
extension TapSportVC: UICollectionViewDataSource , UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return K.sports.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.customNibTapSports , for: indexPath) as! TabCustomCell
        
        let labelText =  K.sports[indexPath.item % K.sports.count]
        let imageName = K.sportsImg[indexPath.item % K.sportsImg.count]
        cell.configure(with: imageName , titleText: labelText)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

         DependencyProvider.sportType = K.sports[indexPath.item % K.sports.count].lowercased()
          
         self.navigationController?.pushViewController(DependencyProvider.leagueViewController, animated: true)
      
    }
}
