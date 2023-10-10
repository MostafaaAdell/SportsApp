//
//  PlayerDetailsCell.swift
//  SportsApp
//
//  Created by Mustafa on 10/10/2023.
//

import UIKit
import Kingfisher

class PlayerDetailsCell: UICollectionViewCell {
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func ConfiguePlayerDetails(playerDetails:Player){
        
        self.playerName.text = playerDetails.playerName
        self.playerPosition.text = playerDetails.playerType.rawValue
        if let playerImage = playerDetails.playerImage{
            self.playerImage.kf.setImage(with: URL(string: playerImage))
        }
        
        
        
    }
}
