//
//  TapSportVC.swift
//  SportsApp
//
//  Created by Abdallah on 28/09/2023.
//

import UIKit

enum AppearanceStyle{
    case grid
    case list
    
    var selectedAppearance:UIImage?{
        switch self{
        case .grid : return UIImage(systemName: "square.grid.2x2")
        case .list : return UIImage(systemName: "list.bullet")
        }
    }
}

class TapSportVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var myCollection: UICollectionView!
    
    
    var appearanceStyle:AppearanceStyle = .list
    var appearanceStyleButton:UIBarButtonItem?
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = K.sportGame
        navigationController?.topViewController?.navigationItem.rightBarButtonItem?.isHidden = false
        
        
    }
    
    
    // MARK: - LifeCycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupTabViewStyle()
        
    }
    
    //Set Appearance View For tab View
    func setupTabViewStyle(){
        
        appearanceStyleButton = UIBarButtonItem(image: appearanceStyle.selectedAppearance, style: .plain, target: self, action: #selector(twistStyleOfTabCollection))
        
        navigationController?.topViewController?.navigationItem.rightBarButtonItem = appearanceStyleButton
        navigationController?.navigationBar.tintColor = .label
    }
    
    //Configure Fire Button of Appearance style
    @objc func twistStyleOfTabCollection(){
        
        appearanceStyle = (appearanceStyle == .list) ? .grid : .list
        let layout = configureTabViewLayout(appearance: appearanceStyle)
        myCollection.setCollectionViewLayout(layout, animated: true)
        appearanceStyleButton?.image = appearanceStyle.selectedAppearance
    }
    
    
    //Configure The Appearance of layout
    func configureTabViewLayout(appearance:AppearanceStyle)->UICollectionViewLayout{
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        let viewWidth = view.frame.width
        let width = (appearance == .list) ? (viewWidth - 36) : viewWidth * 0.46
        flowLayout.itemSize = .init(width: width, height: 175)
        return flowLayout
        
    }
    
    // MARK: - ConfigureCollectionView
    func configureCollectionView(){
        myCollection.delegate = self
        myCollection.dataSource = self
        myCollection.register(UINib(nibName: K.customNibTapSports, bundle: nil), forCellWithReuseIdentifier: K.customNibTapSports)
        
        let layout = configureTabViewLayout(appearance: appearanceStyle)
        myCollection.setCollectionViewLayout(layout, animated: true)
        
    }
}


// MARK: - Extension for Data Source and Delegate
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
