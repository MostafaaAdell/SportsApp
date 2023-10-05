//
//  LeaguesVC.swift
//  SportsApp
//
//  Created by Abdallah on 28/09/2023.
//

import UIKit
import Kingfisher

class LeaguesVC: UIViewController {
    @IBOutlet weak var leaguesCollectionView: UICollectionView!
    private var queue = OperationQueue()
    var viewUpcommingEvent:UpCommingEventProtocol?
    var viewlatestEvent:LatestEventProtocol?
    var getUpcommingEvent:UpcommingEventModel?
    
    var getLatestEvent:LatestEventsModel?
    var teamsDetalis:[TeamModel]?
    

    // MARK: - LifeCycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        leaguesCollectionView.collectionViewLayout = createCompositionalLayout()
        registerCollectionViewByCell()
        opertionalQueuetoGetAllTeam()
       
    }
     
  
}


// MARK: - Extension for Delagation and Data Source

extension LeaguesVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section{
        case 0:
            return viewUpcommingEvent?.getNumberOfUpcommingEvent() ?? 0
        case 1:
            return viewlatestEvent?.getNumberOfLatestEvent() ?? 0
        case 2:
            return teamsDetalis?.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        switch indexPath.section{
        case 0 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.customNibEvent, for: indexPath) as! eventCell
            if let cellOfUpcommingEvent = getUpcommingEvent?.result[indexPath.row]{
                cell.configure(upCommingEvent: cellOfUpcommingEvent)
            }
            
       
            return cell
            
        case 1 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.customNibLatestEvent, for: indexPath) as! latestEventCell
            if let event = getLatestEvent?.result[indexPath.row]{
                cell.configure(event: event)
            }
            return cell
            
        case 2 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.customNibTeams, for: indexPath) as! TeamsCell
            if let team = teamsDetalis?[indexPath.row]{
                cell.configure(team: team)
            }
       
            return cell
            
        default :
            return UICollectionViewCell()
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2{
       
            if let teamId =  teamsDetalis?[indexPath.row].teamkey{
                DependencyProvider.teamId = teamId
                self.navigationController?.pushViewController(DependencyProvider.teamDetailsViewController, animated: true)
                
            }
       
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = leaguesCollectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: K.customNibHeaderView , for: indexPath) as? MyHeaderView else{
            
            return UICollectionReusableView()
        }
        switch indexPath.section {
        case 0 :
            view.title = K.upCommingEventHeader
            return view
            
        case 1 :
            view.title = K.latestEventHeader
            return view
            
        case 2:
            view.title = K.teamHeader
            return view
            
        default :
            return UICollectionReusableView()
        }
    }
}



//MARK: - Adding functionality and Logic of League View Controller
extension LeaguesVC{
    
    // MARK: - ConfigureCollectionView
    func configureCollectionView(){
        leaguesCollectionView.delegate = self
        leaguesCollectionView.dataSource = self
       
    }
    
    //MARK: - Getting Team Logo And Names
    func GetTeamLogoAndName(){
        teamsDetalis = [TeamModel]()
        
        if let allTeams = getUpcommingEvent?.result{
            for team in allTeams{
                
                var everyTeam = TeamModel(teamName: team.eventHomeTeam,teamLogo: team.homeTeamLogo,teamkey: team.homeTeamKey)
                if let check = teamsDetalis?.contains(where: {$0 == everyTeam}) {
                    if check == false{
                        teamsDetalis?.append(everyTeam)
                    }
                    
                }
                everyTeam = TeamModel(teamName: team.eventAwayTeam,teamLogo: team.awayTeamLogo,teamkey: team.awayTeamKey)
                if let check = teamsDetalis?.contains(where: {$0 == everyTeam}) {
                    if check == false{
                        teamsDetalis?.append(everyTeam)
                    }
                }
                


            }
        }
        
        if let allTeams = getLatestEvent?.result{
            for team in allTeams{
                
                var everyTeam = TeamModel(teamName: team.eventHomeTeam,teamLogo: team.homeTeamLogo,teamkey: team.homeTeamKey)
                if let check = teamsDetalis?.contains(where: {$0 == everyTeam}) {
                    if check == false{
                        teamsDetalis?.append(everyTeam)
                    }
                    
                }
                everyTeam = TeamModel(teamName: team.eventAwayTeam,teamLogo: team.awayTeamLogo,teamkey: team.awayTeamKey)
                if let check = teamsDetalis?.contains(where: {$0 == everyTeam}) {
                    if check == false{
                        teamsDetalis?.append(everyTeam)
                    }
                }
                


            }
        }
    }
    
    
    //MARK: -  Configure Collection View Register
    
    func registerCollectionViewByCell(){
        
        self.leaguesCollectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: K.leaguesCollectionView)
        
        leaguesCollectionView.register(UINib(nibName: K.customNibEvent, bundle: nil), forCellWithReuseIdentifier: K.customNibEvent)
        
        leaguesCollectionView.register(UINib(nibName: K.customNibLatestEvent, bundle: nil), forCellWithReuseIdentifier: K.customNibLatestEvent)
        
        leaguesCollectionView.register(UINib(nibName: K.customNibTeams, bundle: nil), forCellWithReuseIdentifier: K.customNibTeams)
        
        leaguesCollectionView.register(UINib(nibName: K.customNibHeaderView, bundle: nil), forSupplementaryViewOfKind: K.forSupplementaryViewOfKind, withReuseIdentifier: K.customNibHeaderView)
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

//Applying Opertional Quet
extension LeaguesVC{
    func opertionalQueuetoGetAllTeam(){
        
        
        let getDataOfUpcommingEvent = BlockOperation{
            self.viewUpcommingEvent?.getDataFromApiForUpcomming()
            self.viewUpcommingEvent?.handerDataOfUpcommingEvent = { [weak self] in
                
                self?.getUpcommingEvent = self?.viewUpcommingEvent?.getUpcomingEventArray()
                self?.GetTeamLogoAndName()
                OperationQueue.main.addOperation {
                    self?.leaguesCollectionView.reloadData()

                }
          
            }
        }
        
        let getDataLatestEvent = BlockOperation{
            self.viewlatestEvent?.getDataFromApiForLatest()
            self.viewlatestEvent?.handerDataOfLatestEvent = { [weak self] in
                
                self?.getLatestEvent = self?.viewlatestEvent?.getLatestEventArray()
                
                OperationQueue.main.addOperation {
                    self?.leaguesCollectionView.reloadData()

                }
                
            }
        }
        
      
        
     
        getDataOfUpcommingEvent.addDependency(getDataLatestEvent)
        queue.addOperations([getDataOfUpcommingEvent,getDataLatestEvent], waitUntilFinished: true)
 
        

        
    }
    
}
    

    
    


    


