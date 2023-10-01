//
//  TeamsCell.swift
//  SportsApp
//
//  Created by Abdallah on 30/09/2023.
//

import UIKit

class TeamsCell: UICollectionViewCell {
    
    // MARK: - Outlet
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myView.layer.cornerRadius = 8
        // Initialization code
    }
    
    // MARK: - configure Nib
    func configure(with teamLogo:String , teamNameLabel:String ) {
        self.teamNameLabel.text = teamNameLabel
        self.teamLogo.image = UIImage(named: teamLogo)
        
           }
    }
