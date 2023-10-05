//
//  latestEventCell.swift
//  SportsApp
//
//  Created by Abdallah on 30/09/2023.
//

import UIKit

class latestEventCell: UICollectionViewCell {
    
    // MARK: - Outlet
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstTeamLogo: UIImageView!
    @IBOutlet weak var myImg: UIImageView!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var matchStatusLabel: UILabel!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var secondTeamLogo: UIImageView!
    @IBOutlet weak var firstTeamName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 25
    }
    // MARK: - configure Nib
    func configure(event:latestEvent ) {
  
        
        self.clockLabel.text = event.eventTime
        self.dateLabel.text = event.eventDate
        self.firstTeamName.text = event.eventHomeTeam
        self.firstTeamLogo.kf.setImage(with:URL(string: event.homeTeamLogo) )
        self.secondTeamName.text = event.eventAwayTeam
        self.secondTeamLogo.kf.setImage(with: URL(string: event.awayTeamLogo))
        self.resultLabel.text = event.eventFinalResult
        self.matchStatusLabel.text = K.matchStatue
         
    }

}
