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
    
    // MARK: - ConfigureCollectionView
    func configureCollectionView(){
        myCollection.delegate = self
        myCollection.dataSource = self
        myCollection.register(UINib(nibName: "TabCustomCell", bundle: nil), forCellWithReuseIdentifier: "TabCustomCell")
    }
    
    // MARK: - LifeCycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        self.title = "Sports"

        
    }

}

    // MARK: - Extension
extension TapSportVC: UICollectionViewDataSource , UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCustomCell", for: indexPath) as! TabCustomCell
        
        let imageName = "1"
        let labelText = "Football"
        
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
