//
//  CustomNibCell.swift
//  SportsApp
//
//  Created by Mustafa on 27/09/2023.
//

import UIKit
import Kingfisher

protocol CustomNibCellProtocol:AnyObject{
    func didTapButtonInCell(_ cell: CustomNibCell)
    
}

class CustomNibCell: UITableViewCell {
    weak var delegate:CustomNibCellProtocol?
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
    
    
    func configureCell(league:Leagues){
        detalisLeagueLabel.text = league.leagueName
        
        if let urlLogo = league.leagueLogo{
            if urlLogo.contains(".png"){
                
                logoLeageuImage.kf.setImage(with:  URL(string: urlLogo))
                
            }
        }
        
    }
    
    @IBAction func redirectToLeagueWebsite(_ sender: UIButton) {
        delegate?.didTapButtonInCell(self)
    }
    
}
