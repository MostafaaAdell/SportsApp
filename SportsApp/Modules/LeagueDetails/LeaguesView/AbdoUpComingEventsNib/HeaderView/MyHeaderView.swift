//
//  MyHeaderView.swift
//  SportsApp
//
//  Created by Abdallah on 01/10/2023.
//

import UIKit

class MyHeaderView: UICollectionReusableView {
    @IBOutlet weak var myHeaderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var title : String? {
        didSet{
            myHeaderLabel.text = title
        }
    }
    
}
