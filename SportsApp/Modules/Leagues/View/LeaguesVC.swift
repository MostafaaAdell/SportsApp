//
//  LeaguesVC.swift
//  SportsApp
//
//  Created by Abdallah on 28/09/2023.
//

import UIKit

class LeaguesVC: UIViewController {
    @IBOutlet weak var leaguesCollectionView: UICollectionView!
    
    
    // MARK: - ConfigureCollectionView
    func configureCollectionView(){
        leaguesCollectionView.delegate = self
        leaguesCollectionView.dataSource = self
       
    }
    
    // MARK: - LifeCycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()

        leaguesCollectionView.collectionViewLayout = createCompositionalLayout()
        
        self.leaguesCollectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        leaguesCollectionView.register(UINib(nibName: K.customNibEvent, bundle: nil), forCellWithReuseIdentifier: K.customNibEvent)
        
        leaguesCollectionView.register(UINib(nibName: K.customNibLatestEvent, bundle: nil), forCellWithReuseIdentifier: K.customNibLatestEvent)
        
        leaguesCollectionView.register(UINib(nibName: K.customNibTeams, bundle: nil), forCellWithReuseIdentifier: K.customNibTeams)
        
        leaguesCollectionView.register(UINib(nibName: K.customNibHeaderView, bundle: nil), forSupplementaryViewOfKind: "header", withReuseIdentifier: K.customNibHeaderView)
    }
        
    
    // MARK: - createCompositionalLayout
    func createCompositionalLayout()-> UICollectionViewCompositionalLayout  {
        let layout = UICollectionViewCompositionalLayout { [weak self] (index , enviroment) -> NSCollectionLayoutSection? in
            return self?.createSectionFor(index: index, environment: enviroment)
        }
        return layout
    }
    
    func createSectionFor( index:Int , environment : NSCollectionLayoutEnvironment)-> NSCollectionLayoutSection{
        
        switch index {
        case 0 :
            return     createFirstSection()
        case 1 :
            return     createSecondSection()
        case 2 :
            return     createThirdSection()
        default :
            return     createThirdSection()
        }
    }
    // MARK: - createFirstSection

    func createFirstSection()-> NSCollectionLayoutSection{
        
        let inset:CGFloat = 10
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
               //supplemantry
               let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
               let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize , elementKind: "header" ,alignment: .top)
               section.boundarySupplementaryItems = [header]
        
        return section
    }
    
    // MARK: - createSecondSection
    func createSecondSection()->NSCollectionLayoutSection{
        let inset:CGFloat = 5
        
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.27))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        //    section.orthogonalScrollingBehavior = .continuous
        
        //supplemantry
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize , elementKind: "header" ,alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
    // MARK: - createThirdSection
    func createThirdSection()->NSCollectionLayoutSection{
        let inset:CGFloat = 5
        
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        //supplemantry
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize , elementKind: "header" ,alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}


// MARK: - Extension

extension LeaguesVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.customNibEvent, for: indexPath) as! eventCell
        //
        //        cell.myImg.image = UIImage(named: "PremierLeagueBackGround")
        //        cell.layer.cornerRadius = 25
        //            return cell
        
        switch indexPath.section{
        case 0 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.customNibEvent, for: indexPath) as! eventCell
            cell.layer.cornerRadius = 25
            return cell
            
        case 1 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.customNibLatestEvent, for: indexPath) as! latestEventCell
            cell.layer.cornerRadius = 25
            return cell
            
        case 2 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.customNibTeams, for: indexPath) as! TeamsCell
            cell.layer.cornerRadius = 25
            return cell
            
        default :
            return UICollectionViewCell()
            
        }
        
    }
    //
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        return CGSize(width: collectionView.bounds.width, height: 300)
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = leaguesCollectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: K.customNibHeaderView , for: indexPath) as? MyHeaderView else{
            
            return UICollectionReusableView()
        }
        switch indexPath.section {
        case 0 :
            view.title = "Upcoming Events"
            return view
            
        case 1 :
            view.title = "Latest Events"
            return view
            
        case 2:
            view.title = "Teams"
            return view
            
        default :
            return UICollectionReusableView()
        }
    }
}
    

    
    


    



