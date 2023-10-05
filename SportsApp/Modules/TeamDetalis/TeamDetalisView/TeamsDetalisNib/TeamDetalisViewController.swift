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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTeamDetalisController()
        configureLoadingDataFromApi()
        
        
        
    }
    
    @IBAction func officailWebsiteButton(_ sender: Any) {
       
        if let teamName = teamDetalis?.result.first?.teamName{
            if let url = URL(string: "https://www.\(teamName).com") {
                UIApplication.shared.open(url)
            }
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
    //Getting Data From API
    func configureLoadingDataFromApi(){
        
        viewTEamDetalis?.getDataFromApiForTeamDetails()
        viewTEamDetalis?.handerDataOfTeamDetails = { [weak self] in
            self?.teamDetalis = self?.viewTEamDetalis?.getTeamIdArray()
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
