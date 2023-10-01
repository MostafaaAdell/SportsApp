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
    }
    // MARK: - configure Nib
    func configure(with myImg:String , clockLabel:String , dateLabel:String, firstTeamName: String, firstTeamLogo: String, secondTeamName: String, secondTeamLogo: String , resultLabel:String ,matchStatusLabel:String ) {
        
        self.clockLabel.text = clockLabel
        self.dateLabel.text = dateLabel
        self.myImg.image = UIImage(named: myImg)
        self.firstTeamName.text = firstTeamName
        self.firstTeamLogo.image = UIImage(named: firstTeamLogo)
        self.secondTeamName.text = secondTeamName
        self.secondTeamLogo.image = UIImage(named: secondTeamLogo)
        self.resultLabel.text = resultLabel
        self.matchStatusLabel.text = matchStatusLabel
           }

}
