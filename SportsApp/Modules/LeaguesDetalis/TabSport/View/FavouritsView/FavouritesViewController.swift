//
//  FavouritesViewController.swift
//  SportsApp
//
//  Created by Abdallah on 27/09/2023.
//

import UIKit

class FavouritesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favourites"
    }

    @IBAction func btnTapped(_ sender: Any) {
        let str = UIStoryboard(name: "LeauguesView", bundle: nil)
        let vc = str.instantiateViewController(withIdentifier: "LeaguesVC") as! LeaguesVC
        navigationController?.pushViewController(vc, animated: true)
//        let vc = storyboard?.instantiateViewController(withIdentifier: "LeaguesCollectionView") as! LeaguesCollectionView
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
