//
//  TabCustomCell.swift
//  SportsApp
//
//  Created by Mustafa on 27/09/2023.
//

import UIKit

class TabCustomCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configure(with imageName: String , titleText: String) {
        if let iconImage = imgView {iconImage.image = UIImage(named: imageName)}
        if let titleLabel = myLabel {
            titleLabel.text = titleText
        }
    }
}
