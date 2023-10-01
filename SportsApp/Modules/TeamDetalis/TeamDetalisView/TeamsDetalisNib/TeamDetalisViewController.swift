//
//  TeamDetalisViewController.swift
//  SportsApp
//
//  Created by Mustafa on 27/09/2023.
//

import UIKit
import CoreImage

class TeamDetalisViewController: UIViewController {

    @IBOutlet weak var stadiumImageView: UIImageView!
    @IBOutlet weak var redirerctButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTeamDetalisController()
        
        
                
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
