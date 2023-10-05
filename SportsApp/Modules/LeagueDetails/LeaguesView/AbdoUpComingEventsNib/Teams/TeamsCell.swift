//
//  TeamsCell.swift
//  SportsApp
//
//  Created by Abdallah on 30/09/2023.
//

import UIKit
import Kingfisher

class TeamsCell: UICollectionViewCell {
    
    // MARK: - Outlet
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myView.layer.cornerRadius = 8
        self.layer.cornerRadius = 25

        
        // Initialization code
    }
    
    // MARK: - configure Nib
    func configure(team:TeamModel) {
        self.teamNameLabel.text = team.teamName
        self.teamLogo.kf.setImage(with: URL(string: team.teamLogo ?? K.defaultValuesForImage))
        
           }
    }
