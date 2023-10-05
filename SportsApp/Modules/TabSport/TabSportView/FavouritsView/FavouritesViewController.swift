//
//  FavouritesViewController.swift
//  SportsApp
//
//  Created by Abdallah on 27/09/2023.
//

import UIKit

class FavouritesViewController: UIViewController {

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title  = K.favourites
        self.navigationController?.navigationBar.backItem?.title  = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnTapped(_ sender: Any) {
        let str = UIStoryboard(name: K.storyBoardLeauguesView, bundle: nil)
        let vc = str.instantiateViewController(withIdentifier: K.leaguesAllEvent) as! LeaguesVC
        navigationController?.pushViewController(vc, animated: true)
//        let vc = storyboard?.instantiateViewController(withIdentifier: "LeaguesCollectionView") as! LeaguesCollectionView
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
