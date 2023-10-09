//
//  FavouritesViewController.swift
//  SportsApp
//
//  Created by Abdallah on 27/09/2023.
//

import UIKit
import Reachability

class FavouritesViewController: UIViewController {
    
    @IBOutlet weak var favouritesLeague: UITableView!
    let leagueCoreData = LeaguesCoreData.sharedDataLeagues
    var leagueArray:[Leagues]?
   
    
   
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title  = K.favourites
        self.navigationController?.navigationBar.backItem?.title  = ""
        navigationController?.topViewController?.navigationItem.rightBarButtonItem?.isHidden = true

        if let (_,retrivedData) = leagueCoreData.retrivedLeagueList(){
            leagueArray = retrivedData
            
        }
        self.favouritesLeague.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLeagueTableView()
        if let (_,retrivedData) = leagueCoreData.retrivedLeagueList(){
            leagueArray = retrivedData
        }
        
    }
    
    
}

//MARK: - Function Needed using In League TableView TableView
extension FavouritesViewController{
    
    //Configure The Table View
    func configureLeagueTableView(){
        
        favouritesLeague.register(UINib(nibName: K.customNibNameLeagues, bundle: nil), forCellReuseIdentifier: K.customNibNameIdentfier)
        
    }
    
    
}

extension FavouritesViewController:UITableViewDelegate,UITableViewDataSource{
    //return suitable height for cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return K.customNibNameLeaguesHeight
    }
    
    
    
    //return number number of cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favouritesLeague.isHidden =   leagueArray?.count == 0 ? true : false
        return leagueArray?.count ?? 0
    }
    
    
    
    
    //return the custmize suitable cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.customNibNameIdentfier, for: indexPath) as! CustomNibCell
        
        cell.delegate = self
        if let league =  leagueArray?[indexPath.row]{
            cell.configureCell(league: league)
        }
        
        return cell
    }
    
    //Action In row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let reachability = try! Reachability()
        reachability.whenReachable = { reachability in
            switch reachability.connection{
       
            case .unavailable:
                print("Unavalibale")
                break
            default:
                if let leagueDetails = self.leagueArray?[indexPath.row]{
                    DependencyProvider.leaugeID = leagueDetails.leagueKey
                    DependencyProvider.leagueDetails = leagueDetails
                    self.navigationController?.pushViewController(DependencyProvider.eventForLeagues, animated: true)
                }
                break
            }
            reachability.stopNotifier()

        }
        reachability.whenUnreachable = { _ in
            self.customAlert(title: "No Internet Detected", message: "This app requires an Internet connection", buttonActionTitleOne: "OK", styleFirstButton: .default, buttonActionTitleTwo: "Cancel", styleSecondtButton:.cancel,okAction: nil,cancel: nil)
           reachability.stopNotifier()

        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
       
    }
    
    
    //Delete Selected League
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            
            customAlert(title: "Remove League From Favourites", message: "Are you sure to Unfavourite this league \n Choose Delete or Cancel",buttonActionTitleOne: "Cancael",styleFirstButton: .default,buttonActionTitleTwo: "Delete",styleSecondtButton: .destructive, okAction:{ action in
                self.leagueCoreData.deleteLeague(index: indexPath.row)
                if let (_,retrivedData) = self.leagueCoreData.retrivedLeagueList(){
                    self.leagueArray = retrivedData
                }
                
                self.favouritesLeague.reloadData()
            })
            
            
        }
        
    }
    
    
    
    
}
extension FavouritesViewController: CustomNibCellProtocol{
    
    
    //Press To youtube Button
    func didTapButtonInCell(_ cell: CustomNibCell) {
        
        guard let indexPath = favouritesLeague.indexPath(for: cell) else { return }
        if let league =  leagueArray?[indexPath.row] {
            let stringWithoutSpaces = league.leagueName.replacingOccurrences(of: " ", with: "")
            if let url = URL(string: "https://www.\(stringWithoutSpaces).com") {
                UIApplication.shared.open(url)
            }
        }
        
        
    }
    
}

//MARK: - Making Custom Alert
extension FavouritesViewController{
    func customAlert(title:String , message:String,buttonActionTitleOne:String,styleFirstButton:UIAlertAction.Style,buttonActionTitleTwo:String,styleSecondtButton:UIAlertAction.Style,okAction: ((UIAlertAction) -> Void)? = nil, cancel: ((UIAlertAction) -> Void)? = nil)->Void{
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: buttonActionTitleOne, style: styleFirstButton){(action) in
            cancel?(action)
        }
        
        let okButton = UIAlertAction(title: buttonActionTitleTwo, style: styleSecondtButton){(action) in
            okAction?(action)
        }
        alert.addAction(cancelAction)
        alert.addAction(okButton)
        
        self.present(alert, animated: true)
        
    }
    
}


