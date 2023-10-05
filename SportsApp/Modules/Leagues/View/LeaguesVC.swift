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
        leaguesCollectionView.collectionViewLayout = createCompositionalLayout()
            configureCollectionView()
    }
    
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
        case 3 :
            return     createThirdSection()
        default :
            return     createThirdSection()
        }
    }
    func createFirstSection()-> NSCollectionLayoutSection{
        
        let inset:CGFloat = 10
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.35))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        //       //supplemantry
        //       let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        //       let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize , elementKind: "header" ,alignment: .top)
        //       section.boundarySupplementaryItems = [header]
        //
        return section
    }
    
    func createSecondSection()->NSCollectionLayoutSection{
        let inset:CGFloat = 2.5
        
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.20), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.1))
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
    func createThirdSection()->NSCollectionLayoutSection{
        let inset:CGFloat = 5
        
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset, bottom: inset, trailing: inset)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3))
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
}


// MARK: - Extension
extension LeaguesVC : UICollectionViewDelegate , UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}

    



