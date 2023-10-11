//
//  TeamDetalisViewController.swift
//  SportsApp
//
//  Created by Mustafa on 27/09/2023.
//

import UIKit
import CoreImage
import Kingfisher

class TeamDetalisViewController: UIViewController {
  
    
    @IBOutlet weak var playerCollectionView: UICollectionView!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamStadiumName: UILabel!
    @IBOutlet weak var stadiumImageView: UIImageView!
    @IBOutlet weak var redirerctButton: UIButton!
    
    var viewTEamDetalis:TeamDetailsProtocol?
    var teamDetalis:TeamDetailsModel?{
        didSet{
            teamLogo.kf.setImage(with: URL(string: teamDetalis?.result.first?.teamLogo ?? K.defaultValuesForImage))
            teamName.text = teamDetalis?.result.first?.teamName
            teamStadiumName.text = "\(teamDetalis?.result.first?.teamName ?? "") Stadium"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)

    }
    
    // MARK: - Congigure View Didload

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTeamDetalisController()
        configureLoadingDataFromApi()
        ConfigureDelegationAndDataSource()
        
        
        
    }
    // MARK: - Congigure Navigate to the Website
    @IBAction func officailWebsiteButton(_ sender: Any) {
       
        if let teamName = teamDetalis?.result.first?.teamName{
         let  url = URL(string: "https://www.\(teamName).com")
         UIApplication.shared.open(url ?? URL(string: K.defaultPermiumLeagueLink)!)
            
        }
    }
    
}


//MARK: - Set Function To Configure My UI ViewControler
extension TeamDetalisViewController {
    
    
    func configureTeamDetalisController(){
        
        //Set Button text Aligment in list And Symbol Image in right Image
        redirerctButton.semanticContentAttribute = .forceRightToLeft
        
        // make the image Transparent from The Top and bottom
        stadiumImageView.gradientImageFromTopAndBottom()
        
    }
    //MARK:- Getting Data From API
    func configureLoadingDataFromApi(){
        
        viewTEamDetalis?.getDataFromApiForTeamDetails()
        viewTEamDetalis?.handerDataOfTeamDetails = { [weak self] in
            self?.teamDetalis = self?.viewTEamDetalis?.getTeamIdArray()
            DispatchQueue.main.async {
                self?.playerCollectionView.reloadData()
            }
        }
        
    }
    
}
//MARK: - Edit UI UIImageView
extension UIImageView {
    
    func gradientImageFromTopAndBottom(){
        let gradient1 = CAGradientLayer()
        gradient1.startPoint = CGPoint(x: 0.0, y: 0)
        gradient1.endPoint = CGPoint(x: 0.0, y: 1)
        let whiteColor = UIColor.white
        gradient1.colors = [whiteColor.withAlphaComponent(0.0).cgColor, whiteColor.withAlphaComponent(1.0).cgColor, whiteColor.withAlphaComponent(0.0).cgColor]
        gradient1.locations = [NSNumber(value: 0.0), NSNumber(value: 0.5), NSNumber(value: 1)]
        gradient1.frame = self.bounds
        self.layer.mask = gradient1
        
    }
    
}


//MARK: - Delegation And DAta Source For Player
extension TeamDetalisViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func ConfigureDelegationAndDataSource(){
        
        playerCollectionView.delegate = self
        playerCollectionView.dataSource = self
        playerCollectionView.register(UINib(nibName: K.playerDetailsNibCell, bundle: nil), forCellWithReuseIdentifier: K.playerDetailsNibCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamDetalis?.result.first?.players?.count ?? 0 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.playerDetailsNibCell, for: indexPath) as! PlayerDetailsCell
        if let playerDetails = teamDetalis?.result.first?.players?[indexPath.row]{
            cell.ConfiguePlayerDetails(playerDetails: playerDetails)
            
        }
        
        return cell
        
    }
    
}
