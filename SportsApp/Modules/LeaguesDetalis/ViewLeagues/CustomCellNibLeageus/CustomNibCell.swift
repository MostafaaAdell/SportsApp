//
//  CustomNibCell.swift
//  SportsApp
//
//  Created by Mustafa on 27/09/2023.
//

import UIKit

class CustomNibCell: UITableViewCell {

    @IBOutlet weak var redirectYoutubeButton: UIButton!
    @IBOutlet weak var detalisLeagueLabel: UILabel!
    @IBOutlet weak var logoLeageuImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
