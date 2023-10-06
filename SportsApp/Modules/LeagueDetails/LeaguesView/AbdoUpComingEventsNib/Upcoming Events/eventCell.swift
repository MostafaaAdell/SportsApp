//
//  eventCell.swift
//  SportsApp
//
//  Created by Abdallah on 30/09/2023.
//

import UIKit
import Kingfisher

class eventCell: UICollectionViewCell {
//    static let ID = String(describing: eventCell.self)
    
    // MARK: - Outlet
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var myImg: UIImageView!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var secondTeamLogo: UIImageView!
    @IBOutlet weak var firstTeamLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 25
        // Initialization code
    }
    
    
   
    // MARK: - configure Nib
    func configure(upCommingEvent:UpCommingEvent) {
        
        
        self.clockLabel.text = upCommingEvent.eventTime
        self.dateLabel.text = upCommingEvent.eventDate
        self.firstTeamName.text = upCommingEvent.eventHomeTeam
        self.firstTeamLogo.kf.setImage(with: URL(string: upCommingEvent.homeTeamLogo ?? K.defaultValuesForImage))
        self.secondTeamLogo.kf.setImage(with: URL(string: upCommingEvent.awayTeamLogo ?? K.defaultValuesForImage))
        self.secondTeamName.text = upCommingEvent.eventAwayTeam
        
        
           }
    }
