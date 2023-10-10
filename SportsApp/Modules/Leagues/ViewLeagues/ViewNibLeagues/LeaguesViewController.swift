//
//  LeaguesViewController.swift
//  SportsApp
//
//  Created by Mustafa on 27/09/2023.
//

import UIKit
import Kingfisher

class LeaguesViewController: UIViewController ,CustomNibCellProtocol{
   
    

    @IBOutlet weak var leaguesTableView: UITableView!
    
    var viewAllLeague:AllLeagueProtocol?
    var getallLeagues:AllLeagueModel?
    

    //MARK: -Configure View Didload VC

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLeagueTableView()
        configureLoadingDataFromApi()
        
        // Do any additional setup after loading the view.
    }
    


    

}

//MARK: - Function Needed using In League TableView TableView
extension LeaguesViewController{
    
    //MARK: - Configure register of Nib
    func configureLeagueTableView(){
        leaguesTableView.dataSource = self
        leaguesTableView.delegate = self
        leaguesTableView.register(UINib(nibName: K.customNibNameLeagues, bundle: nil), forCellReuseIdentifier: K.customNibNameIdentfier)
        
    }
    
    
    //MARK: - Configure The Loading Data
    func configureLoadingDataFromApi(){
        
        viewAllLeague?.getDataFromApiForLeagues()
        viewAllLeague?.handerDataOfLeagues = { [weak self] in
            
            self?.getallLeagues = self?.viewAllLeague?.getLeaguesArray()
            DispatchQueue.main.async {
                self?.leaguesTableView.reloadData()
            }
            
        }
       
    }
    
 
    
}


//MARK: - Adding Data Source To League Table View
extension LeaguesViewController: UITableViewDataSource{
    
    //MARK: - Number of Leagues in Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewAllLeague?.getNumberOfLeagues() ?? 0
    }
    
    
    
    //MARK: - Configure Cell in Table View
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: K.customNibNameIdentfier, for: indexPath) as! CustomNibCell
        
        cell.delegate = self
        if let league =  getallLeagues?.result[indexPath.row] {
            cell.configureCell(league: league)
        }
     
        return cell
        
    }
    
    
    
    
}

//MARK: - Adding Delegate to League Table View
extension LeaguesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return K.customNibNameLeaguesHeight
    }
    
    //MARK: - Press To youtube Button
    func didTapButtonInCell(_ cell: CustomNibCell) {
        
        guard let indexPath = leaguesTableView.indexPath(for: cell) else { return }
        if let league =  getallLeagues?.result[indexPath.row] {
             let stringWithoutSpaces = league.leagueName.replacingOccurrences(of: " ", with: "")
                if let url = URL(string: "https://www.\(stringWithoutSpaces).com") {
                    UIApplication.shared.open(url)
                }
                
            
        }
       
        
    }
    
    //MARK: - Navigate to League Details View
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        if let leagueDetails = getallLeagues?.result[indexPath.row]{
            DependencyProvider.leaugeID = leagueDetails.leagueKey
            DependencyProvider.leagueDetails = leagueDetails            
            self.navigationController?.pushViewController(DependencyProvider.eventForLeagues, animated: true)
            
        }


        
    }
    
}
